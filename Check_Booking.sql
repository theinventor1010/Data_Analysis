CREATE PROCEDURE CheckBooking(BDate DATE,TNumber INT)
BEGIN
SELECT CONCAT("Table ", TNumber, " is already booked") 
WHERE exists (select * from Bookings where BookingDate = BDate and TableNo = TNumber);
END