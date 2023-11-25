
  create or replace   view SLEEKMART_OMS.L2_PROCESSING.orderitems_stg
  
   as (
    SELECT OrderItemID,
       OrderID,
       ProductID,
       Quantity,
       UnitPrice,
       Quantity * UnitPrice As TotalPrice,
       Updated_at
  FROM L1_LANDING.ORDERITEMS
  );

