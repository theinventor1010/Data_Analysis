USE littlelemonDB;
DROP PROCEDURE IF EXISTS CheckBooking;
CREATE PROCEDURE CheckBooking(BDate DATE,TNumber INT)
	SELECT CONCAT("Table ", TNumber, " is already booked")
    WHERE exists (select * from Bookings where BookingDate = BDate and TableNo = TNumber)

CALL CheckBooking("2022-11-12", 3);
