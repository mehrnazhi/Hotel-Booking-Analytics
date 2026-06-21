-- Dim_Hotel

CREATE TABLE Dim_Hotel
(
    HotelKey INT IDENTITY(1,1) PRIMARY KEY,
    HotelName NVARCHAR(50)
);

INSERT INTO Dim_Hotel (HotelName)
SELECT DISTINCT hotel
FROM hotel_bookings;

-- Dim_Country

CREATE TABLE Dim_Country
(
    CountryKey INT IDENTITY(1,1) PRIMARY KEY,
    CountryCode NVARCHAR(50)
);

INSERT INTO Dim_Country (CountryCode)
SELECT DISTINCT country
FROM hotel_bookings
WHERE country IS NOT NULL;

-- Dim_MarketSegment

CREATE TABLE Dim_MarketSegment
(
    MarketSegmentKey INT IDENTITY(1,1) PRIMARY KEY,
    MarketSegment NVARCHAR(50)
);

INSERT INTO Dim_MarketSegment (MarketSegment)
SELECT DISTINCT market_segment
FROM hotel_bookings;

-- Dim_Date

CREATE TABLE Dim_Date
(
    DateKey INT IDENTITY(1,1) PRIMARY KEY,
    ArrivalYear INT,
    ArrivalMonth NVARCHAR(20),
    ArrivalWeekNumber INT,
    ArrivalDayOfMonth INT
);

INSERT INTO Dim_Date
(
    ArrivalYear,
    ArrivalMonth,
    ArrivalWeekNumber,
    ArrivalDayOfMonth
)
SELECT DISTINCT
    arrival_date_year,
    arrival_date_month,
    arrival_date_week_number,
    arrival_date_day_of_month
FROM hotel_bookings;