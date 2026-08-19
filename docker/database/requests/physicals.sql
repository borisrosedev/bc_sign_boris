SELECT
  DB_NAME(mf.database_id) AS base, -- name of the base
  mf.name AS logical_name, -- logical name of the file
  mf.type_desc AS type, -- ROWS (data) or LOG (journal)
  mf.physical_name AS path, -- path on the disk
  mf.size * 8 / 1024 AS mio_size -- size in Mio (size = pages count (8 Kio))
FROM sys.master_files AS mf
ORDER BY base, mf.type_desc;
