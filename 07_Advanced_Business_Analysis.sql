/* =====================================================
   ADVANCED BUSINESS ANALYSIS
   ===================================================== */

-- Lead Time vs Cancellation Rate

SELECT
    CASE
        WHEN LeadTime < 30 THEN '0-30 Days'
        WHEN LeadTime BETWEEN 30 AND 90 THEN '30-90 Days'
        WHEN LeadTime BETWEEN 90 AND 180 THEN '90-180 Days'
        ELSE '180+ Days'
    END AS LeadTimeGroup,

    COUNT(*) AS Bookings,

    AVG(CAST(IsCanceled AS FLOAT)) * 100
        AS CancellationRate

FROM Fact_Bookings

GROUP BY
    CASE
        WHEN LeadTime < 30 THEN '0-30 Days'
        WHEN LeadTime BETWEEN 30 AND 90 THEN '30-90 Days'
        WHEN LeadTime BETWEEN 90 AND 180 THEN '90-180 Days'
        ELSE '180+ Days'
    END

ORDER BY CancellationRate DESC;


-- Market Segment Performance

SELECT
    dms.MarketSegment,
    COUNT(*) AS TotalBookings,

    ROUND(
        AVG(CAST(fb.IsCanceled AS FLOAT)) * 100,
        2
    ) AS CancellationRate

FROM Fact_Bookings fb

JOIN Dim_MarketSegment dms
    ON fb.MarketSegmentKey = dms.MarketSegmentKey

GROUP BY dms.MarketSegment

ORDER BY CancellationRate DESC;


-- Estimated Revenue from Completed Bookings

SELECT
    SUM(
        ADR *
        (WeekendNights + WeekNights)
    ) AS EstimatedRevenue

FROM Fact_Bookings

WHERE IsCanceled = 0;


-- Estimated Revenue Lost Due to Cancellations

SELECT
    SUM(
        ADR *
        (WeekendNights + WeekNights)
    ) AS LostRevenue

FROM Fact_Bookings

WHERE IsCanceled = 1;


-- Revenue Loss Percentage

SELECT
    ROUND(
        (
            SUM(
                CASE
                    WHEN IsCanceled = 1
                    THEN ADR * (WeekendNights + WeekNights)
                    ELSE 0
                END
            )
        )
        /
        (
            SUM(
                ADR * (WeekendNights + WeekNights)
            )
        ) * 100,
        2
    ) AS RevenueLossPercentage

FROM Fact_Bookings;