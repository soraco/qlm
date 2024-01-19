# ValidateLicenseFile

### Description

Validates a QLM license file by performing the following operations:

* Reads the license file and validates its signature
* Validates the license based on the information in the license file
* If server-side validation is enabled, contacts the License Server and validates the license on the server
* If needed, reactivates the license to retrieve the latest information from the server

```csharp
 bool ValidateLicenseFile(string webServiceUrl, string licenseFileName, 
                                 string activationKey, string computerID, ELicenseBinding licenseBinding, 
                                 out ILicenseInfo licenseInfo)

```

### Parameters

| Parameter       |                                  Type                                 | Description                    |
| --------------- | :-------------------------------------------------------------------: | ------------------------------ |
| webServiceUrl   |                                 string                                | URL to the QLM License Server  |
| licenseFileName |                                 string                                | path to the license file       |
| activationKey   |                                 string                                | the activation key             |
| computerID      |                                 string                                | the unique computer identifier |
| licenseBinding  | [ELicenseBinding](https://soraco.readme.io/reference/elicensebinding) | the license binding to use     |
| licenseInfo     |    [ILicenseInfo](https://soraco.readme.io/reference/ilicenseinfo)    | return licenseInfo object      |

### Return

| Type | Description                   |
| ---- | ----------------------------- |
| bool | true if the license is valid. |

### Remarks

If validation fails, licenseInfo.ServerErrorCode and licenseInfo.ErrorMessage provide additional details.

### Example

```csharp
QLM.LicenseValidator lv = new QLM.LicenseValidator(settingsFile);
string licenseFile = string.Empty;
ELicenseBinding licenseBinding = ELicenseBinding.ComputerName;
ILicenseInfo licenseInfo;

if (!String.IsNullOrEmpty(lv.QlmLicenseObject.LicenseFilePath))
{
  licenseFile = Environment.ExpandEnvironmentVariables(lv.QlmLicenseObject.LicenseFilePath);
}

bool ret = lv.QlmLicenseObject.ValidateLicenseFile(lv.QlmLicenseObject.DefaultWebServiceUrl, 
                                                   licenseFile, string.Empty, string.Empty,
                                                   licenseBinding, out licenseInfo);
if (ret == false)
{
  DisplayLicenseForm(); // Displays the license wizard

  if (lv.QlmLicenseObject.ValidateLicenseFile(lv.QlmLicenseObject.DefaultWebServiceUrl, 
                                              licenseFile, string.Empty, string.Empty, 
                                              licenseBinding, out licenseInfo) == false)
  {
    Environment.Exit(0);
  }
}






```
