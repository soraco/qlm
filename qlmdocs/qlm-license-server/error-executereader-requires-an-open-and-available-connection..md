# Error: ExecuteReader requires an open and available Connection.

After installing the QLM web service with an MS-Access database, you receive the following error when clicking on the Test button:

**Error: ExecuteReader requires an open and available Connection. The connection's current state is closed.**

**Error getting data set. The 'Provider=Microsoft.ACE.OLEDB.12.0' provider is not registered on the local machine**

**Error getting data set. The 'Provider=Microsoft.Jet.OLEDB.4.0' provider is not registered on the local machine**

This message is due to the fact that no Access driver is installed on the system or the incorrect Access driver is installed.&#x20;

Steps the troubleshoot this issue:

* If you have a 32 bit MS-Access driver installed on your server, configure the web service to run as a 32 bit process. To do so, configure the Quick License Manager Application Pool to run as a 32 bit process as follows:

\- If you ran the QlmLicenseServerSetup.exe to install the License Server, the Quick License Manager Application Pool has already been created. If you installed the License Server manually, create an Application Pool called Quick License Manager. - Edit the Advanced Settings of the Quick License Manager Application Pool and set the **Enable 32-bit applications** to **True.**

* If you have a 64 bit MS-Access driver installed, make sure the connectionStrings in your web.config file is using Provider=Microsoft.ACE.OLEDB.12.0

&#x20;

* If you do not have an MS-Access driver installed, download and install "Microsoft Access Database Engine 201x Redistributable" from one of the locations below:
  * [MS-Access 2010 Runtime](https://www.microsoft.com/en-ca/download/details.aspx?id=13255).
  * [MS-Access 2013 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=39358%20%C2%A0)
  * [MS-Access 2016 Runtime](https://www.microsoft.com/en-us/download/details.aspx?id=50040)

Reference article: https://stackoverflow.com/questions/6649363/microsoft-ace-oledb-12-0-provider-is-not-registered-on-the-local-machine

If none of the above works, we do strongly recommend using MS-SQL Server rather than MS-Access. You can install the free version of MS SQL Server Express 2014 from [Microsoft's web site.](https://www.microsoft.com/en-ca/download/details.aspx?id=42299)
