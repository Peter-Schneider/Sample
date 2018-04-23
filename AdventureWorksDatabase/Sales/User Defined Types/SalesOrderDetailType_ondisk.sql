CREATE TYPE [Sales].[SalesOrderDetailType_ondisk] AS TABLE (
    [OrderQty]       SMALLINT NOT NULL,
    [ProductID]      INT      NOT NULL,
    [SpecialOfferID] INT      NOT NULL,
    INDEX [IX_ProductID] ([ProductID]),
    INDEX [IX_SpecialOfferID] ([SpecialOfferID]));

