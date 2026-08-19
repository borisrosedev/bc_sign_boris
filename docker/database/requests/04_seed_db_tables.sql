USE Boutique;
GO

DECLARE @default_password VARCHAR(255) = '$2y$10$Yb0jzHYcsbApBV34K/3Ov.jc1jsg0SSRCE0JlxP36TL2MlMfZ12za';

IF OBJECT_ID('dbo.Client') IS NOT NULL
   AND NOT EXISTS (SELECT 1 FROM dbo.Client)
  INSERT INTO dbo.Client
  (ClientName, ClientEmail, ClientPassword)
VALUES('sebastien dupuis', 'sebastien@gmail.com', @default_password),
  ('yann dupont', 'yann@gmail.com', @default_password),
  ('ben dupont', 'ben@gmail.com', @default_password),
  ('laura renaud', 'laura@gmail.com', @default_password),
  ('olivia renard', 'olivia@gmail.com', @default_password),
  ('pauline sanez', 'pauline@gmail.com', @default_password),
  ('sandra rima', 'sandra@gmail.com', @default_password),
  ('sarah rollo', 'sarah@gmail.com', @default_password),
  ('ced champi', 'ced@gmail.com', @default_password),
  ('troy renaud', 'troy@gmail.com', @default_password),
  ('caroline aria', 'caroline@gmail.com', @default_password),
  ('roy sarlo', 'roy@gmail.com', @default_password),
  ('alex polo', 'alex@gmail.com', @default_password),
  ('milia france', 'milia@gmail.com', @default_password),
  ('bob brune', 'bob@gmail.com', @default_password),
  ('quentin zar', 'quentin@gmail.com', @default_password),
  ('francis mola', 'francis@gmail.com', @default_password);

GO
