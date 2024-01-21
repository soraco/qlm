# What's new in QLM v14 and Upgrade Procedure

## **What's new in QLM v14**

QLM v14 was released on May 2, 2020. Some of the features listed below may occur in a minor update following the initial v14 release. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](../blog/iterative-releases.md).

### QLM License Wizard

* The wizard can now allow the end-user to select whether to activate a node-locked license or a floating license. For more details, review the [new sample application.](../step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app.md)
* The wizard can now automatically download a digitally signed license file when a license is activated online.&#x20;
* The wizard can now automatically download a digitally signed product properties file when a license is activated online.&#x20;

### QLM Portal

* Analytics charts are now displayed in the Portal.&#x20;

### QLM Customer Portal (post-release June 2020)

* Brand new Customer Portal allows your customers to manage their licenses from your website.

### &#x20;Cross-Platform

* &#x20;Added support for Swift apps on OS X

### Email Notifications

* Improved built-in email templates.
* Improved process of importing [external email templates.](../how-to/external-email-templates.md)
* Receive a daily email report of all [illegal computers.](../how-to/how-to-send-email-notifications-when-an-illegal-computer-is-detected.md)
* Receive a daily email report of all [failed activations.](../how-to/how-to-send-email-notifications-when-an-activation-attempt-is-detected.md)
* Send your customer (and yourself) an email notification when we detect an [illegal computer.](../how-to/how-to-send-email-notifications-when-an-illegal-computer-is-detected.md)
* Send your customer (and yourself) an email notification when an [activation attempt](../how-to/how-to-send-email-notifications-when-an-activation-attempt-is-detected.md) fails.
* New option to skip sending emails if there's no data to send. This option is configurable from Manage Keys / Options.

### Floating Licenses

* Improved floating license process. A new sample that shows how to support node-locked and floating licenses in the same application.

### QLM Management Console&#x20;

* Added an option to exclude revoked, expired, and trial licenses when performing searches.
* Added date range filter to Illegal Computers.
* Added date range filter to Activation Attempts.
* The Protect Your application wizard now allows copying settings from another product.

### Miscellaneous updates

* MaxReleaseCount and MaxReleasePeriodInDays can now be configured per license.
* Http method ReleaseLicenseHttp can now require a verification code (is\_deactivation\_code).
* Http method GetActivationKey now accepts a legacy key argument (is\_legacykey).
* All HTTP methods now support the is\_locale argument that can set the language of the messages returned by the server. Example: \&is\_locale=fr
* New [Server Properties](../qlm-license-server/server-properties.md):
  * releaseLicenseRequiresVerificationCode: Specify whether a deactivation verification code is required when calling ReleaseLicenseHttp.
  * errorMessageEmailNotFound. When requesting license keys to be sent by email from the QLM Self Help page, if the specified email is not found in the system, you can now customize the error message displayed to the user.
  * maxReleaseCountAbsolute: Determines whether the value of maxReleaseCount is absolute or proportional to the number of licenses.
  * minimumDaysBetweenTrials:  Allows configuring the number of days a user must wait before requesting a new trial.
  * customerSite / forceLicenseModelToTrial: Force the license model of all license keys created by the Trial Registration Form to trial. This is the default and recommended value.
  * customerSite / showProductVersion: Set this property to true to display the product's version on the Offline Activation page.
  * customerSite / errorMessageEmailNotFound: When requesting license keys to be sent by email from the QLM Self Help page, if the specified email is not found in the system, you can now customize the error message displayed to the user.
  * customerSite/ showComputerKeyFieldWhenGeneratingLicenseFile: Determines whether to show the Computer Key field when the Generate License file checkbox is checked.
  * customerSite / setOrganizationFromEmail: When customers request a trial license, this setting instructs QLM to identify and set the organization based on the customer's email address.
* A license can now be associated with an organization.
* You can now configure QLM to regularly delete server event logs older than a specified number of days. By default, QLM will now delete logs that are older than 30 days. This option is configurable from Manage Keys / Sites / Advanced.
* The QLM Licence Wizard and QlmLicense.ActivateLicense APIs now automatically write the QlmLicense.ApplicationVersion value into the ClientVersion field in the database. You can now tell exactly which version of your application your customer is running
* Added support for detecting KVM virtual machines.
* The digitally signed XML license file generated by the server now includes the number of remaining available licenses.
* New HTTP method RetrieveActivationKeyHttp .
* FastSpring - Added support for HMAC validation.
* A new version of the ReleaseLicense API with an additional argument to instruct the server to skip logging the deactivation. This should be used when implementing cloud-based floating licenses to avoid bloating of the database.
* Bug fixes.

As of QLM v14, we will no longer support new installations with MS-Access as a database engine. If you are currently using MS-Access, you can continue using it and can safely upgrade to QLM v14. You should however consider migrating to SQL Server. You can use the QLM Backup/Restore functionality to migrate your data from MS-Access to SQL Server as described in this [article](../qlm-license-server/how-to-migrate-a-qlm-license-server-to-another-server.md).

**Upgrade Procedure**

To upgrade to QLM v14, you must first install the QLM Management Console on your client system by running the qlmsetup14.exe. To determine if you are eligible for a v14 upgrade, you may contact us or click the About tab.&#x20;

**QLM License Server Upgrade**

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, there are 2 ways to upgrade: in-place or in parallel. An in-place upgrade will replace your existing server with the new one while the parallel upgrade allows you to run both servers in parallel until you are ready to switch. If you are upgrading from QLM v7+, the in-place upgrade is safe. If you are upgrading from earlier versions, we recommend the parallel upgrade.

**In-Place Upgrade**

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

**Parallel Upgrade**

To upgrade the QLM License Server, we recommend that you create a new virtual directory and install a QLM License Server in parallel to your existing QLM 5.x or QLM 6.x, QLM 7.x, QLM 8.x, QLM 9.x, QLM 10.x, QLM 11.x or QLM 21.x License Server. Both License Servers can be configured to point to the same database. Once the QLM v14 License Server is configured and properly running, you can remove the QLM 5, 6, 7, 8, 9, 10, 11 or 12 License Servers.&#x20;

1. Create a new folder called qlm14 on your web server in the same parent folder as your existing QLM License Server.
2. Copy the files located in %Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer to qlm14
3. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmLicenseServer\Db\sql2005.aspnet.sql. This step is not required if you were running QLM v7+.
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

To upgrade your source code to QLM v14:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise [sample](../step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app.md) and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

If you are upgrading from QLM v4 or earlier and you have issued license keys with QLM Engine version 4.0.00, 3.0.00, 2.4.11 or 2.4.07, we highly recommend that you upgrade your customers' license keys to use QLM Engine version 5.0.00.&#x20;
