create or replace PROCEDURE determine_cover_start_date AS

    v_procname                   pkg_subtype.procedure_name;
    v_error                      NUMBER(12);
    v_rowcount                   NUMBER(12);
    v_exception_type             pkg_subtype.exception_type;
    v_activity_code              pkg_subtype.activity_code;
    v_solution_code              pkg_subtype.solution_code;
    v_is_active                  pkg_subtype.indicator;
    v_exception_category         pkg_subtype.exception_category;
    v_exception_code             pkg_subtype.exception_code;
    v_perl_exception_ind         VARCHAR2(3 CHAR);
    v_simple_indicator           pkg_subtype.indicator;
    v_descr                      VARCHAR2(100 CHAR);
    v_system_id                  pkg_subtype.system_id;
    v_reporting_date             pkg_subtype.dsa_reporting_date;
    v_starters_package_version   VARCHAR2(10 CHAR);

BEGIN
    v_procname := $$plsql_unit;
    utilities.log_msg(v_procname,'start');

   -- get cover_id and cover_start_date, for this system_id, from historical table
   -- cover_start_date. Table cover_start_date is initial created and populated with data from
   -- datawarehouse table dwh_cover
    utilities.truncate_table('system_csd');
    BEGIN
        INSERT INTO system_csd (
            cover_id,
            cover_start_date
        )
            SELECT
                cover_id,
                cover_start_date
            FROM
                cover_start_date
            WHERE
                system_id = (
                    SELECT
                        system_id
                    FROM
                        reporting_date_system_id
                )
            ORDER BY
                cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    -- Oracle migration: Index creation is moved to table system_csd ddl

    utilities.truncate_table('tt_cover_perc');
    BEGIN
        INSERT INTO tt_cover_perc (
            cover_id,
            facility_id,
            cover_type,
            cover_amt_credit_risk,
            cover_perc_credit_risk,
            cover_amt_trans_risk,
            cover_perc_trans_risk,
            cover_ccy_credit_risk,
            booking_office,
            expiry_date,
            cover_provider_id,
            security_id,
            security_id_type,
            currency,
            cover_country,
            override_factor,
            shift_risk_country_indicator,
            reporting_date,
            generated_record
        )
            SELECT
                a.cover_id,
                a.facility_id,
                a.cover_type,
                CAST(nvl(vca1.cover_amount,0) AS NUMBER(22,2) ) AS cover_amt_credit_risk,
                CAST(nvl(vca1.cover_percentage,0) AS NUMBER(22,2) ) AS cover_perc_credit_risk,
                CAST(nvl(vca2.cover_amount,0) AS NUMBER(22,2) ) AS cover_amt_trans_risk,
                CAST(nvl(vca2.cover_percentage,0) AS NUMBER(22,2) ) AS cover_perc_trans_risk,
                vca1.currency AS cover_ccy_credit_risk,
                a.booking_office,
                a.expiry_date,
                a.cover_provider_id,
                a.security_id,
                a.security_id_type,
                vca1.currency,
                CAST(a.cover_country AS VARCHAR2(3 CHAR) ) cover_country,
                a.override_factor,
                a.shift_risk_country_indicator,
                reporting_date,
                generated_record
            FROM
                valid_cover a
                JOIN valid_cover_amount vca1 ON vca1.cover_id = a.cover_id
                 AND vca1.amount_type = 'CCRB'
                JOIN valid_cover_amount vca2 ON vca2.cover_id = a.cover_id
                 AND vca2.amount_type = 'CTRB'
            ORDER BY
                a.cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

   -- default all amount values to 0 if NULL.
   -- calculate current_age in year fraction.
   -- determine status of the cover: I == is new; insert new row cover_start_date
   --                                U == reporting_date is before cover_start_date; update date
   --                                N == do nothing; just get date from cover_start_date

    utilities.truncate_table('tt_cover_age');
    BEGIN
        INSERT INTO tt_cover_age (
            cover_id,
            facility_id,
            cover_type,
            cover_amt_credit_risk,
            cover_perc_credit_risk,
            cover_amt_trans_risk,
            cover_perc_trans_risk,
            cover_ccy_credit_risk,
            booking_office,
            expiry_date,
            cover_provider_id,
            security_id,
            security_id_type,
            currency,
            cover_country,
            override_factor,
            shift_risk_country_indicator,
            cover_start_date,
            current_age,
            status,
            generated_record
        )
            SELECT
                a.cover_id,
                a.facility_id,
                a.cover_type,
                a.cover_amt_credit_risk,
                a.cover_perc_credit_risk,
                a.cover_amt_trans_risk,
                a.cover_perc_trans_risk,
                a.cover_ccy_credit_risk,
                a.booking_office,
                a.expiry_date,
                a.cover_provider_id,
                a.security_id,
                a.security_id_type,
                a.currency,
                a.cover_country,
                a.override_factor,
                a.shift_risk_country_indicator,
                nvl(b.cover_start_date,reporting_date) AS cover_start_date,
                CASE
                        WHEN (
                            b.cover_start_date >= a.reporting_date
                            OR b.cover_start_date IS NULL
                        ) THEN 0.00
                --else 	utils.datediff(DD,b.cover_start_date,a.reporting_date) / 365.0
                        ELSE ( trunc(a.reporting_date) - trunc(b.cover_start_date) ) / 365.0
                    END
                AS current_age,
                CASE
                        WHEN b.cover_start_date IS NULL THEN 'I'
                        WHEN b.cover_start_date > a.reporting_date THEN 'U'
                        ELSE 'N'
                    END
                AS status,
                a.generated_record
            FROM
                tt_cover_perc a
                LEFT OUTER JOIN system_csd b ON a.cover_id = b.cover_id
            ORDER BY
                a.cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

   -- get cluster criterion in order to get cluster properties
   -- get min and max period ; ie boundaries for interpolation
   -- execute formula

    utilities.truncate_table('tt_cluster_1');
    BEGIN
        INSERT INTO tt_cluster_1 (
            cover_id,
            default_product_type,
            booking_office,
            country_of_residence,
            cover_type,
            cover_start_date,
            current_age
        )
            SELECT
                a.cover_id,
                f.default_product_type,
                a.booking_office,
                d.country_of_residence,
                a.cover_type,
                e.cover_start_date,
                e.current_age
            FROM
                valid_cover a
                JOIN valid_facility b ON a.facility_id = b.facility_id
                JOIN valid_customer d ON d.customer_id = a.cover_provider_id
                JOIN current_facility_type f ON b.facility_type = f.code
                JOIN tt_cover_age e ON a.cover_id = e.cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    utilities.truncate_table('cluster_2');
    
    BEGIN
        INSERT INTO cluster_2 (
            cover_id,
            current_age,
            country_cluster_asset_curve,
            cover_type_cluster_asset_curve,
            office_cluster_asset_curve,
            product_cluster_asset_curve
        )
            SELECT
                cover_id,
                current_age,
                country_cluster_asset_curve,
                cover_type_cluster_asset_curve,
                office_cluster_asset_curve,
                product_cluster_asset_curve
            FROM
                tt_cluster_1 a
                JOIN current_country_cluster b ON a.country_of_residence = b.country_code
                JOIN current_cover_type_cluster c ON a.cover_type = c.cover_type
                JOIN current_office_cluster d ON a.booking_office = d.office_code
                JOIN current_product_type_cluster e ON a.default_product_type = e.product_type;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    utilities.truncate_table('tt_cluster_3');
    
    BEGIN
        INSERT INTO tt_cluster_3 (
            cover_id,
            max_period,
            min_period,
            current_age,
            country_cluster_asset_curve,
            cover_type_cluster_asset_curve,
            office_cluster_asset_curve,
            product_cluster_asset_curve
        )
            SELECT
                cover_id,
                (
                    SELECT
                        MIN(period)
                    FROM
                        current_asset_valuation_curve b
                    WHERE
                        a.product_cluster_asset_curve = b.product_cluster
                        AND   a.country_cluster_asset_curve = b.country_cluster
                        AND   a.office_cluster_asset_curve = b.office_cluster
                        AND   a.cover_type_cluster_asset_curve = b.cover_type_cluster
                        AND   b.period >= a.current_age
                ) AS max_period,
                (
                    SELECT
                        MAX(period)
                    FROM
                        current_asset_valuation_curve b
                    WHERE
                        a.product_cluster_asset_curve = b.product_cluster
                        AND   a.country_cluster_asset_curve = b.country_cluster
                        AND   a.office_cluster_asset_curve = b.office_cluster
                        AND   a.cover_type_cluster_asset_curve = b.cover_type_cluster
                        AND   b.period <= a.current_age
                ) AS min_period,
                current_age,
                country_cluster_asset_curve,
                cover_type_cluster_asset_curve,
                office_cluster_asset_curve,
                product_cluster_asset_curve
            FROM
                cluster_2 a;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    utilities.truncate_table('cluster_4');
    
    BEGIN
        INSERT INTO cluster_4 (
            cover_id,
            cover_reduction_value
        )
            SELECT
                cover_id,
                CASE
                        WHEN ( max_period - min_period ) = 0 THEN b.percentage_of_initial_value
                        ELSE c.percentage_of_initial_value + ( ( b.percentage_of_initial_value - c.percentage_of_initial_value ) * ( ( current_age - min_period ) / ( max_period
- min_period ) ) )
                    END
                AS cover_reduction_value
            FROM
                tt_cluster_3 a
                JOIN current_asset_valuation_curve b ON a.product_cluster_asset_curve = b.product_cluster
                                                        AND a.country_cluster_asset_curve = b.country_cluster
                                                        AND a.office_cluster_asset_curve = b.office_cluster
                                                        AND a.cover_type_cluster_asset_curve = b.cover_type_cluster
                                                        AND a.max_period = b.period
                JOIN current_asset_valuation_curve c ON a.product_cluster_asset_curve = c.product_cluster
                                                        AND a.country_cluster_asset_curve = c.country_cluster
                                                        AND a.office_cluster_asset_curve = c.office_cluster
                                                        AND a.cover_type_cluster_asset_curve = c.cover_type_cluster
                                                        AND a.min_period = c.period
            ORDER BY
                cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

   -- collect all data. This is much more then required by change request 285.
   -- but a preparation for cover_allocation.
   -- the last two queries update the cover_start_date.

    SELECT
        system_id,
        reporting_date
    INTO
        v_system_id,v_reporting_date
    FROM
        reporting_date_system_id;

    utilities.truncate_table('valid_cover_extract');
    BEGIN
        INSERT INTO valid_cover_extract (
            cover_id,
            facility_id,
            cover_type,
            cover_amt_credit_risk,
            cover_amt_trans_risk,
            cover_perc_credit_risk,
            cover_perc_trans_risk,
            cover_amt_credit_risk_org,
            cover_amt_trans_risk_org,
            booking_office,
            expiry_date,
            override_factor,
            cover_country,
            shift_risk_country_indicator,
            cover_start_date,
            security_id,
            security_id_type,
            cover_ccy_credit_risk,
            cover_provider_id
        )
            SELECT
                a.cover_id,
                facility_id,
                cover_type,
                CAST(nvl(cover_amt_credit_risk * cover_reduction_value,0) AS NUMBER(22,2) ) AS cover_amt_credit_risk,
                CAST(nvl(cover_amt_trans_risk * cover_reduction_value,0) AS NUMBER(22,2) ) AS cover_amt_trans_risk,
                cover_perc_credit_risk,
                cover_perc_trans_risk,
                cover_amt_credit_risk AS cover_amt_credit_risk_org,
                cover_amt_trans_risk AS cover_amt_trans_risk_org,
                booking_office,
                expiry_date,
                override_factor,
                cover_country,
                shift_risk_country_indicator,
                cover_start_date,
                b.security_id,
                b.security_id_type,
                b.cover_ccy_credit_risk,
                b.cover_provider_id
            FROM
                cluster_4 a
                JOIN tt_cover_age b ON a.cover_id = b.cover_id
            ORDER BY
                a.cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            raise;
    END;

    BEGIN
        INSERT INTO cover_start_date (
            cover_id,
            system_id,
            cover_start_date,
            changed_indicator
        )
            SELECT
                cover_id,
                v_system_id,
                cover_start_date,
                'Y'
            FROM
                tt_cover_age
            WHERE
                status = 'I'
                AND   generated_record IS NULL;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;
      --US-594 - Fill Cover Start Date for Revenue Sharing Covers based on Original Cover Start Date determination
      --Additional Details: https://confluence.europe.intranet/x/qaHQB

    BEGIN
        INSERT INTO cover_start_date (
            cover_id,
            system_id,
            cover_start_date,
            changed_indicator
        )
            SELECT
                cm.generated_cover_id,
                a.system_id,
                a.cover_start_date,
                a.changed_indicator
            FROM
                cover_start_date a
                INNER JOIN valid_cover nc ON a.cover_id = nc.cover_id
                INNER JOIN cover_id_mapping cm ON nc.cover_id = cm.original_cover_id;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    BEGIN
        MERGE INTO valid_cover_extract USING ( SELECT
            a.rowid AS row_id,
            b.cover_start_date
                                               FROM
            valid_cover_extract a
            INNER JOIN cover_start_date b ON a.cover_id = b.cover_id
            INNER JOIN cover_id_mapping cm ON b.cover_id = cm.generated_cover_id
        )
        src ON ( valid_cover_extract.rowid = src.row_id )
        WHEN MATCHED THEN UPDATE SET valid_cover_extract.cover_start_date = src.cover_start_date;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;
      --VST-7815 Vortex Processing Business: dwh_cover.cover_start_date can be wrong when systems are not loaded in reporting date order
      --https://jira.europe.intranet/browse/VST-7815

    BEGIN
        MERGE INTO valid_cover_extract USING ( SELECT
            a.rowid AS row_id,
            b.reporting_date
                                               FROM
            valid_cover_extract a
            INNER JOIN valid_cover b ON a.cover_id = b.cover_id
                                               WHERE
            b.system_id = v_system_id
            AND   a.cover_start_date > b.reporting_date
        )
        src ON ( src.row_id = valid_cover_extract.rowid )
        WHEN MATCHED THEN UPDATE SET valid_cover_extract.cover_start_date = src.reporting_date;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;

    BEGIN
        MERGE INTO cover_start_date USING ( SELECT
            a.rowid AS row_id,
            v_reporting_date AS reporting_date,
            'Y' AS changed_ind
                                            FROM
            cover_start_date a
            JOIN tt_cover_age b ON a.cover_id = b.cover_id
                                   AND a.system_id = v_system_id
                                            WHERE
            b.status = 'U'
            AND   generated_record IS NULL
        )
        src ON ( cover_start_date.rowid = src.row_id )
        WHEN MATCHED THEN UPDATE SET cover_start_date.cover_start_date = src.reporting_date,
        cover_start_date.changed_indicator = src.changed_ind;

    EXCEPTION
        WHEN OTHERS THEN
            utils.handleerror(sqlcode,sqlerrm);
    END;
   -- STRY0237695: Exception code move from create_exceptions_col_step2
   -------------------
   ---STARTDATRDF - STRY0149603
   -------------------

    SELECT
        system_id,
        reporting_date,
        starters_package_version
    INTO
        v_system_id,v_reporting_date,v_starters_package_version
    FROM
        reporting_date_system_id;

    v_perl_exception_ind := 'EXC';
    IF
        ( v_starters_package_version <> '2.2' )
    THEN
        BEGIN
            v_exception_code := 'STARTDATRDF';
            v_exception_category := 'COL';
            v_solution_code := 'DEFAULTED';-- add exception code once defined
            BEGIN
                utilities.get_exception_info(v_exception_code,v_exception_category,v_system_id,v_reporting_date,v_exception_type,v_activity_code,
v_solution_code,v_is_active);
            EXCEPTION
                WHEN OTHERS THEN
                    utils.handleerror(sqlcode,sqlerrm);
            END;

            IF
                v_is_active = 'Y'
            THEN
                BEGIN
                    v_descr := '--create exceptions for code: '
                    || v_exception_code
                    || ', exception category: '
                    || v_exception_category;
                    utilities.log_msg(v_procname,'info','v_descr');
                    BEGIN
                        INSERT INTO exception (
                            system_id,
                            reporting_date,
                            exception_category,
                            exception_type,
                            exception_code,
                            activity_code,
                            solution_code,
                            local_customer_id,
                            facility_id,
                            cover_id,
                            outstanding_id,
                            local_value,
                            icrm_value,
                            additional_information,
                            row_id
                        )
                            SELECT
                                v_system_id,
                                v_reporting_date,
                                v_exception_category,
                                v_exception_type,
                                v_exception_code,
                                v_activity_code,
                                v_solution_code,
                                NULL,   --customer_id
                                rc.facility_id,   --facility_id
                                rc.cover_id,       --cover_id
                                rc.local_outstanding_id, --outstanding_id
                                NULL,       --local
                                vce.cover_start_date,       --icrm
                                'Cover start date is defaulted to '
                                || TO_CHAR(vce.cover_start_date,'MM/DD/YYYY'), --additional
                                rc.raw_cover_id  --rowid
                            FROM
                                raw_cover rc
                                JOIN valid_cover_extract vce ON rc.cover_id = vce.cover_id
                            WHERE
                                rc.cover_start_date IS NULL;

                    EXCEPTION
                        WHEN OTHERS THEN
                            utils.handleerror(sqlcode,sqlerrm);
                    END;

                END;
            END IF;

        END;
    END IF;
   --if
   --starters_package_version
   -- finally drop all work tables
   --Oracle migration: all temp tables are now global temprary tables

    utilities.log_msg(v_procname,'end');
EXCEPTION
    WHEN OTHERS THEN
        utils.handleerror(sqlcode,sqlerrm);
END;
/
show error;