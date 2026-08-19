USE Boutique;
GO

SELECT SCHEMA_NAME(schema_id) AS schema_, name AS table_
FROM sys.tables
ORDER BY name;
GO
