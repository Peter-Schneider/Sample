CREATE TABLE [Sales].[SpecialOffer_inmem] (
    [SpecialOfferID] INT            IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (255) NOT NULL,
    [DiscountPct]    SMALLMONEY     CONSTRAINT [IMDF_SpecialOffer_DiscountPct] DEFAULT ((0.00)) NOT NULL,
    [Type]           NVARCHAR (50)  NOT NULL,
    [Category]       NVARCHAR (50)  NOT NULL,
    [StartDate]      DATETIME2 (7)  NOT NULL,
    [EndDate]        DATETIME2 (7)  NOT NULL,
    [MinQty]         INT            CONSTRAINT [IMDF_SpecialOffer_MinQty] DEFAULT ((0)) NOT NULL,
    [MaxQty]         INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  CONSTRAINT [IMDF_SpecialOffer_ModifiedDate] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [IMPK_SpecialOffer_SpecialOfferID] PRIMARY KEY NONCLUSTERED HASH ([SpecialOfferID]) WITH (BUCKET_COUNT = 1048576),
    CONSTRAINT [IMCK_SpecialOffer_DiscountPct] CHECK ([DiscountPct]>=(0.00)),
    CONSTRAINT [IMCK_SpecialOffer_EndDate] CHECK ([EndDate]>=[StartDate]),
    CONSTRAINT [IMCK_SpecialOffer_MaxQty] CHECK ([MaxQty]>=(0)),
    CONSTRAINT [IMCK_SpecialOffer_MinQty] CHECK ([MinQty]>=(0))
)
WITH (MEMORY_OPTIMIZED = ON);

