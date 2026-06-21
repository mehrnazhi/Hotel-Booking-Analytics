# Hotel Booking Analytics & Data Warehouse Project

## Overview

This project analyzes hotel booking demand data using SQL Server and a dimensional data warehouse model. The goal was to identify booking patterns, cancellation drivers, and potential revenue loss while building a reporting-ready data model for business intelligence and dashboarding.

Dataset Size:

* 119,390 booking records
* 32 original attributes
* Multiple customer segments, countries, and booking channels

---

## Business Objectives

The project was designed to answer the following business questions:

* What is the overall booking cancellation rate?
* Which hotel type experiences more cancellations?
* Does booking lead time affect cancellation behavior?
* Which customer segments are most likely to cancel?
* Which countries generate the most bookings?
* How much potential revenue is lost due to cancellations?
* How do bookings and cancellations vary throughout the year?

---

## Data Warehouse Design

A Star Schema model was implemented in SQL Server.

### Fact Table

#### Fact_Bookings

Measures:

* IsCanceled
* LeadTime
* Adults
* Children
* Babies
* ADR (Average Daily Rate)
* WeekendNights
* WeekNights
* PreviousCancellations
* PreviousBookingsNotCanceled
* BookingChanges
* SpecialRequests

Foreign Keys:

* HotelKey
* CountryKey
* MarketSegmentKey
* DateKey

---

### Dimension Tables

#### Dim_Hotel

* HotelKey
* HotelName

#### Dim_Country

* CountryKey
* CountryCode

#### Dim_MarketSegment

* MarketSegmentKey
* MarketSegment

#### Dim_Date

* DateKey
* ArrivalYear
* ArrivalMonth
* ArrivalWeekNumber
* ArrivalDayOfMonth

---

## Data Quality Assessment

Several data quality checks were performed:

* Missing value investigation
* Invalid values detection
* Data type validation
* ADR anomaly investigation

Findings:

* Only 4 records contained invalid values in the Children field.
* Negative ADR values were identified and investigated as potential data anomalies.
* ADR ranged from -6.38 to 5400.00.

---

## Key Business Insights

### Overall Cancellation Rate

37.04%

More than one-third of all reservations were canceled.

---

### Cancellation Rate by Hotel

| Hotel        | Cancellation Rate |
| ------------ | ----------------: |
| City Hotel   |            41.73% |
| Resort Hotel |            27.76% |

City Hotels experienced significantly higher cancellation rates.

---

### Lead Time Analysis

| Lead Time   | Cancellation Rate |
| ----------- | ----------------: |
| 0-30 Days   |            18.25% |
| 30-90 Days  |            37.68% |
| 90-180 Days |            44.71% |
| 180+ Days   |            57.01% |

A strong positive relationship exists between lead time and cancellation probability.

---

### Market Segment Analysis

| Segment       | Cancellation Rate |
| ------------- | ----------------: |
| Groups        |            61.06% |
| Online TA     |            36.72% |
| Offline TA/TO |            34.32% |
| Corporate     |            18.73% |
| Direct        |            15.34% |

Group bookings were the least reliable customer segment.

Direct bookings showed the lowest cancellation rate.

---

### Top Booking Countries

1. Portugal (PRT)
2. United Kingdom (GBR)
3. France (FRA)
4. Spain (ESP)
5. Germany (DEU)

Portugal generated the highest number of bookings.

---

### Revenue Analysis

Estimated Completed Revenue:

25,996,260

Estimated Lost Revenue Due to Cancellations:

16,727,237

Approximately 39% of potential revenue was lost because of booking cancellations.

---

### Seasonal Analysis

Highest Booking Volume:

* August
* July

Highest Cancellation Rates:

* June
* April
* May

Seasonality patterns indicate that cancellation behavior does not necessarily follow booking volume.

---

## Technologies Used

* SQL Server
* T-SQL
* Star Schema Modeling
* Data Warehousing Concepts
* Business Analytics

---

## Future Improvements

* Build interactive Power BI dashboards
* Create additional dimensions (Customer, Room, Distribution Channel)
* Implement stored procedures and ETL pipelines
* Develop cancellation prediction models using Python and Machine Learning
* Create automated KPI reporting

---

## Project Outcome

This project demonstrates practical skills in:

* Data Warehousing
* SQL Querying
* Business Intelligence
* KPI Development
* Exploratory Data Analysis
* Dimensional Modeling
* Business Insight Generation
