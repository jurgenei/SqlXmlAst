--------------------------------------------------------
--  DDL for View VW_DATA_VALIDATE
--------------------------------------------------------

  CREATE OR REPLACE EDITIONABLE VIEW "VW_DATA_VALIDATE" ("ORA_SOURCE", "SYBASE_SOURCE", "ORA_TAB_NAME", "ORA_COL_NAME", "ORACLE_RESULT", "SYBASE_RESULT", "STATUS", "FUN_APP") AS select ora_source,sybase_source,ora_tab_name,ora_col_name,Oracle_Result,Sybase_Result,Status,fun_app from
( 
select a.source as Ora_source,b.source as sybase_source,a.table_name as ora_tab_name,a.col_name as ora_col_name,a.RESULT as Oracle_Result,b.RESULT as Sybase_Result,'True' as Status,
a.function_applied as fun_app
from spd_target_tab a,spd_target_tab b
where a.table_name = b.table_name
and a.col_name = b.col_name
and a.RESULT = b.RESULT
and a.source ='ORACLE'
and b.source ='SYBASE_ASE'
--and a.function_applied ='VW_COUNT'
union all
select a.source as Ora_source,b.source as sybase_source,a.table_name as ora_tab_name,a.col_name as ora_col_name,a.RESULT as Oracle_Result,b.RESULT as Sybase_Result,'False' as Status,
a.function_applied as fun_app
from spd_target_tab a,spd_target_tab b
where a.table_name = b.table_name
and a.col_name = b.col_name
and a.RESULT <> b.RESULT
and a.source ='ORACLE'
and b.source ='SYBASE_ASE'
--and a.function_applied ='VW_COUNT'
);
/
