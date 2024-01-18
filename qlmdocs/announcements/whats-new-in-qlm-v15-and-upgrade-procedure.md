# What's new in QLM v15 and Upgrade Procedure

## **What's new in QLM v15**

QLM v15 was released on April 30, 2021. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](https://support.soraco.co/hc/en-us/articles/207989373-Iterative-Releases).

### QLM License Wizard

* [The wizard can now activate a license by email using 3rd party authentication providers such as Google, Facebook and Azure AD](https://support.soraco.co/hc/en-us/articles/360059484572).
* Activation by email is now supported for multiple activation license keys.
* Activation via a QR code can now download the license file to the mobile device.
* [In Check for Updates, the setup package can now be downloaded from Google Drive or One Drive.](https://support.soraco.co/hc/en-us/articles/360059545432)
* New dark colour theme for the QLM License wizard. To use this theme, copy the settings from the Demo Enterprise product.

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360094052611/mceclip1.png)

### &#x20;Cross-Platform

* [Added support for JUCE C++.](https://support.soraco.co/hc/en-us/articles/360059949352)
* [Added support for Qt C++ 6.x.](https://support.soraco.co/hc/en-us/articles/360059948632)

### QLM Management Console&#x20;

* The Server Properties editor has now a special editor for properties that maintain a list of items.
* The Server Properties editor now hides the text for properties of type password.
* The Protect Your Application wizard now hides the text for properties of type password.
* The Protect Your Application wizard has a new option to reset all properties to factory settings.

### Scheduled Tasks

* [Scheduled tasks can now involve webhook URLs.](https://support.soraco.co/hc/en-us/articles/360060160132) Available in QLM Enterprise only.
* A "Run Now" button allows running the task within 60 seconds.

### QLM Customer Site

* You can now configure a custom URL to detect disposable email accounts and reject them. To enable this feature, you must set server property disposableEmailDetectorUrl to the URL of a service that detects disposable emails. Example: [https://disposable.debounce.io](https://disposable.debounce.io/)
* You can now provide server properties as arguments to the QLM Trial Registration Form by using the is\_pp command-line argument. Details of the syntax are described [here](https://support.soraco.co/hc/en-us/articles/115000785306-How-to-use-Product-Properties).

### Miscellaneous updates

* For multiple activation license keys, you can now associate a user to an activation.
* A new Organization level setting called 'AllowOrganizationUsersToAcquireLicenses' determines if a user that belongs to an organization is allowed to activate a license using an email address.
* Server Properties of type password are now encrypted at rest.
* New [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563):
  * options/allowActivatingOlderVersion: Allow users to activate a license of a product version smaller than the original one. For example, if a customer purchases Version 2.0, setting this property to true will allow the user to activating their license for Version 1.0.
  * authentication/authentication\_wizard\_facebookAppId
  * authentication/authentication\_wizard\_facebookAppSecret
  * authentication/authentication\_wizard\_facebookOAuthRedirectURI
  * authentication/authentication\_wizard\_googleClientId
  * authentication/authentication\_wizard\_googleSecretId
  * authentication/authentication\_wizard\_azureClientId
  * authentication/authentication\_cloudDrive\_azureClientId
  * authentication/authentication\_cloudDrive\_googleClientId
  * authentication/authentication\_cloudDrive\_googleP12KeyPath
  * customerSite/disposableEmailDetectorUrl&#x20;
* Bug fixes.

As of QLM v14, we no longer support new installations with MS-Access as a database engine. If you are currently using MS-Access, you can continue using it and can safely upgrade to QLM v15. You should however consider migrating to SQL Server. You can use the QLM Backup/Restore functionality to migrate your data from MS-Access to SQL Server as described in this [article](https://support.soraco.co/hc/en-us/articles/202795740-How-to-migrate-a-QLM-License-Server-to-another-server).

### Upgrade Procedure

To upgrade to QLM v15, you must first install the QLM Management Console on your client system by running the qlmsetup15.exe. To determine if you are eligible for a v15 upgrade, you may contact us or click the About tab.&#x20;

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always backup your database and site prior to upgrading. To backup your site, simply make a copy of your Qlm License Server folders.

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

To upgrade your source code to QLM v15:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licences, it is recommended that you review the new QLM Enterprise [sample](https://support.soraco.co/hc/en-us/articles/360041959372-How-to-support-floating-and-node-locked-licences-in-the-same-app) and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

As of QLM v14.1.21063.1, we no longer support QLM Engine Version 4.0 and earlier. For customers who purchased QLM v4- over 10 years ago: since the release of QLM v9, we've been advising you to migrate license keys that use QLM Engine version 4.0.00 to QLM Engine Version 5.0.00. The time has come to drop support for QLM Engine version 4.00. With this update, license keys that were created with QLM Engine v4.0.00 are no longer recognized.
