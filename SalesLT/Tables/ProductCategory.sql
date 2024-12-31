CREATE TABLE [SalesLT].[ProductCategory] (

	[ProductCategoryID] int NOT NULL, 
	[ParentProductCategoryID] int NULL, 
	[Name] varchar(8000) NULL, 
	[rowguid] varchar(8000) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);

