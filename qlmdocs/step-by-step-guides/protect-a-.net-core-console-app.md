# Protect a .NET Core Console App

Following is a step-by-step procedure to protect a C# .NET Core console application by using the QLM License Wizard Standalone application.

The steps below assume you have a QLM License Server already setup.

This guide uses the QlmLicenseWizard.exe which is not currently cross-platform (requires .NET 4). For Mac and Linux, you will need to create your own user interface for activation.

### Code Generation

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application" tab:

* Page 1: Select the product to protect and the License Server
* Page 2: Select C#
* Page 3: Leave the default settings or customize the look & feel if needed
* Page 4a: Select the folder where your source code is located and click Save
* Page 4b: Click Next&#x20;
* Page 5: Click Finish

The "Protect your application" should have generated a class file called LicenseValidator.cs and an XML file that contains your customization. In this guide, we will assume the XML file is called "Demo 1.0.lw.xml" which should be the case if you are evaluating QLM.

* Open your Visual Studio project
* Add a reference to C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net core\QlmLicenseLibNetCore.dll
* Add the file LicenseValidator.cs to your project
* Add the file Demo 1.0.lw.xml to your project and set the property "Copy to Output Directory" to "Copy if newer"

### Nuget packages

Add the following NuGet packages to your project:

* System.Cryptography.Xml
* System.Private.ServiceModel
* System.Resources.Extensions

### Update your application

You will now need to update your application to add the license validation code.

* Add the following statement to your main module:
  * using QlmLicenseLib
* Define the following global variables:

> &#x20;   static QLM.LicenseValidator lv;\
> &#x20;   static string settingsFile;\
> &#x20;   static string wizardExec;

* Copy and paste the code below into your application     &#x20;

{% code overflow="wrap" %}
```csharp
static void ValidateLicense ()
{
    System.Reflection.Assembly thisAssembly =                System.Reflection.Assembly.GetExecutingAssembly();
    string location = System.IO.Path.GetDirectoryName(thisAssembly.Location);
    settingsFile = System.IO.Path.Combine(location, "Demo 1.0.lw.xml");
    wizardExec = System.IO.Path.Combine(location, "QlmLicenseWizard.exe");
    lv = new QLM.LicenseValidator(settingsFile);
    bool needsActivation = false;
    string errorMsg = string.Empty;
    ELicenseBinding licenseBinding = ELicenseBinding.ComputerName;
    if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)
    {
        int exitCode = DisplayLicenseForm();
        if (exitCode == 4)
        {
            Environment.Exit(0);
        }
        if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)
        {
            Environment.Exit(0);
        }
    }
}
static private int DisplayLicenseForm()
{
    string errorMessage;
    if (lv.QlmLicenseObject.ValidateSettingsFile(settingsFile, out errorMessage) == false)
    {
        Console.WriteLine(errorMessage);
        return 0;
    }
    string args = String.Format("/settings \"{0}\"", settingsFile);
    if (!System.IO.File.Exists (wizardExec))
    {
        wizardExec = @"C:\Program Files\Soraco\QuickLicenseMgr\QlmLicenseWizard.exe";
    }
    return lv.QlmLicenseObject.LaunchProcess(wizardExec, args, true, true);
}
```
{% endcode %}

Now in your application's startup code, call ValidateLicense().

This completes the integration.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click OK.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
