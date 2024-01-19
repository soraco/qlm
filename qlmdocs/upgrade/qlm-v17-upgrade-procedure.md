# QLM v17 Upgrade Procedure

## Overview&#x20;

To upgrade to QLM v17, you must first install the QLM Management Console on your client system by running the qlmsetup17.exe. To determine if you are eligible for a v17 upgrade, you may contact us or click the About tab, then QLM License Wizard.

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed the QLM License Server by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always backup your database and your web.config files and site prior to upgrading. To backup your site, simply make a copy of your Qlm License Server folders.

After the server is installed, you must perform a DB Schema upgrade:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Click Upgrade DB Schema

#### Manual Upgrade

**QLM License Server Upgrade**

1. Update the DLLs on your web server with the DLLs located in %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
3. Ensure the Application Pool associated with the QLM License Server is set to use .NET 4.0.
4. Once the License Server is updated, start the QLM Management Console, go to Sites and click on Upgrade Database Schema.
5. If you are using our eCommerce integration, do the following:
   * Go to the Manage Keys tab
   * Click on the Commerce Providers item in the toolbar
   * Select the eCommerce provider you are using
   * Modify the Dll field and replace the existing value with QlmWebService.dll&#x20;
   * Ensure that the eCommerce Provider that you are using is enabled.

**QLM Portal Upgrade**

* On your web server, rename the QlmPortal folder to QlmPortal\_old
* Copy %Public%\Documents\Quick License Manager\DeployToServer\QlmPortal to your web server in the same location as the previous QlmPortal folder
* Edit the web.config file in the new QlmPortal and update the following settings to match the values in the previous web.config file:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * sqlSyntax

**QlmCustomerSite Upgrade**

* Note that QlmAspLicenseSite has been renamed to QlmCustomerSite
* On your web server, rename the QlmCustomerSite folder to QlmCustomerSite\_old
* Copy %Public%\Documents\Quick License Manager\DeployToServer\QlmCustomerSite to your web server in the same location as the previous QlmCustomerSite folder
* Edit the web.config file in the new QlmCustomerSite and update the following settings to match the values in the previous web.config file:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * sqlSyntax
* Update the IIS Application to point to the QlmCustomerSite folder instead of the QlmAspLicenseSite folder.

#### Source Code

To upgrade your source code to QLM v17:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licences, it is recommended that you review the new QLM Enterprise [sample](https://support.soraco.co/hc/en-us/articles/360041959372-How-to-support-floating-and-node-locked-licences-in-the-same-app) and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

As of QLM v14.1.21063.1, we no longer support QLM Engine Version 4.0 and earlier. For customers who purchased QLM v4- over 10 years ago: since the release of QLM v9, we've been advising you to migrate license keys that use QLM Engine version 4.0.00 to QLM Engine Version 6.0.00. The time has come to drop support for QLM Engine version 4.00. With this update, license keys that were created with QLM Engine v4.0.00 are no longer recognized.
