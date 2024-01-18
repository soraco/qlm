# How to migrate a QLM License Server to another server

If you are using QLM Pro or Enterprise and need to migrate your license server to a new server, or if you want to migrate a MS-Access DB to an SQL Server DB, follow the procedure below.

**Case 1 - Migrate to another DB using the same DB type (i.e. MS-Access -> MS-Access or SQL Server -> SQL Server) - Recommended**

* Install the QLM License Server on the new server, along with a new QLM database. For details on how to install the QLM License Server, check this [article](https://support.soraco.co/hc/en-us/articles/202937924-How-to-install-the-QLM-License-Server).
* Configure a new profile in the QLM Management Console to connect to the new License Server
  * From the Manage Keys tab, click Sites
  * Click Add to add a new profile
  * Enter the URL of the new profile along with the encryption keys
  * Test the profile and make sure all tests pass
* Create a SQL Server backup of the existing database from the SQL Server Management Studio. If you are using MS-Access, make a copy of the qlm.mdb or qlm.accdb file on the old server.
* On the new server, restore the backup over the existing database created during the installation of the QLM License Server.

&#x20;

**Case 2 - Migrate from MS-Access to SQL Server or vice versa or migrate without direct access to the server's database - (**_**Use only if you cannot create a database back from SQL Server**_**)**

* Install the QLM License Server on the new server, along with a new QLM database. For details on how to install the QLM License Server, check this [article](https://support.soraco.co/hc/en-us/articles/202937924-How-to-install-the-QLM-License-Server).
* Configure a new profile in the QLM Management Console to connect to the new License Server
  * From the Manage Keys tab, click Sites
  * Click Add to add a new profile
  * Enter the URL of the new profile along with the encryption keys
  * Test the profile and make sure all tests pass
* Next, we will create 2 backups of the database: (a) a SQL Server backup and (b) a QLM backup.
* Create a SQL Server backup of the existing database from the SQL Server Management Studio. If you are using MS-Access, make a copy of your database file.
* Create a QLM backup of the existing database by following the steps below:
  * Launch the QLM Management Console
  * Go to the Backup tab
  * Click Create Backup to create a new backup
  * In the Properties panel on the right hand side, enter the following:
* Name of the backup
* Select the License Server associated to the source database&#x20;
* Click Backup Now
