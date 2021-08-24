  CREATE TABLE WORK_AGREEMENT_X_AGREEMENT_ROLE
   (	AGREEMENT_X_AGREEMENT_ROLE_KEY NUMBER NOT NULL ENABLE,
	CODE VARCHAR2(50 CHAR) COLLATE USING_NLS_COMP NOT NULL ENABLE,
	DESCRIPTION VARCHAR2(200 CHAR) COLLATE USING_NLS_COMP NOT NULL ENABLE,
	RECORD_VALID_FROM DATE NOT NULL ENABLE,
	RECORD_VALID_UNTIL DATE,
	LEVEL_NUMBER NUMBER,
	HIGHER_LEVEL_KEY NUMBER,
	HIGHEST_LEVEL_KEY NUMBER
   )  DEFAULT COLLATION USING_NLS_COMP ;