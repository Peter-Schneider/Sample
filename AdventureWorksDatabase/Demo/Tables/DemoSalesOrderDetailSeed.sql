CREATE TABLE [Demo].[DemoSalesOrderDetailSeed] (
    [OrderQty]       SMALLINT NOT NULL,
    [ProductID]      INT      NOT NULL,
    [SpecialOfferID] INT      NOT NULL,
    [OrderID]        INT      NOT NULL,
    [LocalID]        INT      IDENTITY (1, 1) NOT NULL,
    PRIMARY KEY NONCLUSTERED ([LocalID] ASC),
    INDEX [IX_OrderID] NONCLUSTERED HASH ([OrderID]) WITH (BUCKET_COUNT = 1048576)
)
WITH (MEMORY_OPTIMIZED = ON);

