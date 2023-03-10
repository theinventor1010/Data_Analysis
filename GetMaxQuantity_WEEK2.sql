USE LittleLemonDB;
DROP PROCEDURE IF EXISTS GetMaxQuantity;
CREATE PROCEDURE GetMaxQuantity() SELECT max(Quantity) AS GetMaxQuantity FROM Orders;
CALL GetMaxQuantity();