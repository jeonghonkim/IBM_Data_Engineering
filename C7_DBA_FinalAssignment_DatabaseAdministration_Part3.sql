-- DROP PERVIOUS VIEW
DROP VIEW basicbilldetails;

-- CREATE A VIEW
CREATE VIEW basicbilldetails AS
SELECT customerid, month, billedamount
FROM BILLING;

SELECT * FROM basicbilldetails;

-- BASELINE QUERY PERFORMANCE
SELECT * FROM BILLING WHERE billedamount = 19929;
-- 0.015 s

-- CREATE AN INDEX
CREATE INDEX billingamount
ON BILLING (billedamount);

-- IMPROVEMNET IN QUERY PERFORMANCE AFTER INDEX 
SELECT * FROM BILLING WHERE billedamount = 19929;
-- 0.005 s
