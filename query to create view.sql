USE littlelemondb;
CREATE VIEW OrdersView AS SELECT OrderID, Quantity, BillAmount AS Cost FROM Orders WHERE Quantity>=2;
Select * from OrdersView;




