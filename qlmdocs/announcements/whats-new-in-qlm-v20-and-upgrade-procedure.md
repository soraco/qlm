# What's new in QLM v20 and upgrade procedure

QLM v20 is planned for release on April 12, 2026.  **The documentation below is in progress.**

-> [Latest Version Release Notes](https://soraco.co/products/qlm/ReleaseNotes.html)

### Important Changes in v20 <a href="#h_01h95qq4d75t05j62drs5q0gz6" id="h_01h95qq4d75t05j62drs5q0gz6"></a>

* License Server;
  * The QLM License server, and all related server components, have been upgraded from .NET Framework 4.6 to .NET Core 10. This is a major change that impacts the URLs to communicate with the License Server. If you are hosting your License Server, please check the upgrade instructions below.
  * The QLM Portal has been completely re-written using Blazor and .NET 10.
  * If you use PayPal integration, you must update the IPN URL (details below)
  * All ecommerce integrations should use the new License Server URL.
  * If you are hosting your own License Server, before upgrading to this version, you MUST ensure that the QLM database login user has the db\_securityadmin role. You can use the following command to add it (change qlm\_user as needed): EXEC sp\_addrolemember N'db\_securityadmin', N'qlm\_user'
  * Instructions to redirect the old URL to the new URL is provided below.
  * The procedure to integrate with Azure has changed. Please check the latest documentation.
  * QLM Authentication now uses the new Microsoft Identity framework instead of ASP.NET Membership
* Client Side
  * Most client side QLM components now use .NET 10.
  * The QLM License Wizard XML settings file must be updated to reflect the new URL.

### .NET Support

* The QlmLicenseLib.dll is now available for .NET4, .NET6, NET7, .NET8, .NET9 and .NET 10.
* The QlmControls.dll is now available for .NET4, .NET6-Windows, .NET7-Windows, .NET8-Windows, .NET9-Windows, and .NET10-Windows.

### New Requirements

* The QLM Management Console now requires .NET 10 (requires Windows 10 or higher).
* The QLM Management Console and the QLM Portal now reference DevExpress 25.2.5.
* New License Server requirements:
  * You must install the [.NET 10 Hosting Bundle ](https://dotnet.microsoft.com/en-us/download/dotnet/10.0)10.0.5 or greater
  * You must install [Microsoft OLE DB Driver for SQL Server v19](https://learn.microsoft.com/en-us/sql/connect/oledb/download-oledb-driver-for-sql-server?view=sql-server-ver17)
  * You must install [Visual C++ Redistributables for x86 and x64 (for Visual Studio 2017)](https://learn.microsoft.com/en-us/cpp/windows/latest-supported-vc-redist?view=msvc-170)

### Documentation

The QLM Documentation has moved to: [https://docs.soraco.co](https://docs.soraco.co)

### Upgrade Procedure

To upgrade to QLM v20, you must first install the QLM Management Console on your client system by running qlmsetup20.exe. To determine if you are eligible for a v20 upgrade, you may contact us or click the About tab.

If we are hosting your QLM License Server, contact us to upgrade the License Server. If you are hosting your own License Server, you can upgrade the License Server as described in the next sections.

#### License Server Changes

The QLM v20 License Server can be installed side-by-side with the QLM v19 or earlier License Server.

#### Automated Upgrade

If you installed QLM by running the QlmLicenseServerSetup.exe, when you run the latest QlmLicenseServerSetup.exe, the new QLM v20 License Server will be installed side-by-side  with the previous version. The new URLs after the installation of the QLM v20 License Server are (replace localhost with the name of your server/domain)

* QLM License Server: http://localhost/Qlm/QlmLicenseServerNetCore/api/v1/QlmApi
* QLM Self Help: http://localhost/Qlm/QlmCustomerSiteNetCore
* QLM Portal: http://localhost/Qlm/QlmPortalNetCore/QlmPortal
* QLM Customer Portal: http://localhost/QlmCustomerPortalNetCore/qlm-portal-app

You should always back up your database and site before upgrading. To back up your site, simply make a copy of your QLM License Server folders. To back up your database, perform a SQL Server back up of the database.

After the server is installed, you must perform a DB Schema upgrade:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Click Upgrade DB Schema

#### Manual Upgrade

**QLM License Server Upgrade**

1. Launch the QLM Management Console
2. Go to the Manage Keys tab, click Sites, select your site, then click Copy and set the name of the v20 License Server
3. In the Primary Site field, set the URL to (replace localhost with the name of your server/domain): http://localhost/Qlm/QlmLicenseServerNetCore/api/v1/QlmApi
4. Go to the Deployment tab and set the information associated with your License Server (see screenshot below)
5. Click "Update Config Files"
6. Copy all the files located in %Public%\Public Documents\Quick License Manager\DeployToServer\ to your server, under the c:\inetpub\wwwroot\Qlm
7. On your server, in IIS, create the following Application Pools
   1. QlmLicenseServerNetCore
   2. QlmCustomerSiteNetCore
   3. QlmPortalNetCore
   4. QlmCustomerPortalNetCore
8. In IIS, expand the Default Web Site node and locate the QLM virtual directory
9. Right mouse click QlmLicenseServerNetCore and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmLicenseServerNetCore
10. Right mouse click QlmCustomerSiteNetCore and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmCustomerSiteNetCore
11. Right mouse click QlmPortalNetCore and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmPortalNetCore
12. Right mouse click QlmCustomerPortalNetCore and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmCustomerPortalNetCore
13. Right mouse click QlmCustomerPortalNetCore /qlm-portal-api and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmCustomerPortalNetCore
14. Right mouse click QlmCustomerPortalNetCore /qlm-portal-app and select Convert to Application. When prompted to Add the Application, set the Application Pool to QlmCustomerPortalNetCore
15. Once the License Server is updated, start the QLM Management Console, go to Sites and click on Upgrade Database Schema.

<figure><img src="../.gitbook/assets/image (66).png" alt=""><figcaption></figcaption></figure>

#### Redirection from old URL to new URL

If you are upgrading from QLM v19 or earlier to QLM v20, you can configure the old license server to redirect to the v20 License Server by adding some entries QlmLicenseServer\web.config.

In order to perform the redirect, you must first install the URL Rewrite module which is available [here](https://www.iis.net/downloads/microsoft/url-rewrite).

You must then update the QlmLicenseServer\web.config (note that the syste.webserver section exists already so you should just add the relevant URL Rewrite section)

```xml
<system.webServer>
	<!-- Rewrite Rules to redirect to .net core -->
	<rewrite>
		<rules>
			<rule name="Rewrite ASMX to Core API" stopProcessing="true">
				<match url="^qlmservice\.asmx(.*)$" ignoreCase="true" />
				<action type="Rewrite" url="/Qlm/QlmLicenseServerNetCore/api/WebService{R:1}" appendQueryString="true" />
			</rule>
		</rules>
	</rewrite>
</system.webServer>
```

**Important**: when redirecting from an old License server to a v20 license server, the old license server and the v20 license server must use the same Application Pool.

<figure><img src="../.gitbook/assets/image (67).png" alt=""><figcaption></figcaption></figure>

#### PayPal Integration

The URL to the QLM PayPal integration has changed from:&#x20;

[http://localhost/Qlm/QlmLicenseServer/qlmpaypalipn.aspx<br>](http://localhost/Qlm/QlmLicenseServer/qlmpaypalipn.aspx)

To:&#x20;

[http://localhost/Qlm/QlmLicenseServerNetCore/api/PayPalIpn/notify](http://localhost/Qlm/QlmLicenseServerNetCore/api/v1/PayPalIpn/notify)

#### Source Code

To upgrade your source code to QLM v20:

* If you are upgrading from QLMv9 or earlier and if you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings XML file. Note that as of QLM v9, only one settings file is required. The UI Settings XML file is no longer required since all settings are stored in a single file.
* If you have implemented floating licenses, it is recommended that you review the new QLM Enterprise [sample ](https://docs.soraco.co/docs/step-by-step-guides/how-to-support-floating-and-node-locked-licences-in-the-same-app)and follow the same approach as the new sample.
