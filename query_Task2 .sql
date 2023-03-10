USE littlelemondb;
SELECT * FROM OrdersView;
SELECT c.CustomerID, CONCAT(c.CustomerFirstName, c.CustomerLastName) AS FullName,
 o.OrderID, o.BillAmount AS Cost, mi.Item_Name, m.Cuisine
 FROM 
 ((((littlelemondb.Orders o 
 JOIN littlelemondb.Bookings b)
 JOIN  littlelemondb.Customers c)
 JOIN littlelemondb.Menus m)
 JOIN littlelemondb.Menuitems mi) 
 WHERE(
 (b.BookingID = o.BookingID)
 AND (c.CustomerID = b.CustomerID)
 AND (m.MenuID = o.MenuID)
 AND (mi.itemID = m.ItemID)
 AND o.BillAmount > 150);