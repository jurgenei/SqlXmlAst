INSERT INTO upload_log
    ( log_date, system_id, reporting_date, nestlevel, label, activity, proc_name, DESCRIPTION, startpack_type, batch_id )
    ( SELECT SYSTIMESTAMP ,
             repd.system_id ,
             repd.reporting_date ,
             v_used_nestlevel - 1 ,
             v_label ,
             v_activity ,
             v_used_procname ,
             CASE --description
              WHEN v_label IN ( 'start','end' )
               THEN ' '
             ELSE v_description
                END col ,
             starters_package_type ,
             batch_id
      FROM reporting_date_system_id repd
       FETCH FIRST 1 ROWS ONLY -- fetch_clause
        );