# What's new in QLM v16 and Upgrade Procedure

## **What's new in QLM v16**

QLM v16 was released on May 26, 2022. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](../blog/iterative-releases.md).

### .NET 6

* The QLM Management Console now uses .NET6 – Windows
* QlmLicenseLib.dll is now available for .NET6
* The QlmLicenseWizard.exe is now available for .NET 6 – Windows only

### NuGet Packages

The QLM NuGet packages have been updated to support in a single NuGet package the following versions of .NET: .NET 4. NET Std 2, .NET Core 3 and .NET 6.&#x20;

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/8124312786708/mceclip0.png)

### QLM Management Console

* You can now create email notifications based on changes to the Customers table such as when a new customer is created.
* A tooltip over the Activation Key in the Manage Keys tab now displays Analytics information such as the real Last Accessed Date
* New Analytics features: Trial Conversion Rate, Trial Conversion Period, and much more.

![](https://soraco.co/wp-content/uploads/2022/05/AnalyticsTooltip.png)

* Setting the SMTP Server on the client side now automatically updates the server’s settings.

![](https://soraco.co/wp-content/uploads/2022/05/SMTPSettings.png)

### Scheduled Tasks

* You can now force the Start Time of a scheduled task to always run at a specified time.
* Performance and memory footprint improvement when sending automated emails.

![](https://soraco.co/wp-content/uploads/2022/05/ScheduledTasks.png)

### QLM License Wizard

* QlmTrialKeyUserGroup allows you to set the Affiliate ID when generating a trial key from the QLM License Wizard.
* QlmTrialKeyArgs allows you to set any argument when generating a trial key from the QLM License Wizard.
* QlmTrialKeyUserData allows you to set the User Data when generating a trial key from the QLM License Wizard.

### QLM Portal

* The QLM Portal now supports two-factor authentication. For more details, [click here](../qlm-portal/qlm-portal-two-factor-authentication.md).

### Library and API

* All QLM DLLs are now digitally signed.
* Added strong name validation of QlmLicenseLib.dll to the LicenseValidator class to prevent DLL hacking for non .NET applications that dynamically load the DLL. You must generate a new LicenseValidator class to take advantage of this feature.
* Added support for QlmUniqueSystemIdentifier2.
* Addition of 2 new database fields per Customer: User Data and External ID.
* Improvements to cloud-based floating licenses.
* New API GetUniqueCombinedSystemIdentifier that combines system identifiers.
* Added support for binding a license to a Docker Container. For more information, [click here](../how-to/how-to-bind-a-license-to-a-docker-container.md).

![Docker Container](https://soraco.co/wp-content/uploads/2022/05/DockerContainer.png)

### License Server

* Added 2 server properties to configure the trial registration form title and caption.

![](https://soraco.co/wp-content/uploads/2022/05/NewServerProperties.png)

### &#x20;

### QLM Customer Site

* QLM Self Help now displays the detailed license information including the number of remaining deactivations, Analytics Last Accessed Date, and Product Properties.

![](https://soraco.co/wp-content/uploads/2022/05/QlmSelfHelp-e1653180186652.png)



* Block Computer ID:  You can now block specific Computer IDs from being activated or validated on the server.

<figure><img src="https://soraco.co/wp-content/uploads/2022/05/BlockComputerIDs.png" alt=""><figcaption></figcaption></figure>

**Important Notes:**

As of QLM v14, we no longer support new installations with MS-Access as a database engine. If you are currently using MS-Access, you can continue using it and can safely upgrade to QLM v16. You should however consider migrating to SQL Server. You can use the QLM Backup/Restore functionality to migrate your data from MS-Access to SQL Server as described in this [article](../qlm-license-server/how-to-migrate-a-qlm-license-server-to-another-server.md).

## Upgrade Procedure

To upgrade to QLM v16, you must first install the QLM Management Console on your client system by running the qlmsetup15.exe. To determine if you are eligible for a v16 upgrade, you may contact us or click the About tab.&#x20;

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always backup your database and site before upgrading. To backup your site, simply make a copy of your Qlm License Server folders.

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

To upgrade your source code to QLM v16:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise [sample](../floating-licenses/how-to-support-floating-and-node-locked-licences-in-the-same-app.md) and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

As of QLM v14.1.21063.1, we no longer support QLM Engine Version 4.0 and earlier. For customers who purchased QLM v4- over 10 years ago: since the release of QLM v9, we've been advising you to migrate license keys that use QLM Engine Version 4.0.00 to QLM Engine Version 5.0.00. The time has come to drop support for QLM Engine version 4.00. With this update, license keys that were created with QLM Engine v4.0.00 are no longer recognized.
