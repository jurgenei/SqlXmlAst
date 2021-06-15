-- comment
/* simple plsql */
/* insert/select case */
INSERT
/* this too */
/* and this too */
-- comment
INTO   contacts (contact_id, last_name, first_name)
-- comment
/* and this too */
SELECT customer_id, last_name, first_name
FROM   customers
WHERE  customer_id = '123';
/* comment at the end */
