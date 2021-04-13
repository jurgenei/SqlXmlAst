--------------------------------------------------------
--  DDL for Trigger TR_EXPOSURE_CLASS
--------------------------------------------------------

CREATE OR REPLACE EDITIONABLE TRIGGER   TR_EXPOSURE_CLASS  
AFTER INSERT OR UPDATE OR DELETE
ON exposure_class
BEGIN
   UPDATE distribution_last_changed
      SET last_changed = SYSTIMESTAMP
    WHERE  source_table = 'exposure_class';
   IF SQL%ROWCOUNT = 0 THEN

   BEGIN
      INSERT INTO distribution_last_changed
        ( SELECT 'exposure_class' ,
                 SYSTIMESTAMP 
            FROM DUAL  );

   END;
   END IF;

END;

/
ALTER TRIGGER   TR_EXPOSURE_CLASS  ENABLE;
