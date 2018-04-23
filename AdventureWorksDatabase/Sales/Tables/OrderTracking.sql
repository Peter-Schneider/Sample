CREATE TABLE [Sales].[OrderTracking] (
    [OrderTrackingID]       INT             IDENTITY (1, 1) NOT NULL,
    [SalesOrderID]          INT             NOT NULL,
    [CarrierTrackingNumber] NVARCHAR (25)   NULL,
    [TrackingEventID]       INT             NOT NULL,
    [EventDetails]          NVARCHAR (2000) NOT NULL,
    [EventDateTime]         DATETIME2 (7)   NOT NULL,
    CONSTRAINT [PK_OrderTracking] PRIMARY KEY CLUSTERED ([OrderTrackingID] ASC)
);


GO
CREATE NONCLUSTERED INDEX [IX_OrderTracking_SalesOrderID]
    ON [Sales].[OrderTracking]([SalesOrderID] ASC);


GO
CREATE NONCLUSTERED INDEX [IX_OrderTracking_CarrierTrackingNumber]
    ON [Sales].[OrderTracking]([CarrierTrackingNumber] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Individual tracking events associated with a specific sales order.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'OrderTrackingID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Sales order identification number.  Foreign key to SalesOrderHeader.SalesOrderID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'SalesOrderID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Shipment tracking number supplied by the shipper.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'CarrierTrackingNumber';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tracking delivery event for Order shipped to customer. Foreign key to TrackingEvent.TrackingEventID.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'TrackingEventID';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Details for a delivery tracking event.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'EventDetails';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'The date and time that a tracking event has occurred.', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'COLUMN', @level2name = N'EventDateTime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Primary key (clustered) constraint', @level0type = N'SCHEMA', @level0name = N'Sales', @level1type = N'TABLE', @level1name = N'OrderTracking', @level2type = N'CONSTRAINT', @level2name = N'PK_OrderTracking';

