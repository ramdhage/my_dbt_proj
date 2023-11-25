
  
    

        create or replace transient table SLEEKMART_OMS.L2_PROCESSING.orders_fact
         as
        (SELECT O.OrderID,
        O.OrderDate,
        O.CustomerID,
        O.EmployeeID,
        O.StoreID,
        O.StatusCD,
        O.StatusDesc,
        O.Updated_at,
        COUNT(DISTINCT O.OrderID) as OrderCount,
        SUM(OI.TotalPrice) As Revenue
   FROM SLEEKMART_OMS.L2_PROCESSING.orders_stg O
   JOIN SLEEKMART_OMS.L2_PROCESSING.orderitems_stg OI ON O.OrderID = OI.OrderID
  GROUP BY O.OrderID,
           O.OrderDate,
           O.CustomerID,
           O.EmployeeID,
           O.StoreID,
           O.StatusCD,
           O.StatusDesc,
           O.Updated_at
        );
      
  