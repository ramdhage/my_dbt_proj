SELECT OrderItemID,
       OrderID,
       ProductID,
       Quantity,
       UnitPrice,
       Quantity * UnitPrice As TotalPrice,
       Updated_at
  FROM L1_LANDING.ORDERITEMS