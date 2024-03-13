# How to migrate a QLM License Server to another server

If you are using QLM Pro or Enterprise and need to migrate your license server to a new server, follow the procedure below.

* Install the QLM License Server on the new server, along with a new QLM database. For details on how to install the QLM License Server, check this [article](https://support.soraco.co/hc/en-us/articles/202937924-How-to-install-the-QLM-License-Server).
* Configure a new profile in the QLM Management Console to connect to the new License Server
  * From the Manage Keys tab, click Sites
  * Click Add to add a new profile
  * Enter the URL of the new profile along with the encryption keys
  * Test the profile and make sure all tests pass
* Create a SQL Server backup of the existing database from the SQL Server Management Studio.
* Create a SQL login user (with the same password) identical to the one used by QLM on the previous server.&#x20;
* On the new server, restore the backup over the existing database created during the installation of the QLM License Server.

&#x20;
