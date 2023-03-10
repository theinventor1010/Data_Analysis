DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(IN BID INT, IN BDate DATE) 
BEGIN
UPDATE bookings SET BookingDate = BDate WHERE BookingID = BID; 
SELECT CONCAT("Booking ", BID, " updated") AS "Confirmation"; 
END//
DELIMITER ; 
CALL UpdateBooking(9, "2022-12-17");