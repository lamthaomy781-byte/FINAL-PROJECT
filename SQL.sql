
--Xem dữ liệu mẫu 
SELECT TOP (1000) [Passenger_ID]
      ,[First_Name]
      ,[Last_Name]
      ,[Gender]
      ,[Age]
      ,[Nationality]
      ,[Airport_Name]
      ,[Airport_Country_Code]
      ,[Country_Name]
      ,[Airport_Continent]
      ,[Continents]
      ,[Departure_Date]
      ,[Arrival_Airport]
      ,[Pilot_Name]
      ,[Flight_Status]
  FROM [THCK].[dbo].[Airline];

 --Kiểm tra NULL
 SELECT
    SUM(CASE WHEN Passenger_ID IS NULL THEN 1 ELSE 0 END) AS null_passenger,
    SUM(CASE WHEN Age IS NULL THEN 1 ELSE 0 END) AS null_age,
    SUM(CASE WHEN Flight_Status IS NULL THEN 1 ELSE 0 END) AS null_status
FROM THCK.dbo.Airline;

--Trạng thái chuyến bay
SELECT Flight_Status, COUNT(*) AS total
FROM THCK.dbo.Airline
GROUP BY Flight_Status;

--Trạng thái theo châu lục
SELECT Continents, Flight_Status, COUNT(*) AS total
FROM THCK.dbo.Airline
GROUP BY Continents, Flight_Status
ORDER BY Continents;

--Top 10 sân bay delay nhiều nhất
SELECT TOP 10 Airport_Name, COUNT(*) AS delayed_flights
FROM THCK.dbo.Airline
WHERE Flight_Status = 'Delayed'
GROUP BY Airport_Name
ORDER BY delayed_flights DESC;

--Tạo bảng A’
    SELECT
    -- ======================
    -- ORIGINAL DATA (A)
    -- ======================
    Passenger_ID,
    First_Name,
    Last_Name,
    Gender,
    Age,
    Nationality,
    Airport_Name,
    Airport_Country_Code,
    Country_Name,
    Continents,
    Departure_Date,
    Arrival_Airport,
    Pilot_Name,
    Flight_Status,

    -- ======================
    -- METADATA
    -- ======================
    CAST(GETDATE() AS DATE) AS load_date,

    -- ======================
    -- TIME FEATURES
    -- ======================
    YEAR(Departure_Date) AS dep_year,
    MONTH(Departure_Date) AS dep_month,
    DATENAME(MONTH, Departure_Date) AS dep_month_name,
    DATENAME(WEEKDAY, Departure_Date) AS dep_weekday,

    -- ======================
    -- BUSINESS FLAGS
    -- ======================
    CASE WHEN Flight_Status = 'Delayed' THEN 1 ELSE 0 END AS is_delayed,
    CASE WHEN Flight_Status = 'Cancelled' THEN 1 ELSE 0 END AS is_cancelled,

    CASE
        WHEN Flight_Status IN ('Delayed','Cancelled') THEN 'Issue'
        ELSE 'OnTime'
    END AS flight_status_group,

    -- ======================
    -- SEGMENTATION (STORY)
    -- ======================
    CASE
        WHEN Age < 18 THEN 'Under 18'
        WHEN Age BETWEEN 18 AND 35 THEN '18-35'
        WHEN Age BETWEEN 36 AND 60 THEN '36-60'
        ELSE '60+'
    END AS age_group,

    CASE
        WHEN Continents IN (
            'Europe','North America','Asia',
            'South America','Africa','Oceania'
        )
        THEN Continents
        ELSE 'Other'
    END AS continent_group

INTO THCK.dbo.Airline_Processed
FROM THCK.dbo.Airline;

--Kiểm tra bảng A’

SELECT COUNT(*) AS total_rows
FROM THCK.dbo.Airline_Processed;

SELECT TOP 10 *
FROM THCK.dbo.Airline_Processed;

