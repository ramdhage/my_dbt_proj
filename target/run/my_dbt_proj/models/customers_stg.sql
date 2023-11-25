
  create or replace   view SLEEKMART_OMS.L2_PROCESSING.customers_stg
  
   as (
    SELECT CustomerID,
      FirstName,
      LastName,
      Email,
      Phone,
      Address,
      City,
      State,
      ZipCode,
      Updated_at,
      CONCAT(FirstName, ' ', LastName) AS CustomerName
FROM L1_LANDING.CUSTOMERS
  );

