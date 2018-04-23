CREATE TABLE [Sales].[SpecialOfferProduct_ondisk] (
    [SpecialOfferID] INT           NOT NULL,
    [ProductID]      INT           NOT NULL,
    [ModifiedDate]   DATETIME2 (7) CONSTRAINT [ODDF_SpecialOfferProduct_ModifiedDate] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [ODPK_SpecialOfferProduct_SpecialOfferID_ProductID] PRIMARY KEY NONCLUSTERED ([SpecialOfferID] ASC, [ProductID] ASC),
    CONSTRAINT [ODFK_SpecialOfferProduct_Product_ProductID] FOREIGN KEY ([ProductID]) REFERENCES [Production].[Product_ondisk] ([ProductID]),
    CONSTRAINT [ODFK_SpecialOfferProduct_SpecialOffer_SpecialOfferID] FOREIGN KEY ([SpecialOfferID]) REFERENCES [Sales].[SpecialOffer_ondisk] ([SpecialOfferID])
);


GO
CREATE NONCLUSTERED INDEX [ix_ProductID]
    ON [Sales].[SpecialOfferProduct_ondisk]([ProductID] ASC);

