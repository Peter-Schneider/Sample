CREATE TABLE [Sales].[SalesOrderDetail_ondisk] (
    [SalesOrderID]          INT           NOT NULL,
    [SalesOrderDetailID]    BIGINT        IDENTITY (1, 1) NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25) NULL,
    [OrderQty]              SMALLINT      NOT NULL,
    [ProductID]             INT           NOT NULL,
    [SpecialOfferID]        INT           NOT NULL,
    [UnitPrice]             MONEY         NOT NULL,
    [UnitPriceDiscount]     MONEY         CONSTRAINT [ODDF_SalesOrderDetail_UnitPriceDiscount] DEFAULT ((0.0)) NOT NULL,
    [ModifiedDate]          DATETIME2 (7) NOT NULL,
    CONSTRAINT [ODPK_SalesOrderDetail_SalesOrderID_SalesOrderDetailID] PRIMARY KEY CLUSTERED ([SalesOrderID] ASC, [SalesOrderDetailID] ASC),
    CONSTRAINT [ODCK_SalesOrderDetail_OrderQty] CHECK ([OrderQty]>(0)),
    CONSTRAINT [ODCK_SalesOrderDetail_UnitPrice] CHECK ([UnitPrice]>=(0.00)),
    CONSTRAINT [ODCK_SalesOrderDetail_UnitPriceDiscount] CHECK ([UnitPriceDiscount]>=(0.00)),
    CONSTRAINT [ODFK_SalesOrderDetail_SalesOrderHeader_SalesOrderID] FOREIGN KEY ([SalesOrderID]) REFERENCES [Sales].[SalesOrderHeader_ondisk] ([SalesOrderID]),
    CONSTRAINT [ODFK_SalesOrderDetail_SpecialOfferProduct_SpecialOfferIDProductID] FOREIGN KEY ([SpecialOfferID], [ProductID]) REFERENCES [Sales].[SpecialOfferProduct_ondisk] ([SpecialOfferID], [ProductID])
);


GO
CREATE NONCLUSTERED INDEX [IX_ProductID]
    ON [Sales].[SalesOrderDetail_ondisk]([ProductID] ASC);

