# What's new in QLM v11 and Upgrade Procedure

## **What's new in QLM v11**

**GDPR**

General Data Protection Regulation ([GDPR](https://en.wikipedia.org/wiki/General\_Data\_Protection\_Regulation)) is a regulation in EU law on data protection and privacy for all individuals within the European Union. It takes effect on May 25, 2018.

QLM v11 provides the tools you need to request and track privacy policy consent from your customers. Here are the GDPR-related changes in QLM v11:

* The QLM License Wizard includes a new Privacy Policy page that the user must consent to before activating a license or registering a user.
* The QLM Customer Site Trial Registration Form now requires the user to consent to a Privacy Policy before registering to download a trial.
* The QLM License Wizard and the QLM Trial Registration web page now include a field to specify the customer's country.
* New API method QlmLicense.UpdatePrivacyConsent.
* New HTTP method UpdatePrivacyConsentHttp
* 2 new fields were added to the Customers table: PrivacyPolicyConsent and PrivacyPolicyLastUpdate. These fields are automatically populated from the QLM License Wizard, from the QLM Trial Registration Form, and from the QLM UpdatePrivacyPolicy and UpdatePrivacyPolicyHttp APIs.
* A sample email template was added to request Privacy Policy consent from your existing customers: PrivacyPolicy.Consent
* A sample email template was added to send customers an email containing the data that was collected about them: PrivacyPolicy.CollectedData
* An audit trail of changes to the Privacy Policy is now recorded in a new table in the DB (AuditTrail)

**Activation By Authorization Code**

With QLM Pro v11, your customers no longer need to deal with license keys. The QLM License Wizard supports activation by authorization code. Here's how it works:

* When your application starts up, you launch the QLM License Wizard
* The user selects to activate online and instead of entering an Activation Key, he/she enters the email address used at the time of purchase
* An email or SMS message (requires a Twilio account) is automatically sent to the user with a 6-digit code
* The user enters the 6-digit code in the wizard and voila, the license is activated.

Activation by authorization code is currently ideal for single activation keys since only a single email address can be associated with a license. A solution will be implemented for multiple activation keys in a future update. For more details, [click here](../how-to/online-activation-by-authorization-code.md).

&#x20;

| ![](https://support.soraco.co/hc/article\_attachments/360001127246/mceclip8.png) | ![](https://support.soraco.co/hc/article\_attachments/360001127266/mceclip9.png) | ![](https://support.soraco.co/hc/article\_attachments/360001127226/mceclip3.png) |
| -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| ![](https://support.soraco.co/hc/article\_attachments/360001127923/mceclip6.png) | ![](https://support.soraco.co/hc/article\_attachments/360001127943/mceclip7.png) |                                                                                  |

**License Server Gateway**

QLM Enterprise v11 includes a license server gateway that you can install at your customer site.

The License Server gateway is ideal in scenarios where your customers' workstations are offline. Rather than using offline activation which involves some manual procedures, you can install the QLM License Server Gateway at your customer's site on a system that is connected to the internet. All workstations that are not connected to the internet can then be configured to connect to the local QLM License Server Gateway which will redirect requests to the real QLM License Server hosted in the cloud.

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360001137106/mceclip0.png)

**Miscellaneous updates**

* The EULA can now be configured as one of the pages of the QLM License Wizard and will not allow the user to activate a license unless the EULA terms are accepted.
* You can now customize the icons in the QLM License Wizard.
* Added new [license binding](../api-reference/qlmlicense/enums/elicensebinding.md) option: System Management Bios Uuid (for virtual machines) and QlmUniqueSystemIdentifier1.
* You can now send customers emails from the Manage Customers tab
* New API QlmLicense.LaunchProcessEx allows specifying the working directory
* Added the ability to exclude a product from check for updates. This is useful prior to releasing a new version of a product, for testing purposes.
* When wrapping an executable, you can now have the executable automatically check for updates every time it is launched (QlmExeWrapperCheckForUpdates)
* You can now protect batch files by wrapping them in an executable.
* You can now protect AutoHotKey files by wrapping them with an executable.
* New command line tool QlmSignFile.exe to digitally sign the settings XML file.
* Added support for generating a LicenseValidator class for Qt C++ Windows only. Also added a new Qt C++ Windows-only sample.
* Improvement to Avangate / 2Checkout integration to support a maintenance plan renewal.
* You can now embed product properties in an email template. The syntax is: %Properties.category.name%.
* Added the concept of [Organizations](../how-to/organizations.md) to reliably associate customers that belong to the same company. A customer can now be associated to an Organization. Organizations can be created from the Manage Customers tab.
* When you update the definition of a product that has product properties, pre-existing license keys must be upgraded in order to make use of the new product properties. You can now upgrade product properties from Manage Keys / Sites / Advanced.
* Renewing a subscription from the QLM Management console now operates on all selected records.
* Added support for cc'ing the User Group owner when sending scheduled emails.
* QlmCustomerSite is now localized in multiple languages.
* QlmCustomerSite Offline Activation form now includes a checkbox that allows the user to select whether to generate a license file.
* All icons in the QLM License Wizard can now be customized.
* You can now associate each customer with an Organization.
* Integration with eCommerce provider Chargify
* Added support for 'not like' and 'is not' in the Manage Keys search area.
* Added HTTP Analytics API.
* You can now unlock a user account from the QLM Management Console. User accounts are locked after several failed login attempts to the QLM Portal.
* The QLM binaries are now published to Nuget.
* You can now archive expired trials or revoked licenses (Manage Keys / Archive)
* Enhancements to the QLM WooCommerce plugin

&#x20;

**Bug Fixes**

* Fixed bug when calling GetActivationKeyFromUserData
* Fixed a bug where the QLM License Wizard had hard-coded references to Gothic fonts.

**QuickBooks Integration**

QLM Enterprise v11 includes a QuickBooks module that can be configured to automatically create a customer and a license key when an invoice is paid in QuickBooks.

**Office 365 Integration**

QLM Enterprise v11 includes an Office 365 module that can be used to import / export contacts from Office 365 to QLM or vice versa.&#x20;

&#x20;

**Upgrade Procedure**

To upgrade to QLM v11, you must first install the QLM Management Console on your client system by running the qlmsetup11.exe. To determine if you are eligible for a v11 upgrade, you may contact us or click the About tab.&#x20;

**QLM License Server Upgrade**

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your License server, there are 2 ways to upgrade: in-place or in parallel. An in-place upgrade will replace your existing server with the new one while the parallel upgrade allows you to run both servers in parallel until you are ready to switch. If you are upgrading from QLM v7+, the in-place upgrade is safe. If you are upgrading from earlier versions, we recommend the parallel upgrade.

**In-Place Upgrade**

1. Update the DLLs on your web server with the DLLs located in %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
3. Ensure the Application Pool associated to the QLM License Server is set to use .NET 4.0.
4. Once the License Server is updated, start the QLM Management Console, go to Sites, and click on Upgrade Database Schema.
5. If you are using our eCommerce integration, do the following:
   * Go to the Manage Keys tab
   * Click on the Commerce Providers item in the toolbar
   * Select the eCommerce provider you are using
   * Modify the Dll field and replace the existing value with: QlmWebService.dll&#x20;
   * Ensure that the eCommerce Provider that you are using is enabled.

**Parallel Upgrade**

To upgrade the QLM License Server, we recommend that you create a new virtual directory and install a QLM License Server in parallel to your existing QLM 5.x or QLM 6.x, QLM 7.x, QLM 8.x, QLM 9.x or QLM 10.x License Server. Both License Servers can be configured to point to the same database. Once the QLM v11 License Server is configured and properly running, you can remove the QLM 5, 6, 7, 8, 9 or 10 License Servers.&#x20;

1. Create a new folder called qlm11 on your web server in the same parent folder as your existing QLM License Server.
2. Copy the files located in %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer to qlm11
3. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
4. Copy the following web.config settings from your exising QLM License Server web.config file to the new one:
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

**QLM Portal Upgrade**

* On your web server, rename the QlmPortal folder to QlmPortal\_old
* Copy %Public%\Documents\Quick License Manager\DeployToServer\QlmPortal to your web server in the same location as the previous QlmPortal folder
* Edit the web.config file in the new QlmPortal and update the following settings to match the values in the previous web.config file:
  * connectionStrings
  * communicationEncryptionKey
  * adminEncryptionKey
  * webServiceUrl
  * sqlSyntax

**QlmCustomerSite (formerly QLMAspLicenseSite) Upgrade**

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

To upgrade your source code to QLM v11:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* You may want to upgrade your LicenseValidator class to the new version. The new version contains additional code to optionally perform server-side validation. It also supports a seamless reactivation process for subscriptions. The new LicenseValidator class is currently available for C# VB.NET, VBA, and C++.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise sample and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

If you are upgrading from QLM v4 or earlier and you have issued license keys with QLM Engine version 4.0.00, 3.0.00, 2.4.11, or 2.4.07, we highly recommend that you upgrade your customer's license keys to use QLM Engine version 5.0.00.
