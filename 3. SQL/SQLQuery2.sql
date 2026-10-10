USE DemandForecasting_DB;

-- Remove any partially imported rows
TRUNCATE TABLE dbo.train;

-- Make the two problematic text columns compatible with the CSV source
ALTER TABLE dbo.train
ALTER COLUMN StateHoliday NVARCHAR(10);

ALTER TABLE dbo.train
ALTER COLUMN SchoolHoliday NVARCHAR(10);



USE DemandForecasting_DB;

ALTER TABLE dbo.store
ALTER COLUMN StoreType NVARCHAR(10);

ALTER TABLE dbo.store
ALTER COLUMN Assortment NVARCHAR(10);

ALTER TABLE dbo.store
ALTER COLUMN PromoInterval NVARCHAR(50);


USE DemandForecasting_DB;

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