CREATE TABLE [Sales].[SpecialOffer_ondisk] (
    [SpecialOfferID] INT            IDENTITY (1, 1) NOT NULL,
    [Description]    NVARCHAR (255) NOT NULL,
    [DiscountPct]    SMALLMONEY     CONSTRAINT [ODDF_SpecialOffer_DiscountPct] DEFAULT ((0.00)) NOT NULL,
    [Type]           NVARCHAR (50)  NOT NULL,
    [Category]       NVARCHAR (50)  NOT NULL,
    [StartDate]      DATETIME2 (7)  NOT NULL,
    [EndDate]        DATETIME2 (7)  NOT NULL,
    [MinQty]         INT            CONSTRAINT [ODDF_SpecialOffer_MinQty] DEFAULT ((0)) NOT NULL,
    [MaxQty]         INT            NULL,
    [ModifiedDate]   DATETIME2 (7)  CONSTRAINT [ODDF_SpecialOffer_ModifiedDate] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [ODPK_SpecialOffer_SpecialOfferID] PRIMARY KEY CLUSTERED ([SpecialOfferID] ASC),
    CONSTRAINT [ODCK_SpecialOffer_DiscountPct] CHECK ([DiscountPct]>=(0.00)),
    CONSTRAINT [ODCK_SpecialOffer_EndDate] CHECK ([EndDate]>=[StartDate]),
    CONSTRAINT [ODCK_SpecialOffer_MaxQty] CHECK ([MaxQty]>=(0)),
    CONSTRAINT [ODCK_SpecialOffer_MinQty] CHECK ([MinQty]>=(0))
);

