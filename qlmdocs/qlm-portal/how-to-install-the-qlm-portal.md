# How to install the QLM Portal

The QLM portal can be installed via the setup (QlmLicenseServerSetup.exe) or manually.

If you can run a setup program on your web server, run the QlmLicenseServerSetup.exe on your server and make sure that the QLM Portal feature is selected.

The QlmLicenseServerSetup.exe is located in: %Public%\Public Documents\Quick License Manager\DeployToServer

If you cannot run a setup program on your web server, following are the manual steps to install the QLM Portal:

* Create a virtual directory on your web server called: QlmPortal
* Ensure that the QlmPortal virtual directory is not created within the QlmLicenseServer folder. It should be at the same level of the QlmLicense Server.
* Upload all the files in the DeployToServer\QlmPortal folder to the QlmPortal virtual directory
* Enable ASP.NET 4.0 for the virtual directory.
* Customize the following appSettings in the web.config file as follows:
  * communicationEncryptionKey
  * adminEncryptionKey
  * sqlSyntax
  * webServiceUrl
* Additionally, you should customize the connectionStrings settings in the web.config file to the same values as the web.config of the QLM web service.

The QLM portal uses ASP.NET forms authentication to validate users. To enable ASP.NET forms authentication, the QLM database needs to be updated to maintain authentication information. If you have recently purchased or are evaluating QLM, this step is already performed during the normal setup. If you are ugprading from QLM v6 or earlier, you must run the sql2005.aspnet.sql script located in the following folder:

> C:\Program Files\Soraco\QuickLicenseMgr\DeployToServer\QlmLicenseServer\Db
