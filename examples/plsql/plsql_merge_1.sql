/* simple plsql merge case
   from: https://oracle-base.com/articles/9i/merge-statement */
MERGE
INTO  employees e
USING hr_records h
ON    (e.id = h.emp_id)
WHEN MATCHED THEN
  UPDATE SET e.address = h.address
WHEN NOT MATCHED THEN
  INSERT (id, address) VALUES (h.emp_id, h.address)
;