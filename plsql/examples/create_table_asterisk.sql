 CREATE GLOBAL TEMPORARY TABLE TT_META_DOMAIN_TABLE_DEFAULT
   (	DOMAIN_TABLE_NAME VARCHAR2(10 BYTE),
	DEFAULT_UNKNOWN_CODE VARCHAR2(10 BYTE),
	DEFAULT_UNKNOWN_DESCR VARCHAR2(10 BYTE),
	DEFAULT_UNKNOWN_KEY NUMBER(*,0)
   ) ON COMMIT PRESERVE ROWS ;