CREATE TABLE [SalesLT].[SalesOrderHeader] (
    [SalesOrderID]           INT              NOT NULL,
    [RevisionNumber]         TINYINT          NOT NULL,
    [OrderDate]              DATETIME         NOT NULL,
    [DueDate]                DATETIME         NOT NULL,
    [ShipDate]               DATETIME         NULL,
    [Status]                 TINYINT          NOT NULL,
    [OnlineOrderFlag]        BIT              NULL,
    [PurchaseOrderNumber]    NVARCHAR (25)    NULL,
    [AccountNumber]          NVARCHAR (15)    NULL,
    [CustomerID]             INT              NOT NULL,
    [ShipToAddressID]        INT              NULL,
    [BillToAddressID]        INT              NULL,
    [ShipMethod]             NVARCHAR (50)    NOT NULL,
    [CreditCardApprovalCode] VARCHAR (15)     NULL,
    [SubTotal]               MONEY            NOT NULL,
    [TaxAmt]                 MONEY            NOT NULL,
    [Freight]                MONEY            NOT NULL,
    [Comment]                NVARCHAR (MAX)   NULL,
    [rowguid]                UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate]           DATETIME         NOT NULL
);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_Freight] CHECK ([Freight]>=(0.00));
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_TaxAmt] CHECK ([TaxAmt]>=(0.00));
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_ShipDate] CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_Status] CHECK ([Status]>=(0) AND [Status]<=(8));
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_DueDate] CHECK ([DueDate]>=[OrderDate]);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [CK_SalesOrderHeader_SubTotal] CHECK ([SubTotal]>=(0.00));
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_OrderID] DEFAULT (NEXT VALUE FOR [SalesLT].[SalesOrderNumber]) FOR [SalesOrderID];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)) FOR [SubTotal];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)) FOR [TaxAmt];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_rowguid] DEFAULT (newid()) FOR [rowguid];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_Status] DEFAULT ((1)) FOR [Status];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_OrderDate] DEFAULT (getdate()) FOR [OrderDate];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)) FOR [RevisionNumber];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)) FOR [OnlineOrderFlag];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [DF_SalesOrderHeader_Freight] DEFAULT ((0.00)) FOR [Freight];
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Address_ShipTo_AddressID] FOREIGN KEY ([ShipToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID]);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Customer_CustomerID] FOREIGN KEY ([CustomerID]) REFERENCES [SalesLT].[Customer] ([CustomerID]);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [FK_SalesOrderHeader_Address_BillTo_AddressID] FOREIGN KEY ([BillToAddressID]) REFERENCES [SalesLT].[Address] ([AddressID]);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [PK_SalesOrderHeader_SalesOrderID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC);
GO

ALTER TABLE [SalesLT].[SalesOrderHeader]
    ADD CONSTRAINT [AK_SalesOrderHeader_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_SalesOrderHeader_CustomerID]
    ON [SalesLT].[SalesOrderHeader]([CustomerID] ASC);
GO

