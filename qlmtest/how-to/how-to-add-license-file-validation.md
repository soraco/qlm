# How to add license file validation

### Overview

If you want to strengthen the security of your application, you can add license file validation to your application by having the server generate a digitally signed license file and the client validate the license file.

The license file generation process can be fully automated for online users. For offline users, the license file can be generated manually by the end-user or by the vendor and sent to the end-user.

### Online license  file validation

#### QLM License Wizard

If you are using the QLM License Wizard to activate licenses, simply set the QlmDownloadLicenseFile property to true. This will instruct the wizard to download a license file during the activation process. By default, the license file is stored in the same location as the license keys.

#### API

If you are using the QLM API to activate a license, simply set the QlmLicense.DownloadLicenseFile property to true. This will instruct the QLM API to download a license file during the activation process. By default, the license file is stored in the same location as the license keys.

### Offline license file validation

A license file can be generated offline from the QLM Self Help. Additionally, you can generate a license file on behalf of the customer from the QLM Management Console or the QLM Portal.

### License file validation

If you are currently using an Activation Key / Computer Key for license validation, you can either augment your current validation process with license file validation or completely switch to license file validation.

#### Augment License Validation Process

To augment your current license validation process with license file validation, follow the steps above to enable license file validation and use the latest version of the QLM LicenseValidator class. The latest version of the LicenseValidator class automatically performs license file validation if the QlmDownloadLicenseFile is set to true.

#### Switch to License File Validation&#x20;

To completely switch from license key validation to license file validation, you must call the LicenseValidator.ValidateLicenseFile instead of LicenseValidator.ValidateLicenseAtStartup.

Example:

```
bool needsActivation = false;
string errorMsg = string.Empty;
ELicenseBinding licenseBinding = ELicenseBinding.ComputerName;

// Comment out ValidateLicenseAtStartup
//if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)

// and replace with
string licenseFileContent = lv.QlmLicenseObject.ReadActivatedLicenseFile();
if (lv.QlmLicenseObject.ValidateLicenseFileContent (string.Empty, licenseFileContent, computerID, licenseBinding, ref needsActivation, ref errorMsg) == false)
{

}
```
