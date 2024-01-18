# Troubleshooting tips for SQL Error

### Authentication Mode

Verify that SQL Server is configured for "SQL Server and Windows authentication mode". This is done by viewing the properties at the SQL Server level and selecting the Security Node.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360045602451/mceclip0.png)

### Security

1\. Verify that the user configured to access your database as specified in the web.config is configured at 2 levels:

* At the SQL Server / Security / Logins level
* At the Database / Security / Users level

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360045602491/mceclip1.png)

&#x20;

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360045483372/mceclip2.png)

&#x20;

2\. Verify that the user at the Database level has the appropriate privileges. To do so:

* Start SQL Server Management Studio
* Locate your Database and expand the node
* Locate the Security node and expand it
* Locate the Users node and expand it
* To create a new user (skip this step if the qlmuser is already created):&#x20;
  * Right mouse click and select New User
  * Set the user name to: qlmuser
  * Set the Login name to: qlmuser
* Set the following Membership: db\_datareader, db\_datawriter, db\_ddladmin

3\. Verify the credentials in the web.config file

* Locate the license server web.config file, typically located in c:\inetpub\wwwrooot\Qlm\QlmLicenseServer
* Edit the web.config file with a text editor such as notepad
* Locate the connectionstrings section
* Verify that the Data Source setting points to your DB server
* Verify that the name of the database is correct
* Verify that the User/Pwd values to connect to the DB are correct

4\. If you are upgrading from QLM v7 or older to QLM v15 or later, some tables need to be created prior to the upgrade (ServerProperties). Please contact our support team for assistance.

### &#x20;

### &#x20;SSL / TLS&#x20;

If you get the error: \[DBNETLIB]\[ConnectionOpen (SECCreateCredentials()).]SSL Security error, this means that you are using an older version of the OLE  DB Driver for SQL which does not support TLS 1.2. You must :

1\. Install the latest Microsoft OLE DB Driver 18 for SQL Server from: \
[https://www.microsoft.com/en-us/download/details.aspx?id=56730](https://www.microsoft.com/en-us/download/details.aspx?id=56730)\
\
2\. Update the connectionStrings in the web.config as shown below (change the values of Server, Database, User and Password as needed)\
\
\<connectionStrings>\
&#x20; \<add name="QlmWebService.Properties.Settings.qlmConnectionString"\
&#x20;     connectionString="Provider=msoledbsql;Server=localhost;Database=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
&#x20; />\
&#x20; \<add name="QlmSvcLib.Properties.Settings.qlmConnectionString"\
&#x20;   connectionString="Provider=msoledbsql;Server=localhost;Database=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
&#x20;   />\
&#x20; \<add name="aspConnectionString" connectionString="Data Source=localhost;Initial Catalog=qlmdemo;User Id=qlmdemo;Password=qlmweb30;"\
&#x20;   providerName="System.Data.SqlClient" />\
&#x20;\</connectionStrings>
