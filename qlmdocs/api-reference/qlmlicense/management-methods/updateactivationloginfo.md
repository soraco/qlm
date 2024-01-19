# UpdateActivationLogInfo

### Description

Updates the data associated with a license key.

The ActivationLog table is used when multiple licenses are issued from a single ActivationKey. In this case, the data associated with each activated computer is stored in the ActivationLog table instead of the LicenseKeys table. Therefore, to update data in the ActivationLog table, you need to specify which computer to update. The computerID, computerKey and computerName arguments can be specified to identify the computer. At least one of these arguments must be specified.

The ActivationLog table contains the following updatable fields: ComputerKey, ComputerName, ComputerID, ActivationDate, LastAccessedDate, ActivationCount

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool UpdateActivationLogInfo (string webServiceUrl, string activationKey, 
                              string computerID, string computerKey, 
                              string computerName, string licenseData, 
                              out string response)
```

### Parameters

| Parameter     | Type   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| ------------- | ------ | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| activationKey | string | activation key to update                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| computerID    | string | the ID the computer to update                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| computerKey   | string | the computer key to update                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| computerName  | string | the computer name to update                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| licenseData   | string | <p>XML fragment containing the fields to update. The XML fragment should be of the form:<br><br>&#x3C;licenseArguments<br>field1=" 'value'<br>field2=" 'value' "<br>&#x3C;/licenseArguments><br><br>where field1 is the name of a field in the LicenseKeys table. For fields of type date, you should use the following date/time format: yyyy-MM-dd HH:mm:ss<br><br>Example:<br>&#x3C;licenseArguments<br>ComputerName= " 'my pc' "<br>UserData1=" 'my user data' "<br>&#x3C;/licenseArguments></p> |
| response      | string | XML fragment containing the result of the call                                                                                                                                                                                                                                                                                                                                                                                                                                                       |

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

Use [ParseResults ](../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../ilicenseinfo/)object.

```csharp
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

```csharp
string userData = "Test&Go";  
userData = SecurityElement.Escape(userData);

string licenseData = String.Format (@"\<licenseArguments UserData1=""N'{0}'""> </licenseArguments>", 
                                    userData);
```
