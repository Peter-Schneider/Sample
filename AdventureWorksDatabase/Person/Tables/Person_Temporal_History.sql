CREATE TABLE [Person].[Person_Temporal_History] (
    [BusinessEntityID] INT               NOT NULL,
    [PersonType]       NCHAR (2)         NOT NULL,
    [NameStyle]        [dbo].[NameStyle] NOT NULL,
    [Title]            NVARCHAR (8)      NULL,
    [FirstName]        [dbo].[Name]      NOT NULL,
    [MiddleName]       [dbo].[Name]      NULL,
    [LastName]         [dbo].[Name]      NOT NULL,
    [Suffix]           NVARCHAR (10)     NULL,
    [EmailPromotion]   INT               NOT NULL,
    [ValidFrom]        DATETIME2 (7)     NOT NULL,
    [ValidTo]          DATETIME2 (7)     NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Person_Temporal_History]
    ON [Person].[Person_Temporal_History]([BusinessEntityID] ASC, [ValidFrom] ASC, [ValidTo] ASC) WITH (DATA_COMPRESSION = PAGE);

