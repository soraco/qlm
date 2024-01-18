# How do I change the license binding to a different identifier?

If you decide to modify the license binding of an application that has already been deployed to your customers, you can transition to a new license binding method as described below.

Consider the use-case where you initially deployed your application with the license binding set to ELicenseBinding.ComputerName. A year after your product is deployed to customers, you wish to bind the license to QLM Unique System Identifier (ELicenseBinding.QlmUniqueSystemIdentifier2). If you simply change the license binding in the new version of your application, all the previously generated ComputerKeys will fail to validate. In order to transition customers to the new license binding, you must force a reactivation of the license using the new license binding. The high level steps are:

* When your application starts up, call ValidateLicenseAtStartup.
* If the validation fails and the license is detected as non-valid, set the license binding to ELicenseBinding.ComputeName and try to validate the license again.
* If the license validation is successful, you must:
  * Deactivate the license using the previous license binding
  * Activation the license using the new license binding.

Example code:

```
private bool MigrateLicenseBinding ()
{
    bool ret = false;

 if (String.IsNullOrEmpty (lv.ComputerKey))
 {
  return ret;
 }

 // try the old license binding.
 string computerID = string.Empty;
 bool needsActivation = false;
 string errorMsg = string.Empty;
 ELicenseBinding oldLicenseBinding = ELicenseBinding.ComputerName;

 bool valid = lv.ValidateLicense(lv.ActivationKey, lv.ComputerKey, ref computerID, oldLicenseBinding, ref needsActivation, ref errorMsg);
 if (valid)
 {
  string response;
  lv.QlmLicenseObject.ReleaseLicense(string.Empty, lv.ActivationKey, computerID, lv.ComputerKey, out response);
  ILicenseInfo licenseInfo = new LicenseInfo();
  string message = string.Empty;
  if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref message))
  {
    // we were able to deactivate the license.
    // activate the license now using the new binding.

    QlmHardware hw = new QlmHardware();
    string newComputerID = hw.GetUniqueSystemIdentifier2();
    string qlmVersion = "5.0.00";

    lv.QlmLicenseObject.ActivateLicense(string.Empty, lv.ActivationKey, newComputerID, Environment.MachineName, qlmVersion, string.Empty, out response);

    if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref message))
    {
     // we were able to activate the license
     lv.QlmLicenseObject.StoreKeys(lv.ActivationKey, licenseInfo.ComputerKey);
     ret = true;
    }
  }
 }
 return ret;
}

```

![](https://support.soraco.co/hc/article\_attachments/14338487279636)
