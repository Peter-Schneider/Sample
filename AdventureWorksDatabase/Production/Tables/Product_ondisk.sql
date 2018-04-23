CREATE TABLE [Production].[Product_ondisk] (
    [ProductID]             INT            IDENTITY (1, 1) NOT NULL,
    [Name]                  NVARCHAR (50)  NOT NULL,
    [ProductNumber]         NVARCHAR (25)  NOT NULL,
    [MakeFlag]              BIT            CONSTRAINT [ODDF_Product_MakeFlag] DEFAULT ((1)) NOT NULL,
    [FinishedGoodsFlag]     BIT            CONSTRAINT [ODDF_Product_FinishedGoodsFlag] DEFAULT ((1)) NOT NULL,
    [Color]                 NVARCHAR (15)  NULL,
    [SafetyStockLevel]      SMALLINT       NOT NULL,
    [ReorderPoint]          SMALLINT       NOT NULL,
    [StandardCost]          MONEY          NOT NULL,
    [ListPrice]             MONEY          NOT NULL,
    [Size]                  NVARCHAR (5)   NULL,
    [SizeUnitMeasureCode]   NCHAR (3)      NULL,
    [WeightUnitMeasureCode] NCHAR (3)      NULL,
    [Weight]                DECIMAL (8, 2) NULL,
    [DaysToManufacture]     INT            NOT NULL,
    [ProductLine]           NCHAR (2)      NULL,
    [Class]                 NCHAR (2)      NULL,
    [Style]                 NCHAR (2)      NULL,
    [ProductSubcategoryID]  INT            NULL,
    [ProductModelID]        INT            NULL,
    [SellStartDate]         DATETIME2 (7)  NOT NULL,
    [SellEndDate]           DATETIME2 (7)  NULL,
    [DiscontinuedDate]      DATETIME2 (7)  NULL,
    [ModifiedDate]          DATETIME2 (7)  CONSTRAINT [ODDF_Product_ModifiedDate] DEFAULT (sysdatetime()) NOT NULL,
    CONSTRAINT [ODPK_Product_ProductID] PRIMARY KEY CLUSTERED ([ProductID] ASC),
    CONSTRAINT [ODCK_Product_Class] CHECK (upper([Class])='H' OR upper([Class])='M' OR upper([Class])='L' OR [Class] IS NULL),
    CONSTRAINT [ODCK_Product_DaysToManufacture] CHECK ([DaysToManufacture]>=(0)),
    CONSTRAINT [ODCK_Product_ListPrice] CHECK ([ListPrice]>=(0.00)),
    CONSTRAINT [ODCK_Product_ProductLine] CHECK (upper([ProductLine])='R' OR upper([ProductLine])='M' OR upper([ProductLine])='T' OR upper([ProductLine])='S' OR [ProductLine] IS NULL),
    CONSTRAINT [ODCK_Product_ReorderPoint] CHECK ([ReorderPoint]>(0)),
    CONSTRAINT [ODCK_Product_SafetyStockLevel] CHECK ([SafetyStockLevel]>(0)),
    CONSTRAINT [ODCK_Product_SellEndDate] CHECK ([SellEndDate]>=[SellStartDate] OR [SellEndDate] IS NULL),
    CONSTRAINT [ODCK_Product_StandardCost] CHECK ([StandardCost]>=(0.00)),
    CONSTRAINT [ODCK_Product_Style] CHECK (upper([Style])='U' OR upper([Style])='M' OR upper([Style])='W' OR [Style] IS NULL),
    CONSTRAINT [ODCK_Product_Weight] CHECK ([Weight]>(0.00))
);


GO
CREATE NONCLUSTERED INDEX [IX_ProductNumber]
    ON [Production].[Product_ondisk]([ProductNumber] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_Name]
    ON [Production].[Product_ondisk]([Name] ASC);

