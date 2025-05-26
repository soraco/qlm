# What's new in QLM v19 and upgrade procedure

## What's new in QLM v19

QLM v19 was released on January 15, 2025. Note that our major releases are not loaded with a massive amount of new features. Features are added gradually throughout the year and released when they are ready. To learn more about our release process, [click here](https://docs.soraco.co/docs/blog/iterative-releases).

-> [Latest Version Release Notes](https://soraco.co/products/qlm/ReleaseNotes.html)

### Important Changes in v19 <a href="#h_01h95qq4d75t05j62drs5q0gz6" id="h_01h95qq4d75t05j62drs5q0gz6"></a>

* If you are hosting your own License Server, before upgrading to this version, you MUST ensure that the QLM database login user has the db\_securityadmin role. You can use the following command to add it (change qlm\_user as needed): EXEC sp\_addrolemember N'db\_securityadmin', N'qlm\_user'
* The function QlmLicense.ActivateLicenseDialog was removed from QlmLicenseLib.dll (.NET 4) because it forced QlmLicenseLib.dll to depend on System.Windows.Forms. If you are using this function, you will need to reference QlmControls.dll in addition to QlmLicenseLib.dll.

### .NET Support

* The QlmLicenseLib.dll is now available for .NET2, .NET4, .NET6, NET7, .NET8 and .NET9.
* The QlmControls.dll is now available for .NET2, .NET4, .NET6-Windows, .NET7-Windows, .NET8-Windows and .NET9-Windows.

### New Requirements

* The minimum requirement for .NET 4 is .NET 4.62.
* The QLM Management Console now requires .NET 9 (requires Windows 10 or higher).
* The QLM Management Console and the QLM Portal now reference DevExpress 24.2.3.

### Documentation

The QLM Documentation has moved to: [https://docs.soraco.co](https://docs.soraco.co)

### QLM Enterprise New Features

* Product Properties: 3 new product properties data types are now available: IP Address, IP Subnet and CSV.
* Product Properties: a new feature allows you to enforce that a specific product property has a specified value during activation. For example, you could define a new Product Property of type 'IP Address' and specify that this property should be enforced during activation.
* Java protection: added support for license file signed using SHA256 instead of SHA1.
* New Server Property: security/whiteListedIPAddresses: specifies a list of IP addresses that are allowed to request trial registrations regardless of the restrictions imposed by customerSite / preventRegistrationFromExistingIPAddress
* Changes to 3rd party extensions settings are now logged in the Audit Trail.

### QLM Customer Site New Features

* New Server Property: customerSite / preventRegistrationFromExistingIPAddress. This feature checks if the IP address of the user requesting a trial matches an IP address in the system and aborts the trial request if a match is found.
* New server properties allow hiding some fields on the trial registration form: registrationPage\_showFullName, registrationPage\_showCompany, registrationPage\_showPhone, registrationPage\_showCountry

### QLM Professional New Features

* When activating a license by email address (activation using Basic Authentication), QLM can now pick the Activation Key based on the Allowed/Denied Computer IDs.
* The following editors in the QLM Management Console now support saving multiple layouts (in the status bar): Activation Attempts, Illegal Computers, Event Viewer, and Audit Trail

### Upgrade Procedure

To upgrade to QLM v19, you must first install the QLM Management Console on your client system by running qlmsetup19.exe. To determine if you are eligible for a v19 upgrade, you may contact us or click the About tab.

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, you can simply re-run the latest QlmLicenseServerSetup.exe to upgrade your installation. You should always back up your database and site before upgrading. To back up your site, simply make a copy of your Qlm License Server folders. To back up your database, perform a SQL Server back up of the database.

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
   * Modify the DLL field and replace the existing value with QlmWebService.dll
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

To upgrade your source code to QLM v19:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise [sample ](https://docs.soraco.co/docs/step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app)and follow the same approach as the new sample.
