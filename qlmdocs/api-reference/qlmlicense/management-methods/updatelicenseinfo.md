# UpdateLicenseInfo

### Description

Updates the data associated with a license key.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool UpdateLicenseInfo (string webServiceUrl, string activationKey, 
                        string licenseData, out string response)
```

### Parameters

<table><thead><tr><th width="197">Parameter</th><th width="147.33333333333331">Type</th><th>Description</th></tr></thead><tbody><tr><td>webServiceUrl</td><td>string</td><td>URL to the QLM License Server.</td></tr><tr><td>activationKey</td><td>string</td><td>activation key to update</td></tr><tr><td>licenseData</td><td>string</td><td>XML fragment containing the fields to update. The XML fragment should be of the form:<br><br>&#x3C;licenseArguments<br>field1=" 'value'<br>field2=" 'value' "<br>&#x3C;/licenseArguments><br><br>where field1 is the name of a field in the LicenseKeys table. For fields of type date, you should use the following date/time format: yyyy-MM-dd HH:mm:ss<br><br>Example:<br>&#x3C;licenseArguments<br>ComputerName= " 'my pc' "<br>UserData1=" 'my user data' "<br>&#x3C;/licenseArguments></td></tr><tr><td>response</td><td>string</td><td>XML fragment containing the result of the call</td></tr></tbody></table>

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

Use [ParseResults ](../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../ilicenseinfo/)object.

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

```csharp
string userData = "Test&Go";  
userData = SecurityElement.Escape(userData);

string licenseData = String.Format (@"\<licenseArguments UserData1=""N'{0}'""> </licenseArguments>", 
                                    userData);
```
