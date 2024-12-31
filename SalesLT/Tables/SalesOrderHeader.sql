CREATE TABLE [SalesLT].[SalesOrderHeader] (

	[SalesOrderID] int NOT NULL, 
	[RevisionNumber] smallint NOT NULL, 
	[OrderDate] datetime2(6) NOT NULL, 
	[DueDate] datetime2(6) NOT NULL, 
	[ShipDate] datetime2(6) NULL, 
	[Status] smallint NOT NULL, 
	[OnlineOrderFlag] bit NULL, 
	[PurchaseOrderNumber] varchar(8000) NULL, 
	[AccountNumber] varchar(8000) NULL, 
	[CustomerID] int NOT NULL, 
	[ShipToAddressID] int NULL, 
	[BillToAddressID] int NULL, 
	[ShipMethod] varchar(8000) NOT NULL, 
	[CreditCardApprovalCode] varchar(8000) NULL, 
	[SubTotal] decimal(19,4) NOT NULL, 
	[TaxAmt] decimal(19,4) NOT NULL, 
	[Freight] decimal(19,4) NOT NULL, 
	[Comment] varchar(8000) NULL, 
	[rowguid] varchar(8000) NOT NULL, 
	[ModifiedDate] datetime2(6) NOT NULL
);

