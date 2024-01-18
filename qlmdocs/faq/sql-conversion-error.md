# SQL Conversion Error

If you get a SQL Conversion error of type datetime or other while performing an operation such as a search operation, here's a checklist of items to verify:

* Upgrade your DB schema from Manage Keys / Sites / Upgrade DB Schema
* Change the Default Language of the SQL user that is configured in the connectionString as follows:
  * Launch SQL Server Management Studio
  * Expand the Security node
  * Expand the Logins node
  * Locate the QLM user configured in your connectionString (by default qlm\_user)
  * Right mouse the user and select Properties
  * In the General section, set the Default Language to English
  * Click Ok
