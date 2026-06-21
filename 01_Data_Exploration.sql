-- Total number of records

SELECT COUNT(*) AS Total_rows
FROM hotel_bookings;

-- Preview dataset

SELECT TOP 5 *
FROM hotel_bookings;

-- Cardinality analysis

SELECT
COUNT(DISTINCT hotel) Hotels,
COUNT(DISTINCT country) Countries,
COUNT(DISTINCT market_segment) Segments,
COUNT(DISTINCT meal) Meals,
COUNT(DISTINCT customer_type) CustomerTypes,
COUNT(DISTINCT distribution_channel) Channels,
COUNT(DISTINCT reserved_room_type) ReservedRooms,
COUNT(DISTINCT assigned_room_type) AssignedRooms
FROM hotel_bookings;