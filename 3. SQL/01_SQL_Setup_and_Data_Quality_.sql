CREATE TABLE train (
    Store INT,
    DayOfWeek INT,
    Date DATE,
    Sales DECIMAL(12,2),
    Customers INT,
    [Open] INT,
    Promo INT,
    StateHoliday VARCHAR(10),
    SchoolHoliday INT
);

CREATE TABLE store (
    Store INT,
    StoreType VARCHAR(10),
    Assortment VARCHAR(10),
    CompetitionDistance INT,
    CompetitionOpenSinceMonth INT,
    CompetitionOpenSinceYear INT,
    Promo2 INT,
    Promo2SinceWeek INT,
    Promo2SinceYear INT,
    PromoInterval VARCHAR(50)
);

-- Make the two problematic text columns compatible with the CSV source

ALTER TABLE dbo.train
ALTER COLUMN StateHoliday NVARCHAR(10);

ALTER TABLE dbo.train
ALTER COLUMN SchoolHoliday NVARCHAR(10);


-- Remove any partially imported rows

TRUNCATE TABLE dbo.train;

ALTER TABLE dbo.store
ALTER COLUMN StoreType NVARCHAR(10);

ALTER TABLE dbo.store
ALTER COLUMN Assortment NVARCHAR(10);

ALTER TABLE dbo.store
ALTER COLUMN PromoInterval NVARCHAR(50);



ALTER TABLE dbo.store
ALTER COLUMN CompetitionDistance NVARCHAR(30);

ALTER TABLE dbo.store
ALTER COLUMN CompetitionOpenSinceMonth NVARCHAR(30);

ALTER TABLE dbo.store
ALTER COLUMN CompetitionOpenSinceYear NVARCHAR(30);

ALTER TABLE dbo.store
ALTER COLUMN Promo2 NVARCHAR(30);

ALTER TABLE dbo.store
ALTER COLUMN Promo2SinceWeek NVARCHAR(30);

ALTER TABLE dbo.store
ALTER COLUMN Promo2SinceYear NVARCHAR(30);


USE DemandForecasting_DB;
SELECT COUNT(*) AS TotalRows
FROM dbo.train;

SELECT COUNT(*) AS TotalRows
FROM dbo.store;


USE DemandForecasting_DB;

SELECT
    Store,
    Date,
    COUNT(*) AS RecordCount
FROM dbo.train
GROUP BY Store, Date
HAVING COUNT(*) > 1;




SELECT
    SUM(CASE WHEN Store IS NULL THEN 1 ELSE 0 END) AS Missing_Store,
    SUM(CASE WHEN DayOfWeek IS NULL THEN 1 ELSE 0 END) AS Missing_DayOfWeek,
    SUM(CASE WHEN Date IS NULL THEN 1 ELSE 0 END) AS Missing_Date,
    SUM(CASE WHEN Sales IS NULL THEN 1 ELSE 0 END) AS Missing_Sales,
    SUM(CASE WHEN Customers IS NULL THEN 1 ELSE 0 END) AS Missing_Customers,
    SUM(CASE WHEN [Open] IS NULL THEN 1 ELSE 0 END) AS Missing_Open,
    SUM(CASE WHEN Promo IS NULL THEN 1 ELSE 0 END) AS Missing_Promo,
    SUM(CASE WHEN StateHoliday IS NULL THEN 1 ELSE 0 END) AS Missing_StateHoliday,
    SUM(CASE WHEN SchoolHoliday IS NULL THEN 1 ELSE 0 END) AS Missing_SchoolHoliday
FROM dbo.train;



SELECT
    MIN(Date) AS MinimumDate,
    MAX(Date) AS MaximumDate
FROM dbo.train;


SELECT
    MIN(Sales) AS MinimumSales,
    MAX(Sales) AS MaximumSales,
    AVG(Sales) AS AverageSales
FROM dbo.train;

USE DemandForecasting_DB;

SELECT
    s.StoreType,
    SUM(t.Sales) AS TotalSales
FROM dbo.train t
INNER JOIN dbo.store s
    ON t.Store = s.Store
GROUP BY s.StoreType
ORDER BY TotalSales DESC;


USE DemandForecasting_DB;

SELECT
    YEAR(Date) AS SalesYear,
    SUM(Sales) AS TotalSales
FROM dbo.train
GROUP BY YEAR(Date)
ORDER BY SalesYear;




USE DemandForecasting_DB;

