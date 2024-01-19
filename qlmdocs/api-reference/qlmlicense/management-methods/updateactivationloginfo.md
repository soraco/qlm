# UpdateActivationLogInfo

### Description

Updates the data associated with a license key.

The ActivationLog table is used when multiple licenses are issued from a single ActivationKey. In this case, the data associated with each activated computer is stored in the ActivationLog table instead of the LicenseKeys table. Therefore, to update data in the ActivationLog table, you need to specify which computer to update. The computerID, computerKey and computerName arguments can be specified to identify the computer. At least one of these arguments must be specified.

The ActivationLog table contains the following updatable fields: ComputerKey, ComputerName, ComputerID, ActivationDate, LastAccessedDate, ActivationCount

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool UpdateActivationLogInfo (string webServiceUrl, string activationKey, 
                              string computerID, string computerKey, 
                              string computerName, string licenseData, 
                              out string response)
```

### Parameters

\[block:parameters] { "data": { "h-0": "Parameter", "h-1": "Type", "h-2": "Description", "0-0": "webServiceUrl", "0-1": "string", "0-2": "URL to the QLM License Server.", "1-0": "activationKey", "1-1": "string", "1-2": "activation key to update", "2-0": "computerID", "2-1": "string", "2-2": "the ID the computer to update", "3-0": "computerKey", "3-1": "string", "3-2": "the computer key to update", "4-0": "computerName", "4-1": "string", "4-2": "the computer name to update", "5-0": "licenseData", "5-1": "string", "5-2": "XML fragment containing the fields to update. The XML fragment should be of the form: \n \n\\\<licenseArguments \nfield1=" 'value' \nfield2=" 'value' " \n\ \n \nwhere field1 is the name of a field in the LicenseKeys table. For fields of type date, you should use the following date/time format: yyyy-MM-dd HH:mm:ss \n \nExample: \n\\\<licenseArguments \nComputerName= " 'my pc' " \nUserData1=" 'my user data' " \n\\", "6-0": "response", "6-1": "string", "6-2": "XML fragment containing the result of the call" }, "cols": 3, "rows": 7, "align": \[ "left", "center", "left" ] } \[/block]

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

Use [ParseResults ](https://soraco.readme.io/reference/parseresults)to interpret the results of the call and load the returned data into an [ILicenseInfo ](https://soraco.readme.io/reference/ilicenseinfo)object.

```c#
ILicenseInfo li = new LicenseInfo();
string message = string.Empty;
if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
{
  // The operation  was successful	
}
else
{
  // The operation failed
}
```

#### Example

```c#
string userData = "Test&Go";  
userData = SecurityElement.Escape(userData);

string licenseData = String.Format (@"\<licenseArguments UserData1=""N'{0}'""> </licenseArguments>", 
                                    userData);
```
