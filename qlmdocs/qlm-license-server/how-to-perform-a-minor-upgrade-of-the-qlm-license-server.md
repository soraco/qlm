# How to upgrade the QLM License Server

When we release updates of a specific version of QLM, you typically need to update the QLM Management Console as well as the QLM License Server.

Before you proceed:

* Make a backup of your database
* Make a backup of all the QLM-related files on the server

There are two ways to upgrade the server: (1) using the installer or (2) by manually copying binary files.

### 1. QLM License Server Upgrade using the installer

If you performed the initial installation of the QLM License Server using the QlmLicenseServerSetup.exe installer, you can simply re-run the new installer to upgrade the License Server to the new version.

The QlmLicenseServerSetup.exe is located in the following folder, on the system where you installed the new version of the QLM Management Console:

```
%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServerSetup.exe
```

### 2. QLM License Server Manual Upgrade

You can also upgrade the server by copying the binary files from the new installation to your server.

Once you have upgraded the QLM Management Console to the latest version, locate the latest License Server binary files as shown below and copy them to the bin folder on your web server where you installed the QLM License Server.&#x20;

<pre><code><strong>For QLM v10 and higher:
</strong>
%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\bin

<strong>For QLM v8 and QLM v9:
</strong>
%Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\bin

<strong>For QLM v7 or earlier:
</strong>
C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmWebService\bin
</code></pre>

&#x20;

Additionally, you should update the web.config file as follows:

* Make a copy of the web.config file on the server
* Copy the web.config file from DeployToServer\QlmLicenseServer (or QlmWebService for older versions) to the server
* Edit the web.config and apply all customization you had performed on this file. At a minimum, you should update these settings:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * sqlSyntax

This procedure is only valid for minor upgrades. For major upgrades, refer to the specific procedure outlined for that upgrade. If you are upgrading from QLM 7.2 to QLM 8.0 or from QLM 8 to QLM 9/10, the minor upgrade procedure outlined in this article can be used.

#### DB Schema Upgrade

After the minor upgrade is completed, make sure you update the database schema as per the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the **Sites** menu item
* Select your site
* Click **Upgrade DB Schema**&#x20;

### QLM Customer Site Manual Upgrade

* Copy all the files in %Public%\Documents\DeployToServer\QlmCustomerSite to the corresponding folder on your License Server **except** the ones listed below:
  * %Public%\Documents\DeployToServer\QlmCustomerSite\web.config
  * %Public%\Documents\DeployToServer\QlmCustomerSite\QlmEmailLicense.aspx
  * %Public%\Documents\DeployToServer\QlmCustomerSite\index.html
  * %Public%\Documents\DeployToServer\QlmCustomerSite\default.aspx

### QLM Portal Manual Upgrade

* On your server, make a backup of the QlmPortal\web.config file to web.config.bak
* On your server, delete all the files in the QLM Portal folder except the backed up web.config.bak file
* Copy all the files from %Public%\Documents\DeployToServer\QlmPortal" to the corresponding folder on your server
* On your server, edit the new web.config file and update at a minimum the following settings:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * sqlSyntax
  * webServiceUrl

### QLM Customer Portal Manual Upgrade

* On your server, make a backup of the following files:
  * QlmCustomerPortal/qlm-portal-app/assets/appsettings.json
  * QlmCustomerPortal/qlm-portal-app/index.html
  * QlmCustomerPortal/qlm-portal-api/web.config
* On your server, delete all the files in the QLM Customer Portal folder&#x20;
* Copy all the files from %Public%\Documents\DeployToServer\QlmCustomerPortal" to the corresponding folder on your server
* On your server, edit the new QlmCustomerPortal/qlm-portal-api/web.config file and update at a minimum the following settings based on the backed-up file:
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * AllowedOrigins
  * connectionStrings
* On your server, replace the new QlmCustomerPortal/qlm-portal-app/assets/appsettings.json with the backed-up file.
* On your server, edit the new QlmCustomerPortal/qlm-portal-app/index.html  and update the \<base> entry based on the backed-up file
