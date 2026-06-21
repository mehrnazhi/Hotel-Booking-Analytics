/* =====================================================
   BUSINESS KPI ANALYSIS
   ===================================================== */

-- Overall Cancellation Rate

SELECT
    ROUND(
        AVG(CAST(IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings;


-- Total Number of Bookings

SELECT
    COUNT(*) AS TotalBookings
FROM Fact_Bookings;


-- Average Lead Time

SELECT
    AVG(LeadTime) AS AvgLeadTime
FROM Fact_Bookings;


-- Average Daily Rate (ADR)

SELECT
    AVG(ADR) AS AvgADR
FROM Fact_Bookings;


-- Cancellation Rate by Hotel

SELECT
    dh.HotelName,
    ROUND(
        AVG(CAST(fb.IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings fb
JOIN Dim_Hotel dh
    ON fb.HotelKey = dh.HotelKey
GROUP BY dh.HotelName;


-- Top 10 Countries by Number of Bookings

SELECT TOP 10
    dc.CountryCode,
    COUNT(*) AS TotalBookings
FROM Fact_Bookings fb
JOIN Dim_Country dc
    ON fb.CountryKey = dc.CountryKey
GROUP BY dc.CountryCode
ORDER BY TotalBookings DESC;


-- Bookings by Month

SELECT
    dd.ArrivalMonth,
    COUNT(*) AS TotalBookings
FROM Fact_Bookings fb
JOIN Dim_Date dd
    ON fb.DateKey = dd.DateKey
GROUP BY dd.ArrivalMonth
ORDER BY TotalBookings DESC;


-- Cancellation Rate by Month

SELECT
    dd.ArrivalMonth,
    ROUND(
        AVG(CAST(fb.IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings fb
JOIN Dim_Date dd
    ON fb.DateKey = dd.DateKey
GROUP BY dd.ArrivalMonth
ORDER BY CancellationRate DESC;/* =====================================================
   BUSINESS KPI ANALYSIS
   ===================================================== */

-- Overall Cancellation Rate

SELECT
    ROUND(
        AVG(CAST(IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings;


-- Total Number of Bookings

SELECT
    COUNT(*) AS TotalBookings
FROM Fact_Bookings;


-- Average Lead Time

SELECT
    AVG(LeadTime) AS AvgLeadTime
FROM Fact_Bookings;


-- Average Daily Rate (ADR)

SELECT
    AVG(ADR) AS AvgADR
FROM Fact_Bookings;


-- Cancellation Rate by Hotel

SELECT
    dh.HotelName,
    ROUND(
        AVG(CAST(fb.IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings fb
JOIN Dim_Hotel dh
    ON fb.HotelKey = dh.HotelKey
GROUP BY dh.HotelName;


-- Top 10 Countries by Number of Bookings

SELECT TOP 10
    dc.CountryCode,
    COUNT(*) AS TotalBookings
FROM Fact_Bookings fb
JOIN Dim_Country dc
    ON fb.CountryKey = dc.CountryKey
GROUP BY dc.CountryCode
ORDER BY TotalBookings DESC;


-- Bookings by Month

SELECT
    dd.ArrivalMonth,
    COUNT(*) AS TotalBookings
FROM Fact_Bookings fb
JOIN Dim_Date dd
    ON fb.DateKey = dd.DateKey
GROUP BY dd.ArrivalMonth
ORDER BY TotalBookings DESC;


-- Cancellation Rate by Month

SELECT
    dd.ArrivalMonth,
    ROUND(
        AVG(CAST(fb.IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate
FROM Fact_Bookings fb
JOIN Dim_Date dd
    ON fb.DateKey = dd.DateKey
GROUP BY dd.ArrivalMonth
ORDER BY CancellationRate DESC;