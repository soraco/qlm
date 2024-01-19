# UpdateLicenseInfo

### Description

Updates the data associated with a license key.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool UpdateLicenseInfo (string webServiceUrl, string activationKey, 
                        string licenseData, out string response)
```

### Parameters

\[block:parameters] { "data": { "h-0": "Parameter", "h-1": "Type", "h-2": "Description", "0-0": "webServiceUrl", "0-1": "string", "0-2": "URL to the QLM License Server.", "1-0": "activationKey", "1-1": "string", "1-2": "activation key to update", "2-0": "licenseData", "2-1": "string", "2-2": "XML fragment containing the fields to update. The XML fragment should be of the form: \n \n\\\<licenseArguments \nfield1=" 'value' \nfield2=" 'value' " \n\ \n \nwhere field1 is the name of a field in the LicenseKeys table. For fields of type date, you should use the following date/time format: yyyy-MM-dd HH:mm:ss \n \nExample: \n\\\<licenseArguments \nComputerName= " 'my pc' " \nUserData1=" 'my user data' " \n\\", "3-0": "response", "3-1": "string", "3-2": "XML fragment containing the result of the call" }, "cols": 3, "rows": 4, "align": \[ "left", "center", "left" ] } \[/block]

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully updated license information for ActivationKey=XYZ.</result>
</QuickLicenseManager>
```

### Example error response

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

**Important**: The value part of the licenseData xml fragment must be properly escaped for xml reserved keywords.

## Remarks

When updating license information of a multiple activations license key (Number of Licenses > 1), the data associated with each activated computer is stored in the ActivationLog table instead of the LicenseKeys table. Therefore, to update data in the ActivationLog table, you need to specify which computer to update. The computerID, computerKey and computerName arguments can be specified to identify the computer. At least one of these arguments must be specified.

The ActivationLog table contains the following updatable fields: ComputerKey, ComputerName, ComputerID, ActivationDate, LastAccessedDate, ActivationCount

Use [ParseResults ](https://soraco.readme.io/reference/parseresults)to interpret the results of the call and load the returned data into an [ILicenseInfo ](https://soraco.readme.io/reference/ilicenseinfo)object.

#### Example: modify the number of licenses

```csharp
//Modify the number of licenses and available licenses

int numLicenses = 3;
int availableLicenses = 2;

string licenseData = String.Format(@"<licenseArguments ");
licenseData += String.Format(@" NumLicenses='{0}'", numLicenses);
licenseData += String.Format(@" AvailableLicenses='{0}'", availableLicenses);
licenseData += String.Format(@"> </licenseArguments>");

string response;
lv.QlmLicenseObject.AdminEncryptionKey = "{B6163D99-F46A-4580-BB42-BF276A507A14}";
lv.QlmLicenseObject.UpdateLicenseInfo(string.Empty, lv.ActivationKey, licenseData, out response);

ILicenseInfo li = new LicenseInfo();
string message = string.Empty;
if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
{
  // success
}
else
{
  // error
}
```

#### Example - how to escape characters

```c#
string userData = "Test&Go";  
userData = SecurityElement.Escape(userData);

string licenseData = String.Format (@"\<licenseArguments UserData1=""N'{0}'""> </licenseArguments>", 
                                    userData);
```
