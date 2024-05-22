USE spscf; -- replace with your actual database name

-- Drop foreign key constraints
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql += 'ALTER TABLE [' + OBJECT_SCHEMA_NAME(f.parent_object_id) + '].[' + OBJECT_NAME(f.parent_object_id) + '] DROP CONSTRAINT [' + f.name + '];' + CHAR(13)
FROM sys.foreign_keys AS f
    INNER JOIN sys.tables t ON t.object_id = f.referenced_object_id
WHERE OBJECTPROPERTY(f.referenced_object_id, 'IsMsShipped') = 0;

-- Drop tables
SELECT @sql += 'DROP TABLE [' + SCHEMA_NAME(schema_id) + '].[' + name + '];' + CHAR(13)
FROM sys.tables
WHERE OBJECTPROPERTY(object_id, 'IsMsShipped') = 0;

EXEC sp_executesql @sql;