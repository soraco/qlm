# QLM Demo License Server

For evaluation purposes, we host on our server a **Demo License Server** accessible to all our new potential customers. This License Server is configured to work with the built-in Demo product.

All samples are preconfigured to connect and work with the **Demo License Server**.

The only impact when using the Demo License Server is that you need to pretend your product is called “Demo 1.0” (or one of the built-in products). Once you purchase QLM and you set up your own License Server, the changes required to switch to the new License server are limited to configuration changes.

**Note that license keys created on the Demo License Server are regularly deleted.**&#x20;

If you create a new product in the evaluation version of Quick License Manager, you will not be able to use our Demo License Server because the License Server will not contain a definition of your new product.&#x20;

If you need to test with your product, you must install the QLM License Server on your system.

The setup program to install the QLM License Server can be found here: %Public%\Public Documents\Quick License Manager\DeployToServer\QlmLicenseServerSetup.exe

[Read instructions ](../qlm-license-server/how-to-install-the-qlm-license-server.md)for installing the License Server.

**Connection information to the Demo License Server:**

License Server URL: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)

Database Engine: SQL Server

Communication Encryption Key: {B6163D99-F46A-4580-BB42-BF276A507A14}

Administration Encryption Key: {B6163D99-F46A-4580-BB42-BF276A507A14}

**Configuring the QLM Management Console**

To configure the QLM Management Console to connect to the Demo License server:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select the Demo site
* Set the URL to: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* Go to the Encryption Keys tab.
* Set the Communication Encryption Key to: {B6163D99-F46A-4580-BB42-BF276A507A14}
* Set Administration Encryption Key to: {B6163D99-F46A-4580-BB42-BF276A507A14}
* Click Ok
