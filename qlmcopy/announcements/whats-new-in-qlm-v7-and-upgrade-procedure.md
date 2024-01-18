# What's new in QLM v7 and Upgrade Procedure

### What's new in QLM v7

* Disaster Recovery support of the QLM web service integrated with our backup/restore feature.
* Faster backup and restore with reporting on synchronization status of the two sites
* Integration with Windows Azure.
* First version of our Analytics feature for QLM Enterprise. Monitor who installs your software, when they uninstall it, what version they are running, what OS, etc.
* User Interface improvements
* Most web service properties that were managed in the web.config file can now be configured from the QLM Management Console
* Several new API functions
* Support for ecommerce provider: Cleverbridge
* Several improvments to the QLM License Wizard:  localization ready, buy now button, etc.
* Dashboard tiles are now clickable and load the corresponding data.
* Send emails via SMTP instead of just Outlook
* Most server properties that were managed in the web.config file can now be configured from the QLM Management Console (Sites / Server Properties.
* Two now APIs: SetUserData and SetUserData and SetUserDataInActivationLog
* The QLM License Wizard is now localisable. The first localisation available is in French.
* Ecommerce provider Cleverbridge is now supported
* Usability enhancements in the QLM License Wizard
* Added Buy Now button to the QLM License Wizard.
* Added ProductData field to allow associating any data to a given product
* Added support for limiting the number of trial activation keys per client
* Added support for overriding the location in the registry where license keys are stored
* Added Http method to revoke a license: RevokeLicenseHttp
* Look & feel: New icons in QLM GUI,&#x20;
* Dashboard buttons are now clickable and load the corresponding data (except for Customers button)
* The loggingLevel of the QLM web service can now be configured from the QLM Application
* SMTP emails are no longer automatically carbon copied to the sender
* Templates now include the email subject line
* For mobile devices, the UserData field is now returned in the signed xml fragment
* Removed dependency on Outlook being installed when using SMTP emails.

&#x20;**Upgrade Procedure:**

To uprade to QLM v7, you must first install the QLM Application on your client system by running the qlmsetup7.exe.

Then, you need to ugprade your QLM web service to v7. **Note that** without upgrading the QLM web service, the QLM application will not work.

To upgrade the QLM web service, we recommend that you create a new virtual directory and install a QLM web service in parallel to your existing QLM 5.x or QLM 6.x web service. Both web services can be configured to point to the same database. Once the QLM v7 web service is configured and properly running, you can remove the QLM 5é6 web service.&#x20;

1. Update the DLLs on your web server with the DLLs located in DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql.&#x20;
3. Update the web.config file on your web server with the one located in  DeployToServer\QlmWebService. Note that the web.config file in QLM v6 has changed significantly so you need to **completely** replace the existing web.config file and then update the following settings:
   1. connectionStrings&#x20;
   2. communicationEncryptionKey
   3. adminEncryptionKey
   4. sqlSyntax
4. Configure the Application Pool associated to the QLM web service to use .NET 4.0.
5. Once the web service is updated, start the QLM application, go to Sites and click on Upgrade Database Schema.
6. If you are using our eCommerce integration, do the following:
   * Go to the Manage Keys tab
   * Click on the Commerce Providers item in the toolbar
   * Select every single eCommerce provider
   * Modify the Dll field and replace the existing value with: QlmWebService.dll&#x20;
