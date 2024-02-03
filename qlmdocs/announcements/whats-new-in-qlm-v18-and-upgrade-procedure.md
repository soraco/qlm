# What's new in QLM v18 and upgrade procedure

## What's new in QLM v18

QLM v18 was released on January 26, 2024. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](https://docs.soraco.co/docs/blog/iterative-releases).

\-> [Latest Version Release Notes](https://soraco.co/products/qlm/ReleaseNotes.html)

### Important Changes in v18 <a href="#h_01h95qq4d75t05j62drs5q0gz6" id="h_01h95qq4d75t05j62drs5q0gz6"></a>

The QLM Customer Site pages were redesigned to be responsive to different device form factors. This may impact how your Self-Help pages are displayed on your site. We recommend that you review and adapt your site accordingly after the upgrade.

As of QLM v18, QLM will be sold exclusively on a subscription basis. Customers who have purchased a perpetual license with a maintenance plan can continue to use QLM as before and upgrade to newer versions as long as the maintenance plan remains active. All new purchases, version upgrades without an active maintenance plan, or edition upgrades will be offered on a subscription basis only.

As of QLM v18, all QLM Extensions (e-commerce extensions) will be sold separately as add-ons. Customers who purchased QLM v17 or earlier can continue to use QLM Extensions at no additional cost.

### .NET Support

* The QlmLicenseLib.dll is now available for .NET2, .NET4, .NET6, NET7 and .NET8.
* The QlmControls.dll is now available for .NET2, .NET4, .NET6-Windows, .NET7-Windows and .NET8-Windows.

### New Requirements

* The minimum requirement for .NET 4 is .NET 4.62.
* The QLM Management Console now requires .NET 8.
* The QLM Management Console and the QLM Portal now reference DevExpress 23.2.3.

### Documentation

The QLM Documentation has moved to: [https://docs.soraco.co](https://docs.soraco.co)

### QLM Enterprise New Features

* QLM Management Console: When creating license keys, you can now define templates for different settings combinations. This is useful to speed up the creation of predefined configurations of products, features, product properties, etc.
* QLM Management Console: A new Global Search feature performs a deep search looking for relationships between licenses and reports results found in multiple QLM tables.
* The Java client-side library now supports reading Product Properties files.
* On-premise floating licenses - allow different nodes to run different versions of the application.

### QLM Customer Site New Features

* All self-help pages are now responsive and adapt to difference device form factors. This may impact how your Self-Help pages are displayed on your site. We recommend that you review and adapt your site accordingly.
* In addition to debounce.io, QLM now supports the following spam verifiers: https://api.zerobounce.net/v2/validate, https://verifymail.io/api
* On the offline activation page, you can now hide the products dropdown list when the product is specified on the command line.
* Two new server properties, disallowedIPAddressMessage, and disallowedEmailMessage, allow you to customize the message displayed to the user when their IP address is blocked or their email is banned.
* You can now block trial registration by country. This feature requires the geolocation service provided by https://api.ipstack.com

### QLM Professional New Features

* Searches are now automatically uploaded to the server after they are modified in the Searches editor. Note that searches are shared by all QLM Management Console users.
* A scheduled task status icon is now displayed in the QLM Management Console title bar and displays errors that occurred when processing scheduled tasks.
* You can now block license activation by country. This feature requires the geolocation service provided by http://api.ipstack.com
* Bulk Edit - Added support for setting the following properties: MaxReleaseCount, MaxReleasePeriod, ActivationCount, UserData, and Comment. Additionally, you can now disable the Maintenance Plan for a batch of licenses.
* New skins are now available with light and dark modes. You can access the new skins from Settings / Options / Display. We recommend trying out the WXI / Sharpness skin.
* A new generic extension called QlmAuthenticationProvider was added to enable the use of the QLM HTTP API without the need for an ecommerce provider. The QlmAuthenticationProvider returns responses as XML fragments.

### Upgrade Procedure

To upgrade to QLM v18, you must first install the QLM Management Console on your client system by running the qlmsetup17.exe. To determine if you are eligible for a v18 upgrade, you may contact us or click the About tab.

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always back up your database and site before upgrading. To back up your site, simply make a copy of your Qlm License Server folders.

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
   * Modify the Dll field and replace the existing value with QlmWebService.dll
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

To upgrade your source code to QLM v18:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise [sample ](https://docs.soraco.co/docs/step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app)and follow the same approach as the new sample.
