# What's new in QLM v10 and Upgrade Procedure

## **What's new in QLM v10**

**Revamped QLM License Wizard**

* Completely redesigned workflow.
* Includes Check for Updates to notify your customer of the latest eligible version based on the maintenance plan.
* A new user registration page that can automatically generate a trial key or email the user a trial key.
* Download and launch your setup from within the wizard.
* Offline Activation via a QR code scanned from a mobile device.
* Offline Deactivation via a QR code scanned from a mobile device.
* Automatically publishes Analytics Data to the License Server

| ![Wizard-Welcome.png](https://support.soraco.co/hc/article_attachments/115009061966/Wizard-Welcome.png)                 | ![Wizard-ActivationMethod.png](https://support.soraco.co/hc/article_attachments/115009061986/Wizard-ActivationMethod.png)                   |
| ----------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------- |
| ![Wizard-ActivateOnline.png](https://support.soraco.co/hc/article_attachments/115009062006/Wizard-ActivateOnline.png)   | ![Wizard-DeActivate.png](https://support.soraco.co/hc/article_attachments/115009191943/Wizard-DeActivate.png)                               |
| ![Wizard-ActivateOffline.png](https://support.soraco.co/hc/article_attachments/115009191963/Wizard-ActivateOffline.png) | ![Wizard-ActivateOfflineWithQRCode.png](https://support.soraco.co/hc/article_attachments/115009062066/Wizard-ActivateOfflineWithQRCode.png) |

**QLM Pro**

* Create your own custom [Product Properties](../fundamental-concepts/product-properties/) and set them when issuing a license key.
* Simplified search in the QLM Management Console with the new \<Common Fields> tag that searches across multiple common fields.
* LicenseValidator class now includes code to publish Analytics to the License Server.
* LicenseValidator class now includes code to retrieve custom Product Properties from the License Server.
* New APIs: ReadCookie and StoreCookie allow you to store custom data in the same location as the QLM license keys.
* New option to duplicate a License Server profile in Manage Keys / Sites
* Integration with ConfuserEx Obuscator
* Added support for specifying how many days a system can continue running without contacting the License Server (MaxDaysOffline, OfflinePeriodExceededAction).
* All QLM License Server methods now return an error code. The possible error codes are defined in the enum EServerErrorCode. The LicenseInfo object contains a new property called ServerErrorCode which will be populated after calling ParseResults.

**QLM Enterprise**

* Protection of Electron / Javascript apps
* Introduced the concept of product bundles. A bundle is a collection of products that can be installed on the same system. Users can manage license keys associated to a bundle by specifying the /bundle argument to the QLMLicenseWizard.exe or setting the QlmBundleFile property of the wizard control. A bundle file can be created from the Define Products page.
* When checking out a floating license node for offline usage, you can now specify the duration of the check-out up to a maximum value.
* Added support for protecting cross-platform Qt C++ applications.
* New APIs: ReadInstallID, WriteInstallID, UpdateLastAccessedDate
* Added the following Analytics charts:
  * Conversion Flow
  * Days Installed
  * Installs per Day
  * Last Accessed per day
  * Actual Usage per customer
  * Average usage by all customers
  * Products
  * Product Versions
  * Operating Systems

| ![Analytics-Dashboard.png](https://support.soraco.co/hc/article_attachments/115009192863/Analytics-Dashboard.png) |
| ----------------------------------------------------------------------------------------------------------------- |
| ![Analytics-Installs.png](https://support.soraco.co/hc/article_attachments/115009193163/Analytics-Installs.png)   |
| ![Analytics-Usage.png](https://support.soraco.co/hc/article_attachments/115009063026/Analytics-Usage.png)         |
| ![Analytics-Platforms.png](https://support.soraco.co/hc/article_attachments/115009063166/Analytics-Platforms.png) |

&#x20;

&#x20;**Core Features**

* The new QlmLicenseLib.dll no longer depends on IsLicense50.dll and is compatible with keys created by QLM v5+. If you still have customers with license keys issued with QLM v4-, you should generate new license keys for these customers or continue using the backward compatible QlmLicenseLib.dll located in C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net x.0\backwardCompatiblev4.
* New automatic license binding types: Computer Name, Mac Address, Volume Serial Number, Motherboard Serial Number, Active Directory Domain.
* New API QlmLicense.LaunchProcess to launch with elevated privileges.
* New Faster Ping
* The XML Settings file is now digitally signed to prevent manual edits to the file. You can call QlmLicense.ValidateSettingsFile to validate the file.
* The QLM .NET 4 libraries are now FIPS compliant.

**QlmAspLicenseSite**

* Renamed to QlmCustomerSite
* Most of the settings that were configurable from the web.config file are now exposed as Server Properties.

**QLM Portal**

* Added the ability to generate the license file or product properties file from the Portal.
* New Portal properties: MaxExpiryDate,&#x20;
* Added the ability to specify the maximum amount of subscription keys that can be created by a Portal user.
* Added support for attaching "Product Properties" to an email.
* Added the ability to generate the license file or product properties file from the Portal.
* Added 2 new User Group properties to enable the privilege of setting Features and Product Properties in the Portal.

**Upgrade Procedure**

To upgrade to QLM v10, you must first install the QLM Management Console on your client system by running the qlmsetup10.exe. To determine if you are eligible for a v10 upgrade, you may contact us or click the About tab / Check for updates.&#x20;

**QLM License Server Upgrade**

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your License server, there are 2 ways to upgrade: in-place or in parallel. An in-place upgrade will replace your existing server with the new one while the parallel upgrade allows you to run both servers in parallel until you are ready to switch. If you are upgrading from QLM v7+, the in-place upgrade is safe. If you are upgrading from earlier versions, we recommend the parallel upgrade.

**In-Place Upgrade**

1. Update the DLLs on your web server with the DLLs located in %Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
3. Ensure the Application Pool associated with the QLM License Server is set to use .NET 4.0.
4. Once the License Server is updated, start the QLM Management Console, go to Sites, and click on Upgrade Database Schema.
5. If you are using our eCommerce integration, do the following:
   * Go to the Manage Keys tab
   * Click on the Commerce Providers item in the toolbar
   * Select the eCommerce provider you are using
   * Modify the Dll field and replace the existing value with: QlmWebService.dll&#x20;
   * Ensure that the eCommerce Provider that you are using is enabled.

**Parallel Upgrade**

To upgrade the QLM License Server, we recommend that you create a new virtual directory and install a QLM License Server in parallel to your existing QLM 5.x or QLM 6.x, QLM 7.x, QLM 8.x or QLM 9.x License Server. Both License Servers can be configured to point to the same database. Once the QLM v10 License Server is configured and properly running, you can remove the QLM 5, 6, 7, 8 or 9 License Servers.&#x20;

1. Create a new folder called qlm10 on your web server in the same parent folder as your existing QLM License Server.
2. Copy the files located in %Public%\Documents\Quick License Manager\DeployToServer\QlmWebService to qlm10
3. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
4. Copy the following web.config settings from your existing QLM License Server web.config file to the new one:
   1. connectionStrings&#x20;
   2. communicationEncryptionKey
   3. adminEncryptionKey
   4. sqlSyntax
5. In IIS, create a new application and associate it to the same Application Pool as your existing QLM License Server.
6. Start the QLM application, go to Sites
7. Select your existing License Server
8. Click Copy and enter a new name of the copy
9. Update the URL to point to the new license server
10. Click on Upgrade Database Schema.
11. If you are using our eCommerce integration, do the following:
    * Go to the Manage Keys tab
    * Click on the Commerce Providers item in the toolbar
    * Select the eCommerce provider you are using
    * Modify the Dll field and replace the existing value with: QlmWebService.dll&#x20;
    * Ensure that the eCommerce Provider that you are using is enabled.

&#x20;

**QLM Portal Upgrade**

* On your web server, rename the QlmPortal folder to QlmPortal\_old
* Copy %Public%\Documents\Quick License Manager\DeployToServer\QlmPortal to your web server in the same location as the previous QlmPortal folder
* Edit the web.config file in the new QlmPortal and update the following settings to match the values in the previous web.config file:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * sqlSyntax

&#x20;

**QLMAspLicenseSite  Upgrade**

* Note that QlmAspLicenseSite has been renamed to QlmCustomerSite
* On your web server, rename the QlmAspLicenseSite folder to QlmAspLicenseSite\_old
* Copy %Public%\Documents\Quick License Manager\DeployToServer\QlmCustomerSite to your web server in the same location as the previous QlmAspLicenseSite folder
* Edit the web.config file in the new QlmCustomerSite and update the following settings to match the values in the previous web.config file:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * sqlSyntax
* Update the IIS Application to point to the QlmCustomerSite folder instead of the QlmAspLicenseSite folder.

To upgrade your source code to QLM v10:

* If you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* You may want to upgrade your LicenseValidator class to the new version. The new version contains additional code to optionally perform server-side validation. It also supports a seamless reactivation process for subscriptions. The new LicenseValidator class is currently available for C# VB.NET, VBA, and C++.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise sample and follow the same approach as the new sample.&#x20;

&#x20;

**IMPORTANT -** QLM Engine Version

If you are upgrading from QLM v4 or earlier and you have issued license keys with QLM Engine version 4.0.00, 3.0.00, 2.4.11, or 2.4.07, we highly recommend that you upgrade your customer's license keys to use QLM Engine version 5.0.00.
