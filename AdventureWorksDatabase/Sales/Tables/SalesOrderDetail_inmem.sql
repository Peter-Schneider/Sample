CREATE TABLE [Sales].[SalesOrderDetail_inmem] (
    [SalesOrderID]          INT           NOT NULL,
    [SalesOrderDetailID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25) NULL,
    [OrderQty]              SMALLINT      NOT NULL,
    [ProductID]             INT           NOT NULL,
    [SpecialOfferID]        INT           NOT NULL,
    [UnitPrice]             MONEY         NOT NULL,
    [UnitPriceDiscount]     MONEY         CONSTRAINT [IMDF_SalesOrderDetail_UnitPriceDiscount] DEFAULT ((0.0)) NOT NULL,
    [ModifiedDate]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [imPK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY NONCLUSTERED HASH ([SalesOrderID], [SalesOrderDetailID]) WITH (BUCKET_COUNT = 67108864),
    CONSTRAINT [IMCK_SalesOrderDetail_OrderQty] CHECK ([OrderQty]>(0)),
    CONSTRAINT [IMCK_SalesOrderDetail_UnitPrice] CHECK ([UnitPrice]>=(0.00)),
    CONSTRAINT [IMCK_SalesOrderDetail_UnitPriceDiscount] CHECK ([UnitPriceDiscount]>=(0.00)),
    CONSTRAINT [IMFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader_inmem] ([SalesOrderID]),
    CONSTRAINT [IMFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] FOREIGN KEY ([SpecialOfferID], [ProductID]) REFERENCES [Sales].[SpecialOfferProduct_inmem] ([SpecialOfferID], [ProductID]),
    INDEX [IX_ProductID] NONCLUSTERED HASH ([ProductID]) WITH (BUCKET_COUNT = 1048576),
    INDEX [IX_SalesOrderID] NONCLUSTERED HASH ([SalesOrderID]) WITH (BUCKET_COUNT = 16777216)
)
WITH (MEMORY_OPTIMIZED = ON);

