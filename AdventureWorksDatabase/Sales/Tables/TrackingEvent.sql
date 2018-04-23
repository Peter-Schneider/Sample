CREATE TABLE [Sales].[TrackingEvent] (
    [TrackingEventID] INT            IDENTITY (1, 1) NOT NULL,
    [EventName]       NVARCHAR (255) NOT NULL,
    CONSTRAINT [PK_TrackingEvent_TrackingEventID] PRIMARY KEY CLUSTERED ([TrackingEventID] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'TrackingEvent', @level2type = N'CONSTRAINT', @level2name = N'PK_TrackingEvent_TrackingEventID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking event lookup table.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'TrackingEvent';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'TrackingEvent', @level2type = N'COLUMN', @level2name = N'TrackingEventID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking event name.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'TrackingEvent', @level2type = N'COLUMN', @level2name = N'EventName';

