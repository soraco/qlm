# CreateComputerBoundTrialKey

### Description

Creates a trial activation key, then automatically activates it on the server side and returns the computer bound license key.

```c#
 string CreateComputerBoundTrialKey(string webServiceUrl, 
                                    string computerID, 
                                    string computerName, 
                                    string email, 
                                    string features, 
                                    string affiliateID, 
                                    string userData1, 
                                    out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                                                                                                                                                                                    |
| ------------- | :----: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server                                                                                                                                                                                                                  |
| computerID    | string | Unique identifier of the computer being activated.                                                                                                                                                                                             |
| computerName  | string | Friendly name of the computer being activated.                                                                                                                                                                                                 |
| email         | string | email address to associate to the license key - may be empty                                                                                                                                                                                   |
| features      | string | Semi comma separated list of feature sets and their corresponding values. Example: 0:1;1:2;2:3;3:6 - enables feature 1 in feature set 0, feature 2 in feature set 1, feature 1+2 (3) in feature set 4 and features 1+2+3 (6) in feature set 3. |
| affiliateID   | string | ID of affiliate                                                                                                                                                                                                                                |
| userData1     | string | user data to associate to this license                                                                                                                                                                                                         |
| response      | string | XML fragment containing the result of the call. The Xml fragment schema is as follows:                                                                                                                                                         |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<pckey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
<userCompany>My Company</userCompany>
<userFullName>John Smith</userFullName>
<userEmail>john@smith.com</userEmail>
</QuickLicenseManager>

```

### Return

| Type   | Description                                  |
| ------ | -------------------------------------------- |
| string | the computer bound license key (ComputerKey) |

### Remarks

You must call [DefineProduct ](https://soraco.readme.io/reference/defineproduct)before calling this function.

This function is useful if you want to create trial keys from within your application. The trial period is controlled by the \*\*trialDuration \*\*Server Property. Server Properties can be set from the Manage Keys / Sites / Server Properties page.

If you want to prevent calls to this function, set the \*\*enableCreateComputerBoundTrial \*\*Server Property to false. The Server Properties can be set from the Manage Keys / Sites / Server Properties page.

### Example

{% code overflow="wrap" %}
```c#
QLM.LicenseValidator licenseValidator = new QLM.LicenseValidator();
string response = string.Empty;
string webServiceUrl = "https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx";

string activationKey = string.Empty;
string computerKey = string.Empty;

lv.QlmLicenseObject.ReadKeys(ref activationKey, ref computerKey);

if (String.IsNullOrEmpty(activationKey) && String.IsNullOrEmpty(computerKey))
{

    computerKey = lv.QlmLicenseObject.CreateComputerBoundTrialKey(webServiceUrl,         Environment.MachineName, Environment.MachineName, "None", string.Empty, string.Empty, string.Empty, out response); 

    string message = string.Empty;
    ILicenseInfo licenseInfo = new LicenseInfo();
    if (lv.QlmLicenseObject.ParseResults (response, ref licenseInfo, ref message))
    {
        string activationKey = licenseInfo.ActivationKey;
        string computerKey = licenseInfo.ComputerKey;
        lv.QlmLicenseObject.StoreKeys(activationKey, computerKey);
    }

}
```
{% endcode %}
