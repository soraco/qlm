# ValidateLicenseFileContent

### Description

Validates a QLM license file by performing the following operations:

* Reads the license file content and validates its signature
* Validates the license based on the information in the license file
* If server-side validation is enabled, contacts the License Server and validates the license on the server
* If needed, reactivates the license to retrieve the latest information from the server

```csharp
 bool ValidateLicenseFileContent(string webServiceUrl, string licenseFileContent, 
                                 string activationKey, string computerID, ELicenseBinding licenseBinding, 
                                 out ILicenseInfo licenseInfo)
```

### Parameters

| Parameter          |                      Type                      | Description                    |
| ------------------ | :--------------------------------------------: | ------------------------------ |
| webServiceUrl      |                     string                     | URL to the QLM License Server  |
| licenseFileContent |                     string                     | content of the license file    |
| activationKey      |                     string                     | the activation key             |
| computerID         |                     string                     | the unique computer identifier |
| licenseBinding     | [ELicenseBinding](../enums/elicensebinding.md) | the license binding to use     |
| licenseInfo        |       [ILicenseInfo](../../ilicenseinfo/)      | returned ILicenseInfo object   |

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

string licenseFileContent = "<code to retrieve the license file content>";

bool ret = lv.QlmLicenseObject.ValidateLicenseFileContent(lv.QlmLicenseObject.DefaultWebServiceUrl, 
                                                          licenseFileContent, string.Empty, string.Empty,
                                                          licenseBinding, out licenseInfo);
if (ret == false)
{
  DisplayLicenseForm(); // Displays the license wizard
  
  licenseFileContent = "<code to retrieve the license file content>";

  if (lv.QlmLicenseObject.ValidateLicenseFileConteny(lv.QlmLicenseObject.DefaultWebServiceUrl, 
                                                     licenseFileContent, string.Empty, string.Empty, 
                                                     licenseBinding, out licenseInfo) == false)
  {
    Environment.Exit(0);
  }
}
```
