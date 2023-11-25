
  
    

        create or replace transient table SLEEKMART_OMS.L3_CONSUMPTION.customerrevenue
         as
        (SELECT OS.CustomerID,
        C.CustomerName,
        SUM(OS.OrderCount) AS OrderCount,
        SUM(OS.Revenue) AS Revenue
   FROM SLEEKMART_OMS.L2_PROCESSING.orders_fact OS
   JOIN SLEEKMART_OMS.L2_PROCESSING.customers_stg C ON OS.CustomerID = C.CustomerID
  GROUP BY OS.CustomerID,
           C.CustomerName
        );
      
  