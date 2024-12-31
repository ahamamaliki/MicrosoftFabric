CREATE TABLE [dbo].[ErrorLog] (

	[ErrorLogID] int NOT NULL, 
	[ErrorTime] datetime2(6) NOT NULL, 
	[UserName] varchar(8000) NOT NULL, 
	[ErrorNumber] int NOT NULL, 
	[ErrorSeverity] int NULL, 
	[ErrorState] int NULL, 
	[ErrorProcedure] varchar(8000) NULL, 
	[ErrorLine] int NULL, 
	[ErrorMessage] varchar(8000) NOT NULL
);

