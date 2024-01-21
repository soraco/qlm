# What's new in QLM v17 and upgrade procedure

## What's new in QLM v17

QLM v17 was released on March 3, 2023. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](https://docs.soraco.co/docs/blog/iterative-releases).

\-> [Latest Version Release Notes](https://soraco.co/products/qlm/ReleaseNotes.html)

### Important Changes in v17 <a href="#h_01h95qq4d75t05j62drs5q0gz6" id="h_01h95qq4d75t05j62drs5q0gz6"></a>

| In an effort to tighten security, **generic license keys are no longer supported by default**. Generic license keys are licenses that do not require activation and are not bound to a computer identifier. For example, if you embed a trial license in your source code, you are using a generic license key. After upgrading to this version, validation of a generic license key will fail unless you reenable it. To enable generic license keys on the client side, you must set the QlmLicense.AllowGenericKeys to true. To enable generic license keys on the server side, you must set the "security/AllowGenericKeys" server property to true.                                                                      |
| ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| When programmatically creating a QlmLicense object, the QLM Engine Version is now set to 6.0.00 by default. To force the QLM Engine Version to 5.0.00, you must explicitly set the QlmLicense.Version property to 5.0.00. This is required before calling any QLM API that creates license keys or modifies license keys such as subscription renewals, license upgrades, license updates, and license activation. If you are using the LicenseValidator class, you can either regenerate the LicenseValidator class or simply set the QlmLicense.Version property in the LicenseValidator constructor. For more information, read about the new [QLM License Models](https://docs.soraco.co/docs/how-to/qlm-license-models). |
| When creating licenses from the QLM Management Console or the QLM Portal, you need to ensure that the Engine Version is set according to your requirements. If you are an existing customer and you upgrade to QLM v17 on your current computer, the default settings for the Engine Version will be 5.0.00. However, if you are an existing customer and you install QLM on a new computer, the default settings for the Engine Version will be 6.0.00. Follow the instructions [here ](../fundamental-concepts/qlm-license-models.md)to configure your system to create license keys using Engine Version 5.0.00 by default.                                                                                                |
| The QlmLicenseLibNetCore.dll and QlmLicenseLibNetStd.dll have been renamed to QlmLicenseLib.dll. This applies to the files distributed within the QLM installation as well as the QlmLicenseLib nuget package.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| The QLM License Server Gateway is now decommissioned.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| Update to the LicenseValidator class to support the new QLM License Models. If you use the new License Models introduced with QLM v17, you will need to regenerate the LicenseValidator class.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |

### QLM License Engine v6

* New License Models embedded in the license key to easily identify the license type. For more details, [click here](https://docs.soraco.co/docs/how-to/qlm-license-models).

### QLM Management Console

* UserData can now be viewed and edited in JSON format.

![](https://soraco.co/wp-content/uploads/2023/02/json.png)

* Bulk Editing of License Keys

![](https://soraco.co/wp-content/uploads/2023/03/image.png)

### Email Integration

* Added support for sending emails using the Gmail API. Enabling less secure applications in Gmail is no longer necessary when using the Gmail Api to send emails. For more details, [click here](https://docs.soraco.co/docs/how-to/sending-emails-using-the-gmail-api).
* Microsoft Graph API: added support for embedding images using Content-ID. Some email clients cannot properly display images that are embedded as base64 images.

<figure><img src="https://soraco.co/wp-content/uploads/2023/02/gmailAPI.png" alt=""><figcaption></figcaption></figure>

### QLM Portal

* Many performance improvements
* The tooltip displayed over the Activation Key or the Computer Key cell in the grid has been replaced with a popup that's triggered by clicking the Activation Key or the Computer Key cell.
* The tooltip displayed over the Product Properties cell in the grid now displays a list of properties and their values.
* Improved handling of session timeouts.
* The Preview tab when sending emails now supports previewing Product Properties.

### Library and API

* New API to manage organizations (for QLM Enterprise customers).

### E-commerce Integration

* Shopify: Added support for mapping Shopify options to QLM features.\
  Added support for Shopify Webhook Authentication. For more details, [click here](https://docs.soraco.co/docs/3rd-party-integration/shopify-how-to-integrate-qlm-with-shopify).
* WooCommerce: added support for passing the \&is\_userData1 argument.

### QLM Customer Site

* Added a new server property customerSite/showSubscribeToMailList to enable the corresponding checkbox on the Trial Registration Form.
* Added a new server property customerSite/subscribeToMailListDefaultState to set the default state of the corresponding checkbox on the Trial Registration Form.
* Server properties minimumDaysBetweenTrials and minimumDaysBetweenTrialsDateField were moved to the options group rather than customerSite.

### IMPORTANT NOTES

<table data-header-hidden><thead><tr><th width="127.33333333333331"></th><th width="184"></th><th></th></tr></thead><tbody><tr><td><img src="https://support.soraco.co/hc/article_attachments/15880993747220" alt=""></td><td><strong>Important Change</strong></td><td>In an effort to tighten security, <strong>generic license keys are no longer supported by default</strong>. Generic license keys are licenses that do not require activation and are not bound to a computer identifier. For example, if you embed a trial license in your source code, you are using a generic license key. After upgrading to this version, validation of a generic license key will fail unless you reenable it. To enable generic license keys on the client side, you must set the QlmLicense.AllowGenericKeys to true. To enable generic license keys on the server side, you must set the "security/AllowGenericKeys" server property to true.</td></tr><tr><td><img src="https://support.soraco.co/hc/article_attachments/15880993747220" alt=""></td><td><strong>Important Change</strong></td><td>When programmatically creating a QlmLicense object, the QLM Engine Version is now set to 6.0.00 by default. To force the QLM Engine Version to 5.0.00, you must explicitly set the QlmLicense.Version property to 5.0.00. This is required before calling any QLM API that creates license keys or modifies license keys such as subscription renewals, license upgrades, license updates, and license activation. If you are using the LicenseValidator class, you can either regenerate the LicenseValidator class or simply set the QlmLicense.Version property in the LicenseValidator constructor. For more information, read about the new <a href="https://docs.soraco.co/docs/how-to/qlm-license-models">QLM License Models</a>.</td></tr><tr><td><img src="https://support.soraco.co/hc/article_attachments/15880993747220" alt=""></td><td><strong>Important Change</strong></td><td>The QlmLicenseLibNetCore.dll and QlmLicenseLibNetStd.dll have been renamed to QlmLicenseLib.dll. This applies to the files distributed within the QLM installation as well as the QlmLicenseLib nuget package.</td></tr><tr><td><img src="https://support.soraco.co/hc/article_attachments/15880993747220" alt=""></td><td><strong>Important Change</strong></td><td>The QLM License Server Gateway is now decommissioned.</td></tr><tr><td><img src="https://support.soraco.co/hc/article_attachments/15880993747220" alt=""></td><td><strong>Important Code Change</strong></td><td>Update to the LicenseValidator class to support the new QLM License Models. If you use the new License Models introduced with QLM v17, you will need to regenerate the LicenseValidator class.</td></tr></tbody></table>

As of QLM v14, we no longer support new installations with MS-Access as a database engine.&#x20;

As of QLM v14.1.21063.1, we no longer support QLM Engine Version 4.0 and earlier. For customers who purchased QLM v4- over 10 years ago: since the release of QLM v9, we've been advising you to migrate license keys that use QLM Engine version 4.0.00 to QLM Engine Version 5.0.00. The time has come to drop support for QLM Engine version 4.00. With this update, license keys that were created with QLM Engine v4.0.00 are no longer recognized.

### Upgrade Procedure

To upgrade to QLM v17, you must first install the QLM Management Console on your client system by running the qlmsetup17.exe. To determine if you are eligible for a v17 upgrade, you may contact us or click the About tab.&#x20;

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always backup your database and site prior to upgrading. To backup your site, simply make a copy of your Qlm License Server folders.

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
* If you have implemented floating licences, it is recommended that you review the new QLM Enterprise [sample ](https://docs.soraco.co/docs/step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app)and follow the same approach as the new sample.&#x20;
