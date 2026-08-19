SELECT
  DB_NAME(database_id) AS base,
  COUNT(*) AS cached_pages,
  COUNT(*) * 8 / 1024 AS cached_mio
FROM sys.dm_os_buffer_descriptors
WHERE database_id = DB_ID('Boutique')
GROUP BY database_id;
