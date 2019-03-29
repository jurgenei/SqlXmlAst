--------------------------------------------------------
--  DDL for Procedure DB_SIZES
--------------------------------------------------------
set define off;

  CREATE OR REPLACE EDITIONABLE PROCEDURE "DB_SIZES" (
    v_db_name   IN VARCHAR2,
    v_return_string IN OUT VARCHAR2
) AS

    v_sys_error   NUMBER := 0;
   /*******************************************************************************
   * Project    : Vortex - Wholesale
   * Object     : db_sizes
   * Parameters : db_name       = Database name of which to determine the usage
   *            : return_string = Output line used for processing
   *
   * Description: Returns string with db size / free space for logging
   *
   *  Release  Date      Author  Description
   *  -------  --------  ------  --------------------------------------------------
   *  1.00     20080507  VdR     Creation.
   ********************************************************************************
   *  7.9.0    20100810  DvV     Code update.
   *******************************************************************************/
   /*        Setting up enviroment:
   **        Declaring local variables.
   **********~*******************************************************************/
    v_psize       FLOAT;
    v_dbid        NUMBER(12);
    v_err         NUMBER(12);
    v_rc          NUMBER(12);
    v_dbsize      NUMBER(
        15, 2
    );
    v_freespace   NUMBER(
        15, 2
    );
    v_errmsg      VARCHAR2(2048);
BEGIN

   /*        STEP-1:
   **        Retrieve total size values.
   **********~*******************************************************************/
    BEGIN
        SELECT --b.tablespace_name,
         round(
            SUM(tbs_size),
            2
        ) sizemb,
               round(
            SUM(a.free_space),
            2
        ) freemb INTO
            v_dbsize, v_freespace
        FROM (
            SELECT tablespace_name,
                   round(
                SUM(bytes) / 1024 / 1024,
                2
            ) AS free_space
            FROM user_free_space
            GROUP BY tablespace_name
        ) a,
             (
            SELECT tablespace_name,
                   SUM(bytes) / 1024 / 1024 AS tbs_size
            FROM user_segments
            GROUP BY tablespace_name
            /*UNION
            SELECT tablespace_name,
                   SUM(bytes) / 1024 / 1024 tbs_size
            FROM dba_temp_files
            GROUP BY tablespace_name*/
        ) b
        WHERE a.tablespace_name (+) = b.tablespace_name
              AND   b.tablespace_name IN (
            SELECT tablespace_name
            FROM user_tablespaces
            WHERE contents =
                CASE
                    WHEN upper(v_db_name) = 'TEMP' THEN
                        'TEMPORARY'
                    ELSE 'PERMANENT'
                END
                  AND   tablespace_name NOT IN (
                'SYSTEM',
                'SYSAUX',
                'DBFS'
            )
        );

    EXCEPTION
        WHEN OTHERS THEN
            RAISE exception_util.err_get_spaces;
    END;
   /*        STEP-3:
   **        Fill output variable.
   **********~*******************************************************************/

    v_return_string   := 'database name: ' || v_db_name || '   // size: ' || v_dbsize || ' MB   // free space: ' || v_freespace || ' MB';
   /*        Done:
   **        Finish and Return.
   **********~*******************************************************************/

EXCEPTION
    WHEN OTHERS THEN
        utils.handleerror(
            sqlcode,
            sqlerrm
        );
END db_sizes;


/
