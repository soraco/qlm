# Error when calling Analytics AddInstall method

If you get the following error when calling the Analytics AddInstall method, follow the procedure below to resolve this issue:

**Error:**

Cannot insert the value NULL into column 'DaysUsedUpdated', table 'AnalyticsInstalls'; column does not allow nulls. INSERT fails.

**Procedure for SQL Server:**

* Launch SQL Server Management Studio
* Go to Tools / Options / Designer
* Uncheck the option "Prevent saving changes that require table re-creation"
* Go to the QLM database in SQL Server
* Expand the Tables node
* Right mouse click the AnalyticsInstalls node and select **Design**
* Locate the DaysUsedUpdated field and check the **Allow Nulls** option
* Save the table schema
* Revert the change to the "Prevent saving changes that require table re-creation" made above
