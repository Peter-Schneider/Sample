CREATE TYPE [Sales].[SalesOrderDetailType_inmem] AS TABLE (
    [OrderQty]       SMALLINT NOT NULL,
    [ProductID]      INT      NOT NULL,
    [SpecialOfferID] INT      NOT NULL,
    INDEX [IX_SpecialOfferID] NONCLUSTERED HASH ([SpecialOfferID]) WITH (BUCKET_COUNT = 8),
    INDEX [IX_ProductID] NONCLUSTERED HASH ([ProductID]) WITH (BUCKET_COUNT = 8))
    WITH (MEMORY_OPTIMIZED = ON);

