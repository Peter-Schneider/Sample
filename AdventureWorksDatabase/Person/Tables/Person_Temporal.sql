CREATE TABLE [Person].[Person_Temporal] (
    [BusinessEntityID] INT                                                NOT NULL,
    [PersonType]       NCHAR (2)                                          NOT NULL,
    [NameStyle]        [dbo].[NameStyle]                                  NOT NULL,
    [Title]            NVARCHAR (8)                                       NULL,
    [FirstName]        [dbo].[Name]                                       NOT NULL,
    [MiddleName]       [dbo].[Name]                                       NULL,
    [LastName]         [dbo].[Name]                                       NOT NULL,
    [Suffix]           NVARCHAR (10)                                      NULL,
    [EmailPromotion]   INT                                                NOT NULL,
    [ValidFrom]        DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]          DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_Person_Temporal_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[Person].[Person_Temporal_History], DATA_CONSISTENCY_CHECK=ON));

