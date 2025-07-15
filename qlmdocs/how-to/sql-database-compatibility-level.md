# SQL Database Compatibility level

As of QLM 19.1, QLM requires that the database compatibility level be 130 or higher.

The SQL script will update the compatibility level if it does not meet our miniumum requirement:

```sql
-- Update the db name (qlm_db) below as needed

IF @CurrentLevel < 130
BEGIN
    ALTER DATABASE [qlm_db] SET COMPATIBILITY_LEVEL = 130;
    PRINT 'Compatibility level updated to 130.';
END
ELSE
BEGIN
    PRINT 'Compatibility level is already 130 or higher. No change made.';
END
```
