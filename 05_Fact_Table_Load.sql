-- Create Fact Table

CREATE TABLE Fact_Bookings
(
    BookingID INT PRIMARY KEY,

    HotelKey INT,
    CountryKey INT,
    MarketSegmentKey INT,

    IsCanceled BIT,
    LeadTime INT,

    Adults INT,
    Children INT,
    Babies INT,

    ADR DECIMAL(10,2),

    WeekendNights INT,
    WeekNights INT,

    PreviousCancellations INT,
    PreviousBookingsNotCanceled INT,

    BookingChanges INT,
    SpecialRequests INT
);

-- Load Fact Table

INSERT INTO Fact_Bookings
(
    BookingID,
    HotelKey,
    CountryKey,
    MarketSegmentKey,
    IsCanceled,
    LeadTime,
    Adults,
    Children,
    Babies,
    ADR,
    WeekendNights,
    WeekNights,
    PreviousCancellations,
    PreviousBookingsNotCanceled,
    BookingChanges,
    SpecialRequests
)
SELECT
    hb.booking_id,
    dh.HotelKey,
    dc.CountryKey,
    dms.MarketSegmentKey,
    hb.is_canceled,
    hb.lead_time,
    hb.adults,
    TRY_CAST(NULLIF(hb.children,'NA') AS INT),
    hb.babies,
    TRY_CAST(hb.adr AS DECIMAL(10,2)),
    hb.stays_in_weekend_nights,
    hb.stays_in_week_nights,
    hb.previous_cancellations,
    hb.previous_bookings_not_canceled,
    hb.booking_changes,
    hb.total_of_special_requests
FROM hotel_bookings hb
INNER JOIN Dim_Hotel dh
    ON hb.hotel = dh.HotelName
INNER JOIN Dim_Country dc
    ON hb.country = dc.CountryCode
INNER JOIN Dim_MarketSegment dms
    ON hb.market_segment = dms.MarketSegment;

-- Add DateKey

ALTER TABLE Fact_Bookings
ADD DateKey INT;

UPDATE fb
SET fb.DateKey = dd.DateKey
FROM Fact_Bookings fb
JOIN hotel_bookings hb
    ON fb.BookingID = hb.booking_id
JOIN Dim_Date dd
    ON hb.arrival_date_year = dd.ArrivalYear
   AND hb.arrival_date_month = dd.ArrivalMonth
   AND hb.arrival_date_week_number = dd.ArrivalWeekNumber
   AND hb.arrival_date_day_of_month = dd.ArrivalDayOfMonth;