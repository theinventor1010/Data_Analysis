USE littlelemondb;
SELECT distinct Cuisine
FROM menus
WHERE ItemID = ANY
  (SELECT ItemID
  FROM Orders
  WHERE Quantity >2);
