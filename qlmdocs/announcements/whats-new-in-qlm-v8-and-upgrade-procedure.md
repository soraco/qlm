# What's new in QLM v8 and Upgrade Procedure

## What's new in QLM v8

* New web based customer registration form that generates a trial key and emails it to the customer. This is meant to be integrated with your web site when users download a trial of your app.
* New web based method that generates a trial key and emails it to the customer.&#x20;
* Protection of PDF files (QLM Enterprise)
* Protection of Executables without any code change (QLM Enterprise)
* Paypal Subscription Integration
* QLM Portal - many enhancements
* Improved integration with different Outlook versions
* Support for new SHA-256 Paypal requirements&#x20;

&#x20;**Upgrade Procedure:**

To uprade to QLM v8, you must first install the QLM Management Console on your client system by running the qlmsetup8.exe.

Then, you need to ugprade your QLM License Server to v8. Note that without upgrading the QLM License Server, the QLM application will not work. If we are hosting your QLM License Server, contact us to upgrade the License Server.

To upgrade the QLM License Server, we recommend that you create a new virtual directory and install a QLM License Server in parallel to your existing QLM 5.x or QLM 6.x or QLM 7.x License Server. Both License Servers can be configured to point to the same database. Once the QLM v8 License Server is configured and properly running, you can remove the QLM 5, 6 or 7  License Servers.&#x20;

1. Update the DLLs on your web server with the DLLs located in DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql.&#x20;
3. Update the web.config file on your web server with the one located in  DeployToServer\QlmWebService. Note that the web.config file in QLM v8 has changed significantly so you need to **completely** replace the existing web.config file and then update the following settings:
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
