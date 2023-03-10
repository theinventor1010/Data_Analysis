USE LittleLemonDB;
DROP PROCEDURE IF EXISTS AddValidBooking;
DROP FUNCTION IF EXISTS Validate;

DELIMITER //

CREATE FUNCTION Validate(RecFound INTEGER, message VARCHAR(255)) RETURNS INTEGER DETERMINISTIC
BEGIN
    IF RecFound IS NOT NULL OR RecFound > 0 THEN
        SIGNAL SQLSTATE 'ERR0R' SET MESSAGE_TEXT = message;
    END IF;
    RETURN RecFound;
END//

CREATE PROCEDURE AddValidBooking(IN BDate DATE, IN BSlot TIME, IN TNumber INT)
	BEGIN
		DECLARE `_Rollback` BOOL DEFAULT 0;
		DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET `_Rollback` = 1;
		START TRANSACTION;
        
        SELECT Validate(COUNT(*), CONCAT("Table ", TNumber, "at ", BSlot, " is already booked"))
        FROM bookings
        WHERE BookingDate = BDate AND TableNo = TNumber;
        
		INSERT INTO bookings (BookingDate, TableNo)
		VALUES (BDate, TNumber);
		
		IF `_Rollback` THEN
			SELECT CONCAT("Table ", TNumber, " is already booked - booking cancelled") AS "Booking status";
			ROLLBACK;
		ELSE
			COMMIT;
		END IF;
    END//
    
DELIMITER ;

CALL AddValidBooking("2022-12-30","15:00:00", 4);