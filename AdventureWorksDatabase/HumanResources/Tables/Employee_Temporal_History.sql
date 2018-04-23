CREATE TABLE [HumanResources].[Employee_Temporal_History] (
    [BusinessEntityID]  INT                 NOT NULL,
    [NationalIDNumber]  NVARCHAR (15)       NOT NULL,
    [LoginID]           NVARCHAR (256)      NOT NULL,
    [OrganizationNode]  [sys].[hierarchyid] NULL,
    [OrganizationLevel] SMALLINT            NULL,
    [JobTitle]          NVARCHAR (50)       NOT NULL,
    [BirthDate]         DATE                NOT NULL,
    [MaritalStatus]     NCHAR (1)           NOT NULL,
    [Gender]            NCHAR (1)           NOT NULL,
    [HireDate]          DATE                NOT NULL,
    [VacationHours]     SMALLINT            NOT NULL,
    [SickLeaveHours]    SMALLINT            NOT NULL,
    [ValidFrom]         DATETIME2 (7)       NOT NULL,
    [ValidTo]           DATETIME2 (7)       NOT NULL
);


GO
CREATE CLUSTERED INDEX [ix_Employee_Temporal_History]
    ON [HumanResources].[Employee_Temporal_History]([BusinessEntityID] ASC, [ValidFrom] ASC, [ValidTo] ASC) WITH (DATA_COMPRESSION = PAGE);

