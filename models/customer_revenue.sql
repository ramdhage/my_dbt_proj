{{ config(materialized='table') }}
WITH CUSTOMER_REVENUE AS (
SELECT C.CUSTOMERID,
       CONCAT(C.FIRSTNAME, ' ', C.LASTNAME) AS CUSTOMERNAME,
       COUNT(O.ORDERID) AS ORDERCOUNT,
       SUM(OI.QUANTITY * OI.UNITPRICE) AS REVENUE
  FROM L1_LANDING.CUSTOMERS C
  JOIN L1_LANDING.ORDERS O ON C.CUSTOMERID = O.CUSTOMERID
  JOIN L1_LANDING.ORDERITEMS OI ON O.ORDERID = OI.ORDERID
  GROUP BY C.CUSTOMERID, CUSTOMERNAME
  ORDER BY REVENUE DESC
)
SELECT CUSTOMERID, CUSTOMERNAME, ORDERCOUNT, REVENUE
 FROM CUSTOMER_REVENUE