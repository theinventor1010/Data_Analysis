USE LittleLemonDB;
PREPARE GetOrderDetails FROM 'select OrderID, Quantity, BillAmount from Orders where OrderID=?';
SET @id = 1;
EXECUTE GetOrderDetails USING @id;