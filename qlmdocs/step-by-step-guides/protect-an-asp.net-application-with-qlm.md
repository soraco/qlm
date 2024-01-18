# Protect an ASP.NET application with QLM

Following is a step by step procedure to protect an ASP.NET application with QLM. Note that the steps below assume you have a QLM License Server already setup. If you are evaluating QLM, you can use the "Demo License Server" that is available to you during the trial period.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "C#"
* Page 3: Leave the default settings
* Page 4a: Select the folder where your ASP.NET source code is located and click Save
* Page 4b: Click Update Visual Studio Project and locate your \*.csproj file
* Page 5: Click Finish

4\. Open your ASP.NET application and verify that the LicenseValidator.cs class was added to the project. If it was not, add it manually. Similarly, verify that a reference to QlmLicenseLib.dll was added to the project. If not, add it manually.

5\. Create a form to prompt the user for an Activation Key. You can copy the activation form included in the ASP.NET sample located in this folder: %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmAspDotNetSample

6\. In your main ASP.NET page, declare the following variables:

> string computerID;\
> string activationKey;\
> string computerKey;
>
> LicenseValidator lv = new LicenseValidator();

7\. When your ASP.NET page is loaded (in the Page\_Load event), call the LicenseValidator.ValidateLicenseAtStartup function as follows:

> protected void Page\_Load(object sender, EventArgs e)\
> {\
> &#x20;   computerID = Server.MachineName;
>
> &#x20;   if (!Page.IsPostBack)\
> &#x20;   {\
> &#x20;       bool needsActivation = false;\
> &#x20;       string returnMsg = string.Empty;
>
> &#x20;       bool isValid = lv.ValidateLicenseAtStartup (ELicenseBinding.ComputerName, ref needsActivation, ref returnMsg);
>
> &#x20;       txtActivationKey.Text = lv.ActivationKey;\
> &#x20;       txtComputerName.Text = computerID;\
> &#x20;       txtLicenseKey.Text = lv.ComputerKey;
>
> &#x20;       //added condition to show/hide popup.\
> &#x20;       if (isValid)\
> &#x20;       {\
> &#x20;           popup.Hide();
>
> &#x20;           if (String.IsNullOrEmpty (returnMsg))\
> &#x20;           {\
> &#x20;               lblLicenseStatus.Text = String.Format("Your license is valid.");\
> &#x20;           }\
> &#x20;           else\
> &#x20;           {\
> &#x20;               lblLicenseStatus.Text = returnMsg;\
> &#x20;           }\
> &#x20;       }\
> &#x20;       else\
> &#x20;       {\
> &#x20;           if (!String.IsNullOrEmpty (returnMsg))\
> &#x20;           {\
> &#x20;               lblLicenseStatus.Text = returnMsg;\
> &#x20;           }\
> &#x20;           else if (String.IsNullOrEmpty (lv.ActivationKey))\
> &#x20;           {\
> &#x20;               lblLicenseStatus.Text = "No license key was entered.";\
> &#x20;           }\
> &#x20;           popup.Show();\
> &#x20;       }\
> &#x20;   }\
> }
>
> &#x20;

In the code above, if the license is valid, your application starts up. If the license is not valid, we display the form to prompt the user to enter an Activation Key and activate it.

8\. When the activation form is displayed, the user must enter an activation key then click Activate. Add the following code in the activate click event:

> protected void btnActivate\_Click(object sender, EventArgs e)\
> &#x20;   {\
> &#x20;   activationKey = txtActivationKey.Text;\
> &#x20;   computerKey = txtLicenseKey.Text;\
> &#x20;   // The QLM API will be called here with the activationKey and the computerID as input\
> &#x20;   string statusMessage;\
> &#x20;   if (ActivateLicense (activationKey, computerID, out computerKey, out statusMessage))\
> &#x20;   {        \
> &#x20;       lblLicenseStatus.Text = txtMessage.Text = statusMessage;
>
> &#x20;   }\
> &#x20;   else\
> &#x20;   {\
> &#x20;       // Display an error message in the popup's txtMessage field with the content being statusMessage\
> &#x20;       lblLicenseStatus.Text = txtMessage.Text = statusMessage;\
> &#x20;   }\
> }
>
> private bool ActivateLicense (string \_activationKey, string \_computerID, out string computerKey, out string returnMessage)\
> {\
> &#x20;   bool ret = false;
>
> &#x20;   returnMessage = string.Empty;\
> &#x20;   computerKey = txtLicenseKey.Text;
>
> &#x20;   String response = string.Empty;
>
> &#x20;   String computerName = String.Empty;\
> &#x20;   String userData = String.Empty;
>
> &#x20;   txtMessage.Text = " ";
>
> &#x20;   bool needsActivation = false;
>
> &#x20;   ret = lv.ValidateLicense(\_activationKey, computerKey, ref \_computerID,                                 ELicenseBinding.ComputerName, ref needsActivation, ref returnMessage);
>
> &#x20;   if (!ret)\
> &#x20;   {\
> &#x20;       if (needsActivation)\
> &#x20;       {
>
> &#x20;           lv.QlmLicenseObject.ActivateLicense(lv.QlmLicenseObject.DefaultWebServiceUrl, activationKey, computerID, computerName, lv.QlmLicenseObject.Version, userData, out response);
>
> &#x20;           ILicenseInfo licenseInfo = new LicenseInfo();
>
> &#x20;           returnMessage = string.Empty;
>
> &#x20;           if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref returnMessage))\
> &#x20;           {\
> &#x20;               ret = true;
>
> &#x20;               txtLicenseKey.Text = licenseInfo.ComputerKey;\
> &#x20;               lv.QlmLicenseObject.StoreKeys(activationKey, licenseInfo.ComputerKey);\
> &#x20;               if (String.IsNullOrEmpty(returnMessage))\
> &#x20;               {\
> &#x20;                   returnMessage = String.Format("The license was successfully activated.");\
> &#x20;               }\
> &#x20;           }\
> &#x20;       }       \
> &#x20;   }\
> &#x20;   else\
> &#x20;   {\
> &#x20;       returnMessage = String.Format("The license was already successfully activated.");\
> &#x20;   }
>
> &#x20;   return ret;\
> }
>
> &#x20; &#x20;

This completes the integration. The next time you open your ASP.NET application the Page\_Load event should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the Activation Control launched when your application starts up and follow the steps in the wizard.
