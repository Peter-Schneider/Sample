CREATE TABLE [Sales].[SalesOrderHeader_ondisk] (
    [SalesOrderID]           INT            IDENTITY (1, 1) NOT NULL,
    [RevisionNumber]         TINYINT        CONSTRAINT [ODDF_SalesOrderHeader_RevisionNumber] DEFAULT ((0)) NOT NULL,
    [OrderDate]              DATETIME2 (7)  NOT NULL,
    [DueDate]                DATETIME2 (7)  NOT NULL,
    [ShipDate]               DATETIME2 (7)  NULL,
    [Status]                 TINYINT        CONSTRAINT [ODDF_SalesOrderHeader_Status] DEFAULT ((1)) NOT NULL,
    [OnlineOrderFlag]        BIT            CONSTRAINT [ODDF_SalesOrderHeader_OnlineOrderFlag] DEFAULT ((1)) NOT NULL,
    [PurchaseOrderNumber]    NVARCHAR (25)  NULL,
    [AccountNumber]          NVARCHAR (15)  NULL,
    [CustomerID]             INT            NOT NULL,
    [SalesPersonID]          INT            CONSTRAINT [ODDF_SalesOrderHeader_SalesPersonID] DEFAULT ((-1)) NOT NULL,
    [TerritoryID]            INT            NULL,
    [BillToAddressID]        INT            NOT NULL,
    [ShipToAddressID]        INT            NOT NULL,
    [ShipMethodID]           INT            NOT NULL,
    [CreditCardID]           INT            NULL,
    [CreditCardApprovalCode] VARCHAR (15)   NULL,
    [CurrencyRateID]         INT            NULL,
    [SubTotal]               MONEY          CONSTRAINT [ODDF_SalesOrderHeader_SubTotal] DEFAULT ((0.00)) NOT NULL,
    [TaxAmt]                 MONEY          CONSTRAINT [ODDF_SalesOrderHeader_TaxAmt] DEFAULT ((0.00)) NOT NULL,
    [Freight]                MONEY          CONSTRAINT [ODDF_SalesOrderHeader_Freight] DEFAULT ((0.00)) NOT NULL,
    [Comment]                NVARCHAR (128) NULL,
    [ModifiedDate]           DATETIME2 (7)  NOT NULL,
    PRIMARY KEY CLUSTERED ([SalesOrderID] ASC),
    CONSTRAINT [ODCK_SalesOrderHeader_DueDate] CHECK ([DueDate]>=[OrderDate]),
    CONSTRAINT [ODCK_SalesOrderHeader_Freight] CHECK ([Freight]>=(0.00)),
    CONSTRAINT [ODCK_SalesOrderHeader_ShipDate] CHECK ([ShipDate]>=[OrderDate] OR [ShipDate] IS NULL),
    CONSTRAINT [ODCK_SalesOrderHeader_Status] CHECK ([Status]>=(0) AND [Status]<=(8)),
    CONSTRAINT [ODCK_SalesOrderHeader_SubTotal] CHECK ([SubTotal]>=(0.00)),
    CONSTRAINT [ODCK_SalesOrderHeader_TaxAmt] CHECK ([TaxAmt]>=(0.00))
);


GO
CREATE NONCLUSTERED INDEX [IX_CustomerID]
    ON [Sales].[SalesOrderHeader_ondisk]([CustomerID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_SalesPersonID]
    ON [Sales].[SalesOrderHeader_ondisk]([SalesPersonID] ASC);

