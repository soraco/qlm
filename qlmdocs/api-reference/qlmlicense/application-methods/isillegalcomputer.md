# IsIllegalComputer

### Description

Checks if the current computer is properly registered in the QLM database.

```csharp
  void IsIllegalComputer (string webServiceUrl,
                          string activationKey, 
                          string computerKey, 
                          string computerID, 
                          string computerName, 
                          string qlmVersion, 
                          out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                           |
| ------------- | :--------: | ------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                         |
| activationKey |   string   | the activation key                                                                    |
| computerKey   |   string   | the computer bound key                                                                |
| computerID    |   string   | Unique identifier of the computer on which the license was activated.                 |
| computerName  |   string   | the computer name                                                                     |
| qlmVersion    |   string   | the version of the QLM engine                                                         |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>The activation key is valid.</result>
</QuickLicenseManager>
 
```

### Example error response

In the event of an error, the XML fragments returns:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

## Remarks

If the computer is registered in the database, IsIllegalComputer returns false.

If the computer is not registered in the database, the system will try to activate the license on this computer. If all available activations are already consumed, the activation will fail and IsIllegalComputer will return true. If there are unused activations, this computer will be activated and IsIllegalComputer will return false.

For more details about the detection of illegal computers, refer to this article

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
