-- Add surrogate key

ALTER TABLE hotel_bookings
ADD booking_id INT IDENTITY(1,1);