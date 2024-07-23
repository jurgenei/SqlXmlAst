select q'^truncate table FACT_IFRS_OUTSTNG_GRP_STG_FLOW ^' from dual;
select q'[truncate table FACT_IFRS_OUTSTNG_GRP_STG_FLOW ]' from dual;
    v_debug_msg := $$plsql_line || 'OF PLSQL UNIT' || $$plsql_unit || '     ' || '  Count of tt_pp_limit_amount_weight_First_Insertion  ' || SQL%
rowcount;
select nvl(v_basel_retail_exposure_treshold, 1e6) from dual;
