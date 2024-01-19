# Protect an ASP.NET application with QLM

Following is a step-by-step procedure to protect an ASP.NET application with QLM. Note that the steps below assume you have a QLM License Server already setup. If you are evaluating QLM, you can use the "Demo License Server" that is available to you during the trial period.

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

```csharp
string computerID;
string activationKey;
string computerKey;
LicenseValidator lv = new LicenseValidator();
```

> 7\. When your ASP.NET page is loaded (in the Page\_Load event), call the LicenseValidator.ValidateLicenseAtStartup function as follows:

> {% code overflow="wrap" %}
> ```csharp
> protected void Page_Load(object sender, EventArgs e)
> {
>     computerID = Server.MachineName;
>     if (!Page.IsPostBack)
>     {
>         bool needsActivation = false;
>         string returnMsg = string.Empty;
>         bool isValid = lv.ValidateLicenseAtStartup (ELicenseBinding.ComputerName, ref needsActivation, ref returnMsg);
>         txtActivationKey.Text = lv.ActivationKey;
>         txtComputerName.Text = computerID;
>         txtLicenseKey.Text = lv.ComputerKey;
>         //added condition to show/hide popup.
>         if (isValid)
>         {
>             popup.Hide();
>             if (String.IsNullOrEmpty (returnMsg))
>             {
>                 lblLicenseStatus.Text = String.Format("Your license is valid.");
>             }
>             else
>             {
>                 lblLicenseStatus.Text = returnMsg;
>             }
>         }
>         else
>         {
>             if (!String.IsNullOrEmpty (returnMsg))
>             {
>                 lblLicenseStatus.Text = returnMsg;
>             }
>             else if (String.IsNullOrEmpty (lv.ActivationKey))
>             {
>                 lblLicenseStatus.Text = "No license key was entered.";
>             }
>             popup.Show();
>         }
>     }
> }
> ```
> {% endcode %}
>
> &#x20;

In the code above, if the license is valid, your application starts up. If the license is not valid, we display the form to prompt the user to enter an Activation Key and activate it.

8\. When the activation form is displayed, the user must enter an activation key and then click Activate. Add the following code in the activate click event:

{% code overflow="wrap" %}
```csharp
protected void btnActivate_Click(object sender, EventArgs e)
    {
    activationKey = txtActivationKey.Text;
    computerKey = txtLicenseKey.Text;
    // The QLM API will be called here with the activationKey and the computerID as input
    string statusMessage;
    if (ActivateLicense (activationKey, computerID, out computerKey, out statusMessage))
    {        
        lblLicenseStatus.Text = txtMessage.Text = statusMessage;
    }
    else
    {
        // Display an error message in the popup's txtMessage field with the content being statusMessage
        lblLicenseStatus.Text = txtMessage.Text = statusMessage;
    }
}
private bool ActivateLicense (string _activationKey, string _computerID, out string computerKey, out string returnMessage)
{
    bool ret = false;
    returnMessage = string.Empty;
    computerKey = txtLicenseKey.Text;
    String response = string.Empty;
    String computerName = String.Empty;
    String userData = String.Empty;
    txtMessage.Text = " ";
    bool needsActivation = false;
    ret = lv.ValidateLicense(_activationKey, computerKey, ref _computerID,                                 ELicenseBinding.ComputerName, ref needsActivation, ref returnMessage);
    if (!ret)
    {
        if (needsActivation)
        {
            lv.QlmLicenseObject.ActivateLicense(lv.QlmLicenseObject.DefaultWebServiceUrl, activationKey, computerID, computerName, lv.QlmLicenseObject.Version, userData, out response);
            ILicenseInfo licenseInfo = new LicenseInfo();
            returnMessage = string.Empty;
            if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref returnMessage))
            {
                ret = true;
                txtLicenseKey.Text = licenseInfo.ComputerKey;
                lv.QlmLicenseObject.StoreKeys(activationKey, licenseInfo.ComputerKey);
                if (String.IsNullOrEmpty(returnMessage))
                {
                    returnMessage = String.Format("The license was successfully activated.");
                }
            }
        }       
    }
    else
    {
        returnMessage = String.Format("The license was already successfully activated.");
    }
    return ret;
}
   
```
{% endcode %}

This completes the integration. The next time you open your ASP.NET application the Page\_Load event should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click OK.
* Copy and Paste the generated Activation Key in the Activation Control launched when your application starts up and follow the steps in the wizard.
