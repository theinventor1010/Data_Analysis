DROP PROCEDURE IF EXISTS AddBooking; 
DELIMITER // 
CREATE PROCEDURE AddBooking(IN BID INT, IN CID INT, IN TNo INT, IN BDate DATE, IN BSlot TIME, IN EID INT)
BEGIN 
INSERT INTO bookings (BookingID, CustomerID, TableNo, BookingDate, BookingSlot, EmployeeID) VALUES (BID, CID, TNo, BDate, BSlot, EID); 
SELECT "New booking added" AS "Confirmation";
END// DELIMITER ; 
CALL AddBooking(7, 3, 4, '2022-12-30', '15:00:00', 2);
