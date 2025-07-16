# SQL Database Compatibility level

As of QLM 19.1.25196.3, QLM requires that the database compatibility level be 130 or higher.

Execute the following SQL script on your database to update the compatibility level if it does not meet our minimum requirement (update the database name below to match your QLM database name):

```sql
-- Update the db name (qlm_db) below as needed

DECLARE @DatabaseName NVARCHAR(128) = 'qlm_db';
DECLARE @CurrentLevel INT;

SELECT @CurrentLevel = compatibility_level
FROM sys.databases
WHERE name = @DatabaseName;

IF @CurrentLevel IS NULL
BEGIN
    PRINT 'Database not found.';
    RETURN;
END

IF @CurrentLevel < 130
BEGIN
    DECLARE @Sql NVARCHAR(MAX) = 
        'ALTER DATABASE [' + @DatabaseName + '] SET COMPATIBILITY_LEVEL = 130;';
    
    EXEC sp_executesql @Sql;
    PRINT 'Compatibility level updated to 130.';
END
ELSE
BEGIN
    PRINT 'Compatibility level is already 130 or higher. No change made.';
END
```
