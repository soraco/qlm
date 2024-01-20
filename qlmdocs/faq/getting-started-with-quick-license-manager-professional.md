# Getting Started with Quick License Manager Professional

QLM Professional is composed of 2 components: (a) a license server that provides a framework for issuing and managing license keys and (b) a client application that communicates with the license server and acts as a user interface to the license server.&#x20;

QLM Professional allows you to implement online software activation. Software activation is the process of generating a computer-bound license key over the internet. In order to implement software activation, you work with 2 types of license keys. The first key is called the "Activation Key". This is the key that you send to your customer when they purchase your software. The activation key can be sent to your customer directly from your eCommerce provider (see other section on how to integrate QLM with your eCommerce provider) or manually. This key does not enable your software. It simply allows the user to activate his license. If a user purchases several copies of your software, you can send them one activation key for all purchased licenses or one activation key per license.

From your application, the user enters the activation key. Your application calls the QLM API which sends the activation key along with a computer-unique identifier to the QLM License Server. The QLM License Server then generates the second type of license key called "Computer Key" and sends this key back to your application. The Computer Key enables your application.

## Define products

The first step in creating license keys for your products is to define each product. Click on the **Define Products** tab and then click on **New.** Enter the Product Name, the Major and Minor version of the product. The Product ID and the GUID fields are automatically generated. You will need these values when you use the API to validate license keys. You may also associate up to 32 features with each of your products.

Notes:

* As of QLM version 5, the encryption key is no longer required and has been superseded by the public/private key pair found on the Encryption Keys tab.
* If you are evaluating QLM and are using the Demo License Server hosted on our website, you should use the built-in Demo product as you cannot publish your own product to the Demo License Server that's being used by other users who are evaluating QLM.

## Generate license keys

Once you have defined your products, you can generate license keys for each product. There are 2 types of license keys: permanent, and evaluation/subscription keys. Evaluation/Subscription keys can specify the duration of the license, expiry date, or both.

Prior to creating license keys with QLM Professional, you need to set up the QLM License Server and a database that will host the license keys. For instructions on installing the QLM License Server and the database, refer to the Help. For evaluation purposes, Soraco provides you with a Demo License Server and a database. The only restriction of our Demo License Server is that you cannot publish your products to the License Server; you can only work with the default product **Demo**. Additionally, note that the database content on the Demo License Server is regularly reset.

To generate license keys with QLM Professional, click on the **Manage Keys** tab, then click on the Create button. Select a Product, the number of keys to generate, the type of keys to generate, and then click on the **OK** button.  QLM stores the generated keys in a database.

## Modify your application

The simplest way to integrate QLM Pro into your application is to use the QLM .NET Wizard Control or the QLM License Wizard standalone application.

The QLM .NET License Wizard User Control provides a ready-to-go license activation form. If your application is developed in .NET WinForm or WPF, check out this [tutorial](../step-by-step-guides/protect-a-winforms-app-with-the-qlm-license-wizard.md) for a step by step instructions on how to integrate using the QLM .NET Control.

If your application is not a .NET Windows application, you can use the QLM License Wizard standalone application to manage the license activation process. For a tutorial on how to use the QLM License Wizard, [click here](https://youtu.be/XLbqLO2CSlk).

Of course, you can always create your own license registration form and use our extensive API to manage license validation and activation.

Below are step-by-step instructions to integrate QLM Pro into your application:

1\. From the **Protect your application** tab, follow the instructions in the wizard. QLM will generate the code that you need to add to your application.

2\. For .NET applications:

&#x20;     a) add to your application a reference to: QlmLicenseLib.dll

&#x20;     a) add to your application a reference to: QlmControls.dll (if you want to use the QLM .NET User controls)

3\. In your application, as soon as your application is started, call the ValidateLicenseAtStartup function (found in the generated code above).

4\. If the ValidateLicenseAtStartup function returns false, it means there is no valid license and you must prompt the user for a license.

5\. If you are using the QLM .NET Control, display a form containing the QLM .NET Control to allow the user to register his license.

6\. If you are not using the QLM .NET Control, launch the QLM License Wizard application (with the proper command line arguments).

6\. Upon successful activation of the license, close the license form and display your application.

For more details about specific APIs, refer to the API reference found in the online help.

Several sample applications are included in the Samples folder developed in VB6, VC++, VB.NET, C#, Excel, and more.

## Samples

All QLM Pro samples are located in the folder:

&#x20;   C:\Users\Public\Documents\Quick License Manager\Samples\qlmpro

Samples are grouped in programming languages.

.NET Samples:

* Windows\DotNet\C#\QlmWizardSample- This sample shows how to add online activation to your C# Windows Forms application by using the QLM License Wizard .NET Control.
* Windows\DotNet\C#\QlmControlSample - This sample shows how to add online activation to your C# Windows Forms application by using the QLM .NET Activation Control.
* Windows\DotNet\C#\QlmControlWpfSample- This sample shows how to add online activation to your C# Windows WPF application by using the QLM WFP Activation Control.
* Windows\DotNet\C#\QlmProSample - This sample shows how to add online activation to your C# Windows Forms application by using the QLM API.
* Windows\DotNet\C#\QlmAspDotNetSample - This sample shows how to add online activation to your C# ASP.NET application by using the QLM API.
* Windows\DotNet\C#\QlmApiSample - This sample shows how to implement online activation using plain http requests in your C# application.
* Windows\DotNet\VB.NET\QlmControlSample - This sample shows how to implement online activation in your WinForms VB.NET application using the QLM .NET Activation Control.
* Windows\DotNet\VB.NET\QlmLicenseWizardExeSample- This sample shows how to implement online activation in your WinForms VB.NET application using the QLM License Wizard standalone executable.
* Windows\DotNet\VB.NET\QlmProSample- This sample shows how to add online activation to your VB.NET Windows Forms application by using the QLM API.
* Windows\DotNet\VB.NET\QlmApiSample - This sample shows how to implement online activation using plain HTTP requests in your VB.NET application.

C++ Samples

* Windows\C++\QlmLicenseWizard: Visual Studios sample shows how to add online activation to your C++ application.

MS Access Sample

* Windows\MSAccess: MS Access sample shows how to add online activation to your MS Access 2003 application.

Excel Sample

* Windows\Excel: Excel sample shows how to add online activation to your Excel application.

VB6 Sample

* Windows\VB6: VB6 sample shows how to add online activation to your VB6 application.

Delphi Sample

* Windows\Delphi: Delphi sample shows how to add online activation to your Delphi application.

Outlook Sample

* Windows\OutlookAddIn: Outlook sample shows how to add online activation to your Outlook add-in.

Powerpoint Sample

* Windows\PowerpointAddIn: Powerpoint sample shows how to add online activation to your Powerpoint add-in.

Qt C++ Sample

* Windows\Qt : Qt C++sample shows how to add online activation to your Qt application for Windows only.

Unity3D Sample

* Windows\QlmUnity3dSample: Outlook sample shows how to add online activation to your Outlook add-in.
