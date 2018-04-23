CREATE TABLE [Demo].[DemoSalesOrderHeaderSeed] (
    [DueDate]         DATETIME2 (7) NOT NULL,
    [CustomerID]      INT           NOT NULL,
    [SalesPersonID]   INT           NOT NULL,
    [BillToAddressID] INT           NOT NULL,
    [ShipToAddressID] INT           NOT NULL,
    [ShipMethodID]    INT           NOT NULL,
    [LocalID]         INT           IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([LocalID] ASC)
)
WITH (MEMORY_OPTIMIZED = ON);

