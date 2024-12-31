CREATE TABLE [SalesLT].[Address] (

	[AddressID] int NOT NULL, 
	[AddressLine1] varchar(8000) NOT NULL, 
	[AddressLine2] varchar(8000) NULL, 
	[City] varchar(8000) NOT NULL, 
	[StateProvince] varchar(8000) NULL, 
	[CountryRegion] varchar(8000) NULL, 
	[PostalCode] varchar(8000) NOT NULL, 
	[rowguid] varchar(8000) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);

