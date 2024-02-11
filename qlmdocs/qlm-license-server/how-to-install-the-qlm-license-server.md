# How to install the QLM License Server

## Overview <a href="#h_01hfsaqpkvh4bjettw218g7seh" id="h_01hfsaqpkvh4bjettw218g7seh"></a>

The License Server is a web service with a SQL Server database that enables the following functionality:

* Online activation
* Server-side license validation
* License Management
* Customer Management
* Analytics
* and much more

![Quick License Manager Components](https://soraco.co/wp-content/uploads/2015/06/QLM-Components-e1494513789301.jpg)

&#x20;

The QLM License Server must be installed in the cloud so that it is accessible to your customers.

The system requirements for the QLM License Server are:

* Windows 2012 R2 server or higher.
* ASP.NET Framework 4.62
* Microsoft SQL Server Database (any edition including the free SQL Server Express)
* Full Trust for .NET assemblies.

_Before installing the QLM License Server, make sure the above components are installed on your system. To install IIS and enable ASP.NET on your Windows Server, read this_ [_article_](https://technet.microsoft.com/en-us/library/hh831475\(v=ws.11\).aspx)_._

The License Server can be installed in 2 ways: (a) by running the provided setup program QlmLicenseServerSetup.exe or (b) by executing the installation steps manually.

If you are hosting your own website,  then the procedure **\[1]** below is recommended. If your site is hosted at an ISP, then you may need to use the procedure **\[2]**.

## Automated installation of the web service <a href="#h_01hfsapyns07hcs8z4xp1b84cs" id="h_01hfsapyns07hcs8z4xp1b84cs"></a>

### License Server Installation <a href="#h_01hfsavyrrkx81vw6pm4scfmb2" id="h_01hfsavyrrkx81vw6pm4scfmb2"></a>

To install the QLM License Server:

* Locate the QlmLicenseServerSetup.exe setup program in the QLM installation folder. Typically this file is located under:

QLM v8 and higher: %Public%\Documents\Quick License Manager\DeployToServer

QLM v7: C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer

* Copy QlmLicenseServerSetup.exe to your server
* Execute QlmLicenseServerSetup.exe on the server
* Follow the onscreen instructions.

### QLM Management Console Configuration <a href="#h_01hfsapynsp1s2fxt4hz9fph48" id="h_01hfsapynsp1s2fxt4hz9fph48"></a>

To configure the QLM Management Console to connect to your QLM License Server:

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Sites
* Click Add to add a new site
* Specify a site name
* In the Primary site field, enter the URL to the License Server: For example: [https://mycompany.net/qlm/qlmlicenseserver/qlmservice.asmx](https://mycompany.net/qlm/qlmlicenseserver/qlmservice.asmx)
* Set the Database Engine to SQL Server
* Go to the Encryption Keys tab, then click New for CommunicationEncryptionKey and AdminEncryptionKey
* On the server where you installed the QLM License Server, edit each web.config file and update the value of the CommunicationEncryptionKey and AdminEncryptionKey to the values created above (do not remove the curly braces).
* Go back to the QLM Management Console / Manage Keys / Sites  / General tab and click the Test button
* If you get an error saying that no products were found, click the **Upload products to License Server** button.
* Then click on Test again to confirm that all tests pass.

## Manual installation of the License Server <a href="#h_01hfsapynsq9vt6yv22srqq2mp" id="h_01hfsapynsq9vt6yv22srqq2mp"></a>

### Configuring the Database <a href="#h_01hfsapynshtqsn5teenx8e6sh" id="h_01hfsapynshtqsn5teenx8e6sh"></a>

QLM Professional and Enterprise store license keys as well as customer-related information in a database on the License Server.

* Use the tools provided by your ISP to create a database called qlm\_db. Alternatively, you can execute the sql2005.createdb.sql script located in:
  * QLM v7: C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmWebService\Db.
  * QLM v8+: %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db.
  * You may need to modify the path of the database in the script above.
* Execute the script sql2005.createusers.sql. You may want to modify the password. If you modify the password, update the password in the connectionStrings section of the web.config file.
* Execute the script sql2005.createtables.sql to create all the QLM tables
* Execute the script sql2005.aspnet.sql

### Configuring the web service <a href="#h_01hfsapynsjkqgx1k3txt8qdq8" id="h_01hfsapynsjkqgx1k3txt8qdq8"></a>

* At your ISP, create a new virtual directory called QlmLicenseServer and enable ASP.NET 4.0 for this virtual directory.
* Create an Application Pool and associate the virtual directory above to the Application Pool.
* Ensure the Application Pool is configured for .NET 4.0

### Configuring the QLM Management Console <a href="#id-01hfsaw2cbata0g1dzabe99w2d" id="id-01hfsaw2cbata0g1dzabe99w2d"></a>

* Launch the QLM Management Console&#x20;
* Go to the Manage Keys tab
* Click Sites
* Click Add to add a new site
* Specify a site name
* In the Primary site field, enter the URL to the License Server: For example: [https://mycompany.net/qlm/qlmlicenseserver/qlmservice.asmx](https://mycompany.net/qlm/qlmlicenseserver/qlmservice.asmx)
* Set the Database Engine to SQL Server
* Go to the Encryption Keys tab, then click New for CommunicationEncryptionKey and AdminEncryptionKey
* If you want to configure the QLM Customer Portal to support 3rd party authentication, go to the Authentication tab and set the Client ID of each provider as described in the Authentication Configuration section of this [article](https://support.soraco.co/hc/en-us/articles/360049459532).
* Go to the Deployment tab (formerly Database Connection tab) and enter all the fields on this tab as follows:
  * DB Server Hostname or IP: Your SQL server name (including the instance name). Example: SQLEXPRESS\MYDBSERVER
  * Database Name: qlm or any other name you have entered earlier in the process when you created the database
  * User Name: name of the SQL admin user you specified earlier in the process\
    User Password: password of the SQL admin user you specified earlier in the process
  * Set the URL to the QLM Customer Portal API
  * Set the URL to the QLM Customer Portal App
* Click **Update config files**
* Click Ok
* Upload all the files in the DeployToServer\QlmLicenseServer folder and subfolders to the virtual directory created above (preserve the directory structure).
* Go back to the QLM Management Console / Manage Keys / Sites  / General tab and click the Test button
* If you get an error saying that no products were found, click the **Upload products to License Server** button.
* Then click on Test again to confirm that all tests pass.

### Important QLM License Server settings <a href="#h_01hfsapynsfq7crhtgv14knwkb" id="h_01hfsapynsfq7crhtgv14knwkb"></a>

The following settings located in the License Server's web.config file are critical.

* Database connection string (refer to the Configure the Database section in the Help)
* Default QLM Engine Version (defaultQlmVersion).
* SQL Syntax(sqlsyntax).
* Communication Encryption Key (communicationEncryptionKey). The communication encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* Admin Encryption Key (adminEncryptionKey). The admin encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.

#### Security Note: <a href="#h_01hfsapyns01p8pzb068738m4s" id="h_01hfsapyns01p8pzb068738m4s"></a>

You need to give the anonymous user (IUSR\_XXX, IWAM\_XXX) "execute" privileges to the bin folder.

#### Recommendations <a href="#h_01hfsapynsvwbnnvhw1dqne7yf" id="h_01hfsapynsvwbnnvhw1dqne7yf"></a>

Change the default Communication and Admin Encryption Keys. If you do not, any other QLM customer may be able to view your data.

### Configuring the QlmCustomerSite <a href="#h_01hfsapynsyqj4se173avq2pwr" id="h_01hfsapynsyqj4se173avq2pwr"></a>

The QlmCustomerSite must be configured as an IIS Application. It can share the same Application Pool as the QLM License Server. You should deploy the QlmCustomerSite folder alongside the QlmLicenseServer folder. You should never create the QlmCustomerSite folder as a subfolder of the QlmLicenseServer folder.

### Important QlmCustomerSite settings <a href="#h_01hfsapynt2x75prpzkng255ry" id="h_01hfsapynt2x75prpzkng255ry"></a>

* Database connection string (refer to the Configure the Database section in the Help)
* Default QLM Engine Version (defaultQlmVersion).
* SQL Syntax(sqlsyntax). Select "sql" (without the double quotes).
* Communication Encryption Key (communicationEncryptionKey). The communication encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* Admin Encryption Key (adminEncryptionKey). The admin encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* webServiceUrl: this is the URL to your QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)

### Configure the QlmPortal <a href="#h_01hfsapyntrdqytcn7cptnbftf" id="h_01hfsapyntrdqytcn7cptnbftf"></a>

The QlmPortal must be configured as an IIS Application. It can share the same Application Pool as the QLM License Server. You should deploy the QlmPortal folder alongside the QlmLicenseServer folder. You should never create the QlmPortal folder as a subfolder of the QlmLicenseServer folder.

### Important QlmPortal settings <a href="#h_01hfsapyntgkmxa65exss33sa0" id="h_01hfsapyntgkmxa65exss33sa0"></a>

* Database connection string (refer to the Configure the Database section in the Help)
* Default QLM Engine Version (defaultQlmVersion).
* SQL Syntax(sqlsyntax). Select "sql"  (without the double quotes).
* Communication Encryption Key (communicationEncryptionKey). The communication encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* Admin Encryption Key (adminEncryptionKey). The admin encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* webServiceUrl: this is the URL to your QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)

### Configure the QlmCustomerPortal <a href="#h_01hfsapynvhktepa4vxyrzkbne" id="h_01hfsapynvhktepa4vxyrzkbne"></a>

The QlmCustomerPortal consists of 2 services that must be configured as an IIS Application:

* qlm-portal-api
* qlm-portal-app

Both services can share the same Application Pool as the QLM License Server. You should deploy the QlmCustomerPortal folder alongside the QlmLicenseServer folder. You should never create the QlmCustomerPortal folder as a subfolder of the QlmLicenseServer folder.

#### QlmCustomerPortal/qlm-portal-app Configuration <a href="#h_01hfsapynv9yty5wcy2t4v33d3" id="h_01hfsapynv9yty5wcy2t4v33d3"></a>

Customize the following settings in the web.config file located in the QlmCustomerPortal/qlm-portal-app folder based on your needs:

* Database connection string (refer to the Configure the Database section in the Help)
* Default QLM Engine Version (defaultQlmVersion).
* SQL Syntax(sqlsyntax). Select "sql" (without the double quotes).
* Communication Encryption Key (communicationEncryptionKey). The communication encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* Admin Encryption Key (adminEncryptionKey). The admin encryption key is used to encrypt data transferred between QLM and the QLM Web service. This key is like a password that protects your data. You should use a value that is hard to guess and at least 8 characters long.
* webServiceUrl: this is the URL to your QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmxx)
* AllowedOrigins should be set to your primary domain. For example, if the URL to the qlm-portal-app is: [https://qlm3.net/company/qlm-portal-app](https://qlm3.net.com/company/qlm-portal-app,) set AllowedOrigins to [https://qlm3.net](https://qlm3.net.com/)

#### QlmCustomerPortal/qlm-portal-api Configuration <a href="#h_01hfsapynv8z7rjnqcemd2hgvf" id="h_01hfsapynv8z7rjnqcemd2hgvf"></a>

To configure 3rd party authentication, you need to acquire Client IDs as described [here](https://support.soraco.co/hc/en-us/articles/360049459532).

With a text editor, open the QlmCustomerPortal/qlm-portal-app/assets/appsettings.json file:

* Set the googleLoginKey field to your Google ClientID&#x20;
* Set the facebookLoginKey field to your Facebook App ID.
* Set the azureAuth / clientId field to the Azzure App ClientID
* Set the apiEndpoint to the URL of the QLM Customer Portal API site and append /api to the URL. Example: [https://qlm3.net/qlmdemo/qlmcustomerportal/qlm-portal-api/api](https://qlm3.net/qlmdemo/qlmcustomerportal/qlm-portal-api/api)

With a text editor, open the QlmCustomerPortal/qlm-portal-app/index.html file:

* Locate the \<base href=""> entry
* Set the value of href to the path of your qlm-portal-app virtual directory. For example, if the URL to the qlm-portal-app is: [https://qlm3.net/company/qlm-portal-app,](https://qlm3.net/company/qlm-portal-app,) set href to "/company/qlm-portal-app"
