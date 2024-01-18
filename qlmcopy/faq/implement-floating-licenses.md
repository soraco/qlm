# Implement Floating Licenses

Quick License Manager Enterprise offers all the features of QLM Professional and in addition, enables you to implement floating licenses.

QLM Enterprise requires a database at the customer site to manage floating licenses. QLM supports 3 different file formats for the floating license database in varying levels of complexity: XML, MS-Access and SQL Server.&#x20;

For XML and MS-Access, all that is required on the end-user site is a Windows Network Share that is accessible to all computers on the network. The network share must have read/write privileges. On this share, a QLM database or XML file must be copied and activated.

Below are the steps required to add floating license support to your application:

* Upon purchase, issue an Activation Key to your customer. When creating the activation key, set the FloatingSeats property to the number of seats purchased. If you are issuing the activation key from your eCommerce provider via a URL, set the is\_floating argument to true. If you are creating the activation key via the QLM Console, set the Floating Seats field to the number of purchased seats.
* Your customer installs your product.
* As part of your product's installation, you should install the QLM Floating License Database on a network share accessible to all users, or on a SQL Server.
* Your customer enters the Activation Key in your product and clicks on Activate.
* Your application connects to the QLM License Server that you are hosting (over the internet) and issues a computer bound key to the customer. The procedure so far is the same as for non-floating licenses.
* To initialize floating licenses support, you create an instance of the QlmFloatingLicenseMgr object (for XML) or the QlmFloatingLicenseMgrDb (for MS-Access or SQL Server) object (located in QlmLicense.dll).
* If you are using .NET, call one of the available constructors (except the default constructor).
* If you are using any other language, you need to create an instance of the QlmFloatingLicenseMgr or QlmFloatingLicenseMgrDb class, then set either the QlmLicenseObject or the SettingsFile properties. Check the API reference for more details.
* To initialize the location and password of the QLM Floating XML file or database, call QlmFloatingLicenseMgr.InitializeDb
* To activate the QLM Floating database/XML, you then call QlmFloatingLicenseMgr.RegisterLicense. This registers the license in the floating database with information about the number of available seats. You can use the QLMLicenseWizard.exe to register the license and database with the /floating\_master and /floating\_node command line arguments.
* When your application starts up, you call the ActivateFloatingLicense method to register the node.
* When your application exits, you call the ReleaseFloatingLicense method to release the node.

A License Viewer application is available and can be distributed with your application (QlmLicenseViewer.exe). The License Viewer enables your customer to view allocated licenses and release them if needed.

A sample showing how to implement floating licenses is provided in the following folder:

%Public%\Documents\Quick License Manager\Samples\QLMEnterprise\DotNet\C#\QlmFloatingLicenseSample

A step-by-step guide to implementing floating licenses in your application is available [here](https://support.soraco.co/hc/en-us/articles/213333283-How-to-implement-floating-licensing-with-QLM-Enterprise).
