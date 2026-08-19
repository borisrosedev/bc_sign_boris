USE Boutique;
GO

IF OBJECT_ID('dbo.Client', 'U') IS NOT NULL
   AND COL_LENGTH('dbo.Client', 'ClientScopes') IS NULL
  ALTER TABLE dbo.Client ADD ClientScopes VARCHAR(100) NOT NULL
    CONSTRAINT DF_Client_ClientScopes DEFAULT 'standard:read,standard:write';
GO

IF OBJECT_ID('dbo.ClientOrder', 'U') IS NOT NULL
   AND COL_LENGTH('dbo.ClientOrder', 'OrderStatus') IS NULL
  ALTER TABLE dbo.ClientOrder ADD OrderStatus VARCHAR(20) NOT NULL
    CONSTRAINT DF_ClientOrder_OrderStatus DEFAULT 'pending';
GO
