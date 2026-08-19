USE Boutique;
GO

IF OBJECT_ID('dbo.Client', 'U') IS NULL
BEGIN
  CREATE TABLE dbo.Client
  (
    ClientID INT IDENTITY(1,1) PRIMARY KEY,
    ClientName NVARCHAR(100) NOT NULL,
    ClientEmail NVARCHAR(255) NOT NULL,
    CreatedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    CONSTRAINT AK_Unicity_Email UNIQUE(ClientEmail)
  );
END
GO

IF OBJECT_ID('dbo.ClientOrder', 'U') IS NULL
BEGIN
  CREATE TABLE dbo.ClientOrder
  (
    ClientOrderID INT IDENTITY(1,1) PRIMARY KEY,
    ClientID INT NOT NULL,
    SubmittedAt DATETIME2 NOT NULL DEFAULT SYSDATETIME(),
    OrderAmount DECIMAL(10,2) NOT NULL,
    CONSTRAINT FK_ClientOrder_Client FOREIGN KEY (ClientID) REFERENCES dbo.Client(ClientID)
  );
END
GO
