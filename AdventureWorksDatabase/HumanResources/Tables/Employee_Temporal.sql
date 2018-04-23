CREATE TABLE [HumanResources].[Employee_Temporal] (
    [BusinessEntityID]  INT                                                NOT NULL,
    [NationalIDNumber]  NVARCHAR (15)                                      NOT NULL,
    [LoginID]           NVARCHAR (256)                                     NOT NULL,
    [OrganizationNode]  [sys].[hierarchyid]                                NULL,
    [OrganizationLevel] AS                                                 ([OrganizationNode].[GetLevel]()),
    [JobTitle]          NVARCHAR (50)                                      NOT NULL,
    [BirthDate]         DATE                                               NOT NULL,
    [MaritalStatus]     NCHAR (1)                                          NOT NULL,
    [Gender]            NCHAR (1)                                          NOT NULL,
    [HireDate]          DATE                                               NOT NULL,
    [VacationHours]     SMALLINT                                           NOT NULL,
    [SickLeaveHours]    SMALLINT                                           NOT NULL,
    [ValidFrom]         DATETIME2 (7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
    [ValidTo]           DATETIME2 (7) GENERATED ALWAYS AS ROW END HIDDEN   NOT NULL,
    CONSTRAINT [PK_Employee_History_BusinessEntityID] PRIMARY KEY CLUSTERED ([BusinessEntityID] ASC),
    PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
)
WITH (SYSTEM_VERSIONING = ON (HISTORY_TABLE=[HumanResources].[Employee_Temporal_History], DATA_CONSISTENCY_CHECK=ON));

