# Protect a WinForms app with the QLM License Wizard

Following is a step by step procedure to protect a WinForms application. Note that the steps below assume you have a QLM License Server already setup.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application" tab:

* Page 1: Select the product to protect and the License Server
* Page 2: Select "C#" or VB.NET
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4a: Select the folder where your WinForms source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.csproj or \*.vbproj file
* Page 5: Click Finish

The "Protect your application" should have generated a class file and an XML file that contains your cuztomizations. In this guide, we will assume the XML file is called "Demo 1.0.lw.xml" which should be the case if you are evaluating QLM.

At this point there are 2 possible ways to integrate QLM in your app.

**OPTION 1**

1\. Open your WinForms application and create a new WindowsForm and call it LicenseActivationFrm.

2\. In the Visual Studio Toolbox, locate the "QLM for .NET 4.0 (WinForms)" toolbox items. Note that the new QLM License Wizard in QLM v10 only supports .NET 4.0+.

3\. Drag the "QlmWizardControl" onto the LicenseActivationFrm.

4\. View the properties of the Windows Form control hosting the QLM License Wizard and set the **FormBorderStyle** to "None"

5\. View the properties of the created wizard control and make sure the following properties match your product and your configuration:

* QlmProductID
* QlmMajorVersion
* QlmMinorVersion
* QlmPublicKey
* QlmCommunicationEncryptionKey
* QlmLicenseType
* QlmStoreKeysLocation
* QlmStoreKeysOptions
* QlmLicenseServerUrl
* QlmCustomerSiteUrl
* QlmApplicationVersion (this property should ideally be set programmatically when the form is loaded)

5\. Assuming you have a Form that is launched when you application starts up, add the following code to the Load event of your main form:

> QLM.LicenseValidator lv = new QLM.LicenseValidator();
>
> bool needsActivation = false;\
> string errorMsg = string.Empty;
>
> if (lv.ValidateLicenseAtStartup(Environment.MachineName, ref needsActivation, ref errorMsg) == false)\
> {\
> &#x20;   LicenseActivationFrm licenseFrm = new LicenseActivationFrm();\
> &#x20;   licenseFrm.ShowDialog();
>
> &#x20;   if (lv.ValidateLicenseAtStartup(Environment.MachineName, ref needsActivation, ref errorMsg) == false)\
> &#x20;   {\
> &#x20;       Environment.Exit(0);\
> &#x20;   }\
> }
>
> &#x20;

**OPTION 2:**

1\. In your application, add a reference to QlmControls.dll

2\. Create a function in your application called DisplayLicenseWizard as follows:

&#x20;       private void DisplayLicenseWizard ()\
&#x20;       {\
&#x20;           Assembly thisAssembly = Assembly.GetExecutingAssembly();\
&#x20;           string location = Path.GetDirectoryName(thisAssembly.Location);

&#x20;           QlmLicenseWizard lw = new QlmLicenseWizard();

&#x20;           string lwErrorMsg;

&#x20;           // Update the name of Demo 1.0.lw.xml to match your own product\
&#x20;           lw.LoadSettings(Path.Combine(location, "Demo 1.0.lw.xml"), out lwErrorMsg);

&#x20;           lw.qlmWizardControl.PostInitialize();

&#x20;           lw.ShowDialog();

&#x20;       }

3\. Assuming you have a Form that is launched when you application starts up, add the following code to the Load event of your main form:

> QLM.LicenseValidator lv = new QLM.LicenseValidator();
>
> bool needsActivation = false;\
> string errorMsg = string.Empty;
>
> if (lv.ValidateLicenseAtStartup(Environment.MachineName, ref needsActivation, ref errorMsg) == false)\
> {\
> &#x20;   DisplayLicenseWizard ();
>
> &#x20;   if (lv.ValidateLicenseAtStartup(Environment.MachineName, ref needsActivation, ref errorMsg) == false)\
> &#x20;   {\
> &#x20;       Environment.Exit(0);\
> &#x20;   }\
> }

This completes the integration. The next time you open your WinForms application the Form\_Load event should get triggered and perform the license validation.&#x20;

**To generate a license key for testing purposes:**

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
