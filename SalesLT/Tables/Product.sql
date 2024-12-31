CREATE TABLE [SalesLT].[Product] (

	[ProductID] int NOT NULL, 
	[Name] varchar(8000) NULL, 
	[ProductNumber] varchar(8000) NOT NULL, 
	[Color] varchar(8000) NULL, 
	[StandardCost] decimal(19,4) NOT NULL, 
	[ListPrice] decimal(19,4) NOT NULL, 
	[Size] varchar(8000) NULL, 
	[Weight] decimal(8,2) NULL, 
	[ProductCategoryID] int NULL, 
	[ProductModelID] int NULL, 
	[SellStartDate] datetime2(6) NOT NULL, 
	[SellEndDate] datetime2(6) NULL, 
	[DiscontinuedDate] datetime2(6) NULL, 
	[ThumbNailPhoto] varbinary(8000) NULL, 
	[ThumbnailPhotoFileName] varchar(8000) NULL, 
	[rowguid] varchar(8000) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);

