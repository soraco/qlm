# What's new in QLM v9 and Upgrade Procedure

## **What's new in QLM v9**

**.NET Controls and Wizard**

* New .NET WinForms control QlmActivationControl supersedes QlmWebBasicActivationControl.
* New QlmLicenseWizard.exe. The new wizard uses a more modern look & feel and is much smaller in file size. If you are using the QLM License Wizard, you will need to regenerate the settings XML file and re-customize the look and feel of the wizard. **Your existing settings xml files are not compatible with the new wizard.**&#x20;
* New QlmWizardControl supersedes QlmLicenseWizardCtl. The new wizard uses a more modern look & feel and is much smaller in file size. If you are using the QLM License Wizard .NET control, you will need to regenerate the settings XML file and recustomize the look and feel of the wizard. **Your existing settings xml files are not compatible with the new wizard.**
* New WPF based QlmActivationControl. If your application is developed with .NET WPF, you can now use this control instead of hosting a WinForms control in WPF.
* Localization into new languages

**QLM Pro**

* Features are now displayed in the QLM Management Console grid. You can now upgrade features from the QLM Management Console without issuing a new Activation Key. You can now use the macro %EnabledFeatures% in email messages.
* Features are now displayed in the QLM Management Console grid. You can now upgrade features without issuing a new Activation Key.
* Added the ability to define your own server properties (currently used by Paypal service).

**QLM Enterprise**

* Major enhancements to QLM Enterprise floating license support. You no longer need to deploy the QLM License Server to implement floating licensing. It is recommended that you review the new QLM Enterprise sample and follow the same approach as the new sample.
* Analytics can now report the following additional information: Last Accessed Date, Idle Days, Days Installed.
* The QLM License Wizard now includes a page to capture the location of the floating license database.

&#x20;**QLM Portal**

* Send email directly from the QLM Portal. Any template that you define in the QLM Management Console is now automatically uploaded to the server and is available through the QLM Portal.
* End users can now change their password directly from the portal.
* New User Group settings: CanSetFloatingSeats, Max Permanent Keys, Max Trial Keys, Min Trial Duration, Max trial duration, Max activations in a key, Max keys per customer and much more.

**3rd party Extensions**

* Improved paypal integration - Paypal can now use email templates defined in the QLM Management Console.
* New Zapier App retrieves recent orders and can integrate with other Zapier apps such as CRM systems to push new order information to other 3rd party systems.
* New ecommerce provider: Shopify
* WooCommerce Subscription support
* QLM can now protect Xojo Windows applications.

**License Server**

* New Server Properties:  updateExistingUserInformation, revokeLicenseOnRefund, maxActivationsEnforcedOnVMsOnly, maxActivationsPerSystem.
* New fields in the database: ComputerType (VM or PC), License Model (permanent/subscription/trial).
* New QLM Self Help Portal that allows your customers to manage their keys.
* Email templates created in the QLM Management console can now be used in QlmRegistration.asmx and QlmRegistrationForm.asmx.

**Management Console**

* Scheduled Tasks can now be configured to start on a specific day.

&#x20;**Core Features**

* Up until the 9.1 release, the QLM licensing engine was developed as a C++ DLL (IsLicenseX0.dll) that QlmLicenseLib.dll invoked behind the scene. As of v9.2, the QLM licensing engine is now a pure .NET implementation with no dependency on a C++ DLL. If you are using QLM Engine version 5.0.00, the .NET licensing engine is fully compatible with the C++ licensing engine. If you are using QLM Engine 4.0.00 or lower, you will need to continue using the C++ licensing engine. The QlmLicense.LicenseEngineLibrary property allows you to specify whether to use the .NET engine, the C++ engine or both. Note that in a future release, compatibility with QLM Engine version 4.0.00 and earlier will be removed. We strongly advise that you migrate all your customers to QLM Engine version 5.0.00 which has been the default engine version since QLM v5.

&#x20;

**Upgrade Procedure**

To uprade to QLM v9, you must first install the QLM Management Console on your client system by running the qlmsetup9.exe.

Then, you need to ugprade your QLM License Server to v9. If we are hosting your QLM License Server, contact us to upgrade the License Server.

To upgrade the QLM License Server, we recommend that you create a new virtual directory and install a QLM License Server in parallel to your existing QLM 5.x or QLM 6.x, QLM 7.x or QLM 8.x License Server. Both License Servers can be configured to point to the same database. Once the QLM v9 License Server is configured and properly running, you can remove the QLM 5, 6, 7  or 8 License Servers.&#x20;

1. Update the DLLs on your web server with the DLLs located in %Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\bin
2. If you have not executed the sql2005.aspnet.sql script when you created your QLM 5.x DB, this script is now required. The script is located in%Public%\Documents\Quick License Manager\DeployToServer\QlmWebService\Db\sql2005.aspnet.sql.&#x20;
3. Update the web.config file on your web server with the one located in  DeployToServer\QlmWebService. Note that the web.config file in QLM v9 has changed significantly so you need to **completely** replace the existing web.config file and then update the following settings:
   1. connectionStrings&#x20;
   2. communicationEncryptionKey
   3. adminEncryptionKey
   4. sqlSyntax
4. Configure the Application Pool associated to the QLM web service to use .NET 4.0.
5. Once the web service is updated, start the QLM application, go to Sites and click on Upgrade Database Schema.
6. If you are using our eCommerce integration, do the following:

* Go to the Manage Keys tab
* Click on the Commerce Providers item in the toolbar
* Select the eCommerce provider you are using
* Modify the Dll field and replace the existing value with: QlmWebService.dll&#x20;
* Ensure that the eCommerce Provider that you are using is enabled.

To upgrade your source code to QLM v9:

* If you are using the QLM License Wizard, be it the .NET Control or the standalone executable, you will need to customize the look & feel of the control and regenerate the settings xml file. Note that as of QLM v9, only one settings file is required. The UI Settings xml file is no longer required since all settings are stored in a single file.
* You may want to upgrade your LicenseValidator class to the new version. The new version contains additional code to optionally perform server side validation. It also supports a seamless reactivation process for subscriptions. The new LicenseValidator class is currently available for C# VB.NET, VBA and C++.
* If you have implemented floating licences, it is recommended that you review the new QLM Enterprise sample and follow the same approach as the new sample.&#x20;

**IMPORTANT -** QLM Engine Version

If you are upgrading from QLM v4 or earlier and you have issued license keys with QLM Engine version 4.0.00, 3.0.00, 2.4.11 or 2.4.07, we highly recommend that you upgrade your customers license keys to use QLM Engine version 5.0.00. We are planning to drop compatibility with these earlier versions in QLM v10 which is planned for release in 2017.
