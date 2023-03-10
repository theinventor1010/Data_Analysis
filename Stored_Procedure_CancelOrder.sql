
CREATE PROCEDURE CancelOrder (Oid integer)
BEGIN
DELETE FROM Orders WHERE OrderID = Oid;
SELECT 'Order ' , Oid , ' is Cancelled';
END
