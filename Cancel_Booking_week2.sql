DROP PROCEDURE IF EXISTS CancelBooking; 
DELIMITER // CREATE PROCEDURE CancelBooking(IN BID INT) 
BEGIN 
DELETE FROM bookings WHERE BookingID = BID; SELECT CONCAT("Booking ", BID, " cancelled") AS "Confirmation"; 
END// 
DELIMITER ; 
CALL CancelBooking(6);