# How to configure QLM Pro to connect to your local License Server

* Start the QLM Management Console
* Go to the Manage Keys tab
* Click Sites
* Select a Site
* Enter the site URL, for example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* Select the Database Engine. If you would like to use SQL, make sure to create the SQL Server database by running the provided SQL scripts. The QLM help provides instructions on running the SQL scripts.
* Set the Communication Encryption Key and Admin Encryption Key to any value of your choice. The communicationEncryptionKey and adminEncrpytionKey must also be set in the web.config on your web server.
* Click Test next to the URL to confirm that you are able to connect to the License Server
* Click Ok
