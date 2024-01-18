# How to activate a license

The recommended and fastest approach to activate a license is to use the QLM License Wizard. The QLM License Wizard is a full featured standalone application (or .NET WinForm control) that you can ship with your application. It enables your end-user to activate a license online or offline, deactivate a license as well as download and install the latest version of your application (Windows only).

If you prefer to create your own user interface to activate the license, the steps below describe the procedure to follow:

* Use the QLM Management Console / Protect Your Application wizard to generate the LicenseValidator class that corresponds to the programming language of your application
* When your application starts up, call LicenseValidator.ValidateLicenseAtStartup
* The first time you call ValidateLicenseAtStartup, it should return false.
* Prompt the user to enter an Activation Key
* Call LicenseValidator.ValidateLicense to validate the Activation key entered by the user. There are 3 cases you may want to consider to request an activation of the license:
  * The license has not been activated yet
  * The license is activated but has expired
  * The license  has been activated for another version of the product.
* Call [QlmLicense.ActivateLicense](https://support.soraco.co/hc/en-us/articles/207295216-QlmLicense-ActivateLicense) to activate the license
* Call [QlmLicense.ParseResults](https://support.soraco.co/hc/en-us/articles/207611673-QlmLicense-ParseResults) to get the results of the activation
* If ParseResults return true, the activation was successful.
* You should finally call [QlmLicense.StoreKeys](https://support.soraco.co/hc/en-us/articles/207611633-QlmLicense-StoreKeys) to store the Computer Key generated by the server

&#x20;

Example:

```
private void ActivateLicense(string activationKey, ref string licenseMessage)
{ 
     string computerID = Environment.MachineName;
     bool needsActivation = false;
     string returnMsg = string.Empty;


     if (lv.ValidateLicense (activationKey, string.Empty, ref computerID, ELicenseBinding.ComputerName, ref needsActivation, ref returnMsg) == false)
     {

         if (lv.WrongProductVersion || lv.EvaluationExpired || needsActivation )
         {
             string response;
             lv.QlmLicenseObject.ActivateLicense(string.Empty, activationKey, computerID, Environment.MachineName, "5.0.00", string.Empty, out response);

             ILicenseInfo li = new LicenseInfo();
             string message = string.Empty;
             if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
             {
                 lv.QlmLicenseObject.StoreKeys(activationKey, li.ComputerKey);
             }
         }
      }
}
```
