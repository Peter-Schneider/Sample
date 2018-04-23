CREATE TABLE [Person].[Person_json] (
    [PersonID]              INT               IDENTITY (1, 1) NOT FOR REPLICATION NOT NULL,
    [PersonType]            NCHAR (2)         NOT NULL,
    [NameStyle]             [dbo].[NameStyle] DEFAULT ((0)) NOT NULL,
    [Title]                 NVARCHAR (8)      NULL,
    [FirstName]             [dbo].[Name]      NOT NULL,
    [MiddleName]            [dbo].[Name]      NULL,
    [LastName]              [dbo].[Name]      NOT NULL,
    [Suffix]                NVARCHAR (10)     NULL,
    [EmailPromotion]        INT               DEFAULT ((0)) NOT NULL,
    [AdditionalContactInfo] NVARCHAR (MAX)    NULL,
    [Demographics]          NVARCHAR (MAX)    NULL,
    [rowguid]               UNIQUEIDENTIFIER  DEFAULT (newid()) ROWGUIDCOL NOT NULL,
    [ModifiedDate]          DATETIME          DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Person_json_PersonID] PRIMARY KEY CLUSTERED ([PersonID] ASC),
    CONSTRAINT [AdditionalContactInfo must be formatted as JSON] CHECK (isjson([AdditionalContactInfo])>(0)),
    CONSTRAINT [Demographics must be formatted as JSON] CHECK (isjson([Demographics])>(0))
);

