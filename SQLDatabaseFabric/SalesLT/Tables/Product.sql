CREATE TABLE [SalesLT].[Product] (
    [ProductID]              INT              IDENTITY (1, 1) NOT NULL,
    [Name]                   NVARCHAR (50)    NULL,
    [ProductNumber]          NVARCHAR (25)    NOT NULL,
    [Color]                  NVARCHAR (15)    NULL,
    [StandardCost]           MONEY            NOT NULL,
    [ListPrice]              MONEY            NOT NULL,
    [Size]                   NVARCHAR (5)     NULL,
    [Weight]                 DECIMAL (8, 2)   NULL,
    [ProductCategoryID]      INT              NULL,
    [ProductModelID]         INT              NULL,
    [SellStartDate]          DATETIME         NOT NULL,
    [SellEndDate]            DATETIME         NULL,
    [DiscontinuedDate]       DATETIME         NULL,
    [ThumbNailPhoto]         VARBINARY (MAX)  NULL,
    [ThumbnailPhotoFileName] NVARCHAR (50)    NULL,
    [rowguid]                UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]           DATETIME         NOT NULL
);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [PK_Product_ProductID] PRIMARY KEY CLUSTERED ([ProductID] ASC);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [FK_Product_ProductCategory_ProductCategoryID] FOREIGN KEY ([ProductCategoryID]) REFERENCES [SalesLT].[ProductCategory] ([ProductCategoryID]);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [FK_Product_ProductModel_ProductModelID] FOREIGN KEY ([ProductModelID]) REFERENCES [SalesLT].[ProductModel] ([ProductModelID]);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [CK_Product_StandardCost] CHECK ([StandardCost]>=(0.00));
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [CK_Product_Weight] CHECK ([Weight]>(0.00));
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [CK_Product_SellEndDate] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [CK_Product_ListPrice] CHECK ([ListPrice]>=(0.00));
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [AK_Product_ProductNumber] UNIQUE NONCLUSTERED ([ProductNumber] ASC);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [AK_Product_Name] UNIQUE NONCLUSTERED ([Name] ASC);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [AK_Product_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC);
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [DF_Product_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];
GO

ALTER TABLE [SalesLT].[Product]
    ADD CONSTRAINT [DF_Product_rowguid] DEFAULT (newid()) FOR [rowguid];
GO

