CREATE PROCEDURE GetMaxQuantity()
SELECT MAX(Quantity) FROM Orders;