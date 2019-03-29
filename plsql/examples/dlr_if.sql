BEGIN
  $IF $$debug_on = 1 $THEN
    dbms_output.put_line(' Call vic_01_retrieve_check : ' || SQL%rowcount);
  $END
   UTILITIES.log_msg(v_procname => V_PROC_NAME,  v_label => 'end' ) ; 
END;
/
BEGIN
  $IF $$debug_on = 1 $THEN
    dbms_output.put_line(' Call vic_01_retrieve_check : ' || SQL%rowcount);
  $ELSE
    dbms_output.put_line(' Call vic_01_retrieve_check : ' || SQL%rowcount);  
  $END
   UTILITIES.log_msg(v_procname => V_PROC_NAME,  v_label => 'end' ) ; 
END;
/
