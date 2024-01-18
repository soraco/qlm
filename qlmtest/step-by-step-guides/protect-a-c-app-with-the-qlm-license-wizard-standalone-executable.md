# Protect a C# app with the QLM License Wizard standalone executable

Following is a step by step procedure to protect a C# application by using the QLM License Wizard Standalone application. Note that the steps below assume you have a QLM License Server already setup.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application" tab:

* Page 1: Select the product to protect and the License Server
* Page 2: Select C#
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4a: Select the folder where your source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.csproj. If this step fails, just skip it.
* Page 5: Click Finish

The "Protect your application" should have generated a class file called LicenseValidator.cs and an XML file that contains your customizations. In this guide, we will assume the XML file is called "Demo 1.0.lw.xml" which should be the case if you are evaluating QLM.

* Open your Visual Studio project
* If the Visual Studio integration above succeeded, confirm that the following was added to your project:
  * A reference to QlmLicenseLib.dll
  * A new file called LicenseValidator.cs
  * A new file called Demo 1.0.lw.xml
* If the Visual Studio integration did not work, do the following:
  * Add a reference to C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.dll
  * Add the file LicenseValidator.cs to your project
  * Add the file Demo 1.0.lw.xml to your project and set the property "Copy to Output Directory" to "Copy if newer"
* You will now need to update your application to add the license validation code.
* Add the following statement your main module: using QlmLicenseLib
* Define the following global variables:

> &#x20;   static QLM.LicenseValidator lv;\
> &#x20;   static string settingsFile;\
> &#x20;   static string wizardExec;

* Copy and paste the code below into your application     &#x20;

> static void ValidateLicense ()\
> {\
> &#x20;   System.Reflection.Assembly thisAssembly =                System.Reflection.Assembly.GetExecutingAssembly();\
> &#x20;   string location = System.IO.Path.GetDirectoryName(thisAssembly.Location);
>
> &#x20;   settingsFile = System.IO.Path.Combine(location, "Demo 1.0.lw.xml");\
> &#x20;   wizardExec = System.IO.Path.Combine(location, "QlmLicenseWizard.exe");
>
> &#x20;   lv = new QLM.LicenseValidator(settingsFile);
>
> &#x20;   bool needsActivation = false;\
> &#x20;   string errorMsg = string.Empty;
>
> &#x20;   ELicenseBinding licenseBinding = ELicenseBinding.ComputerName;
>
> &#x20;   if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)\
> &#x20;   {\
> &#x20;       int exitCode = DisplayLicenseForm();
>
> &#x20;       if (exitCode == 4)\
> &#x20;       {\
> &#x20;           Environment.Exit(0);\
> &#x20;       }
>
> &#x20;       if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)\
> &#x20;       {\
> &#x20;           Environment.Exit(0);\
> &#x20;       }\
> &#x20;   }\
> }
>
> static private int DisplayLicenseForm()\
> {\
> &#x20;   string errorMessage;\
> &#x20;   if (lv.QlmLicenseObject.ValidateSettingsFile(settingsFile, out errorMessage) == false)\
> &#x20;   {\
> &#x20;       Console.WriteLine(errorMessage);\
> &#x20;       return 0;\
> &#x20;   }
>
> &#x20;   string args = String.Format("/settings \\"{0}\\"", settingsFile);
>
> &#x20;   if (!System.IO.File.Exists (wizardExec))\
> &#x20;   {\
> &#x20;       wizardExec = @"C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe";\
> &#x20;   }
>
> &#x20;   return lv.QlmLicenseObject.LaunchProcess(wizardExec, args, true, true);\
> }

Now in your application's startup code, call ValidateLicense().

This completes the integration.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
