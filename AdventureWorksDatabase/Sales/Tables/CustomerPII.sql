CREATE TABLE [Sales].[CustomerPII] (
    [CustomerID]       INT                                                NOT NULL,
    [FirstName]        [dbo].[Name]                                       NOT NULL,
    [LastName]         [dbo].[Name]                                       NOT NULL,
    [SSN]              NVARCHAR (11)                                      COLLATE Latin1_General_BIN2  ENCRYPTED WITH (
     COLUMN_ENCRYPTION_KEY = [CEK_Auto1],
     ALGORITHM = N'AEAD_AES_256_CBC_HMAC_SHA_256',
     ENCRYPTION_TYPE = DETERMINISTIC
    ) NULL,
    [CreditCardNumber] NVARCHAR (25)                                      COLLATE Latin1_General_BIN2  ENCRYPTED WITH (
     COLUMN_ENCRYPTION_KEY = [CEK_Auto1],
     ALGORITHM = N'AEAD_AES_256_CBC_HMAC_SHA_256',
     ENCRYPTION_TYPE = DETERMINISTIC
    ) NULL,
    [EmailAddress]     NVARCHAR (50) MASKED WITH (FUNCTION = 'email()')   NULL,
    [PhoneNumber]      NVARCHAR (25) MASKED WITH (FUNCTION = 'default()') NULL,
    [TerritoryID]      INT                                                NULL
);

