# How to implement floating licensing with QLM Enterprise

With QLM Enterprise, you can implement on-premise floating licenses _on Windows only_ using one of several methods. The basic principle behind the 3 methods presented below is a central database located on the customer network that each client connects to in order to check out a license and then check it back in.

1. For small installation of less than 30 concurrent nodes, the central database is implemented as an XML file located on a network share at your customer's site. This solution does not require any special deployment.
2. For medium-size installations of 30-100 concurrent nodes, the central database is implemented as an MS-Access database located on a network share at your customer's site. This solution may require the installation of MS-Access drivers on each client node.
3. For larger installations of 100+ concurrent nodes, the central database is implemented as an MS SQL Server database located on the customer's network. This solution requires an MS SQL Server at the customer site. All editions of MS-SQL Server are supported including the free SQL Server Express edition.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360090645851/mceclip0.png)

This article walks you through the steps required to add floating licensing to your application using a SQL Server database. The article is based on the following sample which supports an Xml, an MS-Access or a SQL Server database: C:\Users\Public\Documents\Quick License Manager\Samples\qlmenterprise\DotNet\C#\QlmFloatingLicenseSample (formerly called QlmEnterpriseSample)

### Creation of the database

To create the floating license SQL Server database, simply execute the sql.floatingdb.createdb.sql script located in the C:\Program Files\Soraco\QuickLicenseMgr\redistrib\FloatingLicenses folder. In the script, you may want to update the path of the database to a location of your choice. A SQL Server login user called "qlmfloating\_user" is automatically created by the sql script above. The password of the "qlmfloating\_user" user can be configured in the **Protect Your Application** wizard (3rd tab in the QLM Management Console) by setting the QlmFloatingDbPassword property. You should also set the QlmFloatingLicenseDbFormat property to the desired value.&#x20;

### Database Registration

The first step in implementing floating licensing is to initialize the QLM Floating database. The simplest way to initialize the database is by using the QLM License Wizard. By launching the QlmLicenseWizard.exe with the /floating\_master argument, a new page is added to the wizard that allows the user to specify the location of the database. For XML and MS-Access, the user is required to specify a UNC path to the QLM Floating database. For MS SQL Server, the user must specify the SQL Server as well as the name of the database in the following format: Data Source=SERVER;Initial Catalog=QLMFLOATINGDB. Example: Data Source=SQL-SERVER;Initial Catalog=qlmFloating.&#x20;

To configure the QLM License Wizard to register the DB:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Select your Product and your License Server then click Next
* Select your programming language then click Next
* On the "Customize the Look & Feel and behaviour of the QLM License Wizard", scroll down to the QLM License Properties - Floating Licenses
* Set the QlmFloatingDbPassword property
* Set the QlmFloatingLicenseDbFormat to the value of your choice
* Set the QlmShowFloatingLicensePage to true

### Node Registration

When your application is launched, call IQlmFloatingLicenseMgr.ReadFloatingLicenseLocation to determine if the QLM Floating License Database was already registered on this system. If the location is empty, prompt the user to specify the location of the database. Once again, you can use the QLM License Wizard to prompt the user to enter the location of the database by using the /floating\_node argument.&#x20;

Once the location of the database is set, you should perform the following:

* Call ValidateLicenseLocation to ensure the location of the database is correct. This is to prevent users from duplicating the floating license database. Note that this call requires internet access as it validates the location with the license server.
* Call ActivateFloatingLicense to register the current node

When your application exits, call ReleaseFloatingLicense to unregister this node.

Note that if a registered node is manually removed from the database, the node will be automatically re-registered within 30 seconds. The EnableAutomaticRegistration property controls this behavior. In the event all licenses have been consumed, a QlmFloatingLicenseViolationEvent will be fired. You can take the appropriate action when this event is fired, such as exiting the application.

### Working Offline

Users can check-out a license to work offline. To check-out a license for offline usage, you call the SetOfflineMode method. You can configure the maximum period of time a license can be used offline by setting the FloatingLicenseMaxOfflineDuration property. This property can be set in code or can be set in the Protect Your Application wizard and is stored in the settings XML file generated by that wizard.&#x20;

### Floating License Viewer

The QLMFloatingLicenseViewer.exe is a standalone application that you can redistribute with your product to enable your customers to view their running nodes with the ability to release nodes that may have crashed.

The licence wizard can release licenses of all nodes except offline nodes that have not expired. For example, if you have set the FloatingLicenseMaxOfflineDuration to 12 hours, a node that is working offline can only be released by the Floating License Viewer 12 hours after it has gone offline.

### Deployment

To determine which binaries need to be deployed with your application, check this [article](https://support.soraco.co/hc/en-us/articles/203130204-Which-QLM-DLLs-do-I-need-to-distribute-with-my-application).

Additionally, you need to deploy the xml settings file which was generated by the Protect Your Application wizard (3rd tab in the QLM Management Console).

You will also need to deploy the floating license database. Depending on the file format that you have selected, you will need to deploy one of the following:

* XML: Floating License XML File
* MS-Access: Floating License MS-Access DB
* SQL Server: You need to execute the SQL script sql.floatingdb.createdb.sql located in C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\FloatingLicenses
