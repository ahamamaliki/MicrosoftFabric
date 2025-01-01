CREATE TABLE [SalesLT].[Customer] (
    [CustomerID]   INT              IDENTITY (1, 1) NOT NULL,
    [NameStyle]    BIT              NULL,
    [Title]        NVARCHAR (8)     NULL,
    [FirstName]    NVARCHAR (50)    NULL,
    [MiddleName]   NVARCHAR (50)    NULL,
    [LastName]     NVARCHAR (50)    NULL,
    [Suffix]       NVARCHAR (10)    NULL,
    [CompanyName]  NVARCHAR (128)   NULL,
    [SalesPerson]  NVARCHAR (256)   NULL,
    [EmailAddress] NVARCHAR (50)    NULL,
    [Phone]        NVARCHAR (25)    NULL,
    [PasswordHash] VARCHAR (128)    NOT NULL,
    [PasswordSalt] VARCHAR (10)     NOT NULL,
    [rowguid]      UNIQUEIDENTIFIER NOT NULL,
    [ModifiedDate] DATETIME         NOT NULL
);
GO

ALTER TABLE [SalesLT].[Customer]
    ADD CONSTRAINT [DF_Customer_NameStyle] DEFAULT ((0)) FOR [NameStyle];
GO

ALTER TABLE [SalesLT].[Customer]
    ADD CONSTRAINT [DF_Customer_ModifiedDate] DEFAULT (getdate()) FOR [ModifiedDate];
GO

ALTER TABLE [SalesLT].[Customer]
    ADD CONSTRAINT [DF_Customer_rowguid] DEFAULT (newid()) FOR [rowguid];
GO

ALTER TABLE [SalesLT].[Customer]
    ADD CONSTRAINT [PK_Customer_CustomerID] PRIMARY KEY CLUSTERED ([CustomerID] ASC);
GO

ALTER TABLE [SalesLT].[Customer]
    ADD CONSTRAINT [AK_Customer_rowguid] UNIQUE NONCLUSTERED ([rowguid] ASC);
GO

CREATE NONCLUSTERED INDEX [IX_Customer_EmailAddress]
    ON [SalesLT].[Customer]([EmailAddress] ASC);
GO

