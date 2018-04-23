CREATE TABLE [Sales].[SpecialOfferProduct_inmem] (
    [SpecialOfferID] INT           NOT NULL,
    [ProductID]      INT           NOT NULL,
    [ModifiedDate]   DATETIME2 (7) CONSTRAINT [IMDF_SpecialOfferProduct_ModifiedDate] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [IMPK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY NONCLUSTERED ([SpecialOfferID] ASC, [ProductID] ASC),
    CONSTRAINT [IMFK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product_inmem] ([ProductID]),
    CONSTRAINT [IMFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer_inmem] ([SpecialOfferID]),
    INDEX [ix_ProductID] NONCLUSTERED ([ProductID])
)
WITH (MEMORY_OPTIMIZED = ON);

