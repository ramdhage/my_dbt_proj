
  create or replace   view SLEEKMART_OMS.L2_PROCESSING.orders_stg
  
   as (
    SELECT OrderID,
       OrderDate,
       CustomerID,
       EmployeeID,
       StoreID,
       Status AS StatusCD,
       CASE
          WHEN Status = '1' THEN 'In Progress'
          WHEN Status = '2' THEN 'Completed'
          WHEN Status = '3' THEN 'Cancelled'
          ELSE NULL
       END AS StatusDesc,
       Updated_at
  FROM L1_LANDING.ORDERS
  );

