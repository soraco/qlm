# How to transfer your data from a MS-Access DB to a MS-SQL Server DB

If you are storing your QLM licenses in a MS-Access DB, you can easily transfer all your data to a MS-SQL Server DB (and vice versa). Before proceeding with the steps below, make a backup of your database.

### Create SQL DB

* Use the provided SQL scripts to create a MS-SQL Server DB. The scripts are located in %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db and should be executed in the following order:
  * sql2005.createdb.sql
  * sql2005.createuser.sql
  * sql2005.createtables.sql
  * sql2005.aspnet.sql

### License Server Configuration

Copy the existing QLM License Server files (there should be 3 folders) to a new location of your choice.

#### QLM License Server Configuration

* Create a Virtual Directory in IIS that points to the new QlmLicenseServer folder, configure it as an Application and update the web.config file of the new QLM web service to point to the MS-SQL Server database created earlier.
* In the QLM Management Console, create a new site that connects to the SQL Server database
  * Go to the Manage Keys tab
  * Click Sites
  * Click Add a new site
  * Specify the name of the site, example: My SQL Site
  * Enter the URL of the new site
  * Update the communicationEncryptionKey and the adminEncryptionKey to match the values in the web.config file.

#### QLM Customer Site Configuration

* Create a Virtual Directory in IIS that points to the new QlmCustomerSitefolder, configure it as an Application and update the web.config file of the new QlmCustomerSite to point to the MS-SQL Server database created earlier.

#### QLM Portal Configuration

* Create a Virtual Directory in IIS that points to the new QlmPortal folder, configure it as an Application and update the web.config file of the new QlmPortal  to point to the MS-SQL Server database created earlier.

### Restoring data to the MS-SQL Database

* Click the Backup tab.&#x20;
* Click Create Backup.
* Enter a name for the backup.
* Select the Profile that corresponds to the License Server using MS-Access.
* Click Backup Now.
* The next steps will restore this backup to the MS-SQL Server database.
* Click the Restore tab, then click Refresh on the ribbon bar to view the newly created backup.
* Expand the current date and select the backup you just created.
* Click the Restore button.
* Select the Profile that corresponds to the License Server using MS-SQL Server.
* Click Yes.

When the restore completes, your MS-SQL Server database should be an exact copy of the MS-Access database.