WITH YearlySales AS (
    SELECT
        YEAR(Date) AS SalesYear,
        SUM(Sales) AS TotalSales
    FROM dbo.train
    GROUP BY YEAR(Date)
)
SELECT
    SalesYear,
    TotalSales,
    LAG(TotalSales) OVER (ORDER BY SalesYear) AS PreviousYearSales,
    ROUND(
        (TotalSales - LAG(TotalSales) OVER (ORDER BY SalesYear))
        * 100.0
        / LAG(TotalSales) OVER (ORDER BY SalesYear),
        2
    ) AS YoYGrowthPercent
FROM YearlySales
ORDER BY SalesYear;


USE DemandForecasting_DB;

SELECT
    Promo,
    SUM(Sales) AS TotalSales,
    SUM(Customers) AS TotalCustomers,
    AVG(Sales) AS AverageSales,
    AVG(Customers) AS AverageCustomers
FROM dbo.train
GROUP BY Promo
ORDER BY Promo;


USE DemandForecasting_DB;
SELECT
    DayOfWeek,
    SUM(Sales) AS TotalSales,
    SUM(Customers) AS TotalCustomers,
    AVG(Sales) AS AverageSales,
    AVG(Customers) AS AverageCustomers
FROM dbo.train
GROUP BY DayOfWeek
ORDER BY DayOfWeek;


USE DemandForecasting_DB;
SELECT
    YEAR(Date) AS SalesYear,
    MONTH(Date) AS SalesMonth,
    SUM(Sales) AS TotalSales,
    AVG(Sales) AS AverageSales,
    SUM(Customers) AS TotalCustomers
FROM dbo.train
GROUP BY
    YEAR(Date),
    MONTH(Date)
ORDER BY
    SalesYear,
    SalesMonth;


    USE DemandForecasting_DB;
SELECT
    CASE
        WHEN s.CompetitionDistance <= 1000 THEN '0-1 km'
        WHEN s.CompetitionDistance <= 2000 THEN '1-2 km'
        WHEN s.CompetitionDistance <= 5000 THEN '2-5 km'
        WHEN s.CompetitionDistance <= 10000 THEN '5-10 km'
        ELSE '10+ km'
    END AS CompetitionDistanceBand,

    SUM(t.Sales) AS TotalSales,
    AVG(t.Sales) AS AverageSalesPerStoreDay,
    COUNT(*) AS StoreDayRecords

FROM dbo.train t

INNER JOIN dbo.store s
    ON t.Store = s.Store

GROUP BY
    CASE
        WHEN s.CompetitionDistance <= 1000 THEN '0-1 km'
        WHEN s.CompetitionDistance <= 2000 THEN '1-2 km'
        WHEN s.CompetitionDistance <= 5000 THEN '2-5 km'
        WHEN s.CompetitionDistance <= 10000 THEN '5-10 km'
        ELSE '10+ km'
    END

ORDER BY
    AverageSalesPerStoreDay DESC;

      
      
      USE DemandForecasting_DB;
SELECT TOP 10
    Store,
    SUM(Sales) AS TotalSales,
    AVG(Sales) AS AverageSalesPerStoreDay,
    SUM(Customers) AS TotalCustomers,
    AVG(Customers) AS AverageCustomersPerStoreDay
FROM dbo.train
GROUP BY Store
ORDER BY TotalSales DESC;



      USE DemandForecasting_DB;
SELECT
    s.StoreType,
    SUM(t.Sales) AS TotalSales,
    SUM(t.Customers) AS TotalCustomers,
    ROUND(
        SUM(t.Sales) * 1.0 / NULLIF(SUM(t.Customers), 0),
        2
    ) AS SalesPerCustomer
FROM dbo.train t
INNER JOIN dbo.store s
    ON t.Store = s.Store
GROUP BY s.StoreType
ORDER BY SalesPerCustomer DESC;


USE DemandForecasting_DB;

SELECT
    s.StoreType,
    COUNT(DISTINCT s.Store) AS StoreCount,
    SUM(t.Sales) AS TotalSales,
    SUM(t.Customers) AS TotalCustomers,

    ROUND(
        SUM(t.Sales) * 1.0 /
        NULLIF(SUM(t.Customers), 0),
        2
    ) AS SalesPerCustomer,

    ROUND(AVG(t.Sales), 2) AS AvgSalesPerStoreDay

FROM dbo.train t

INNER JOIN dbo.store s
    ON t.Store = s.Store

GROUP BY s.StoreType

ORDER BY TotalSales DESC;



-- Store table structure
SELECT
    COLUMN_NAME,
    DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'store'
ORDER BY ORDINAL_POSITION;