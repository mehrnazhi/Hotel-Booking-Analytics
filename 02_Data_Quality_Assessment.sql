-- Column names and data types

SELECT COLUMN_NAME, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'hotel_bookings';

-- Invalid values in Children

SELECT TOP 20 children
FROM hotel_bookings
WHERE TRY_CAST(children AS INT) IS NULL
AND children IS NOT NULL;

-- Invalid values in ADR

SELECT TOP 20 adr
FROM hotel_bookings
WHERE TRY_CAST(adr AS DECIMAL(10,2)) IS NULL
AND adr IS NOT NULL;

-- Count NA values in Children

SELECT COUNT(*) AS NAN_Children
FROM hotel_bookings
WHERE children = 'NA';

-- ADR Range

SELECT
MIN(TRY_CAST(adr AS DECIMAL(10,2))) AS MinADR,
MAX(TRY_CAST(adr AS DECIMAL(10,2))) AS MaxADR
FROM hotel_bookings;

-- Negative ADR investigation

SELECT *
FROM hotel_bookings
WHERE TRY_CAST(adr AS DECIMAL(10,2)) < 0;

-- Missing values assessment

SELECT
COUNT(*) AS TotalRows,
COUNT(country) AS CountryNotNull
FROM hotel_bookings;

SELECT
COUNT(*) AS TotalRows,
COUNT(agent) AS AgentNotNull
FROM hotel_bookings;

SELECT
COUNT(*) AS TotalRows,
COUNT(company) AS CompanyNotNull
FROM hotel_bookings;

SELECT
COUNT(*) - COUNT(country) AS CountryNulls,
COUNT(*) - COUNT(agent) AS AgentNulls,
COUNT(*) - COUNT(company) AS CompanyNulls
FROM hotel_bookings;

/*
During data quality assessment,
anomalous negative ADR values were identified and investigated
as potential data-entry or business-rule exceptions.
*/