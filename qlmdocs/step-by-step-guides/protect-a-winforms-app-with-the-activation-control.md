# Protect a WinForms app with the Activation Control

Following is a step by step procedure to protect a WinForms with the QLM Activation user control. Note that the steps below assume you have a QLM License Server already setup. If you are evaluating QLM, you can use the "Demo License Server" that is available to you during the trial period.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "C#"
* Page 3: Leave the default settings
* Page 4a: Select the folder where your WinForms source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.csproj file
* Page 5: Click Finish

5\. Open your WinForms application and create a new WindowsForm and call it LicenseActivationFrm.

6\. In the Visual Studio Toolbox, locate the "QLM for .NET 4.0 (WinForms)" toolbox items

7\. Drag the "QlmActivationControl" onto the LicenseActivationFrm.

8\. View the properties of the QLM Activation Control and make sure the following properties match your product:

* Product ID
* MajorVersion
* MinorVersion
* QlmPublicKey
* QlmCommunicationEncryptionKey
* QlmWebserviceUrl

9\. Assuming you have a Form that is launched when you application starts up, add the following code to the Load event of your main form:

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

This completes the integration. The next time you open your WinForms application the Form\_Load event should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the Activation Control launched when your application starts up and follow the steps in the wizard.
