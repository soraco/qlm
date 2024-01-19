# GetLatestEligibleVersion

### Description

Gets the latest version of the specified product that the user is eligible to. This works in conjunction with the Maintenance Plan feature and the product Release Date property.

A user is eligible to the latest version where the Maintenance Plan Renewal Date is greater than or equal to the product's release date. Note that if the maintenance plan is not enabled, then the latest version is returned based on the provided product ID, major version and minor version.

```csharp
 string GetLatestEligibleVersion (string webServiceUrl, 
                                  string activationKey, 
                                  string computerKey, 
                                  int productID, 
                                  int majorVersion, 
                                  int minorVersion, 
                                  out string downloadUrl, 
                                  out string notes, 
                                  out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                                         |
| ------------- | :--------: | --------------------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                                       |
| activationKey |   string   | Activation Key of the customer. This argument can be empty if the ComputerKey argument is provided. |
| computerKey   |   string   | Computer Key of the customer. This argument can be empty if the ActivationKey argument is provided. |
| productID     |     int    | ID of the product.                                                                                  |
| majorVersion  |     int    | Major version of the product                                                                        |
| minorVersion  |     int    | Minor version of the product.                                                                       |
| downloadUrl   | out string | returns the url to download the latest version.                                                     |
| notes         | out string | returns notes about the latest version.                                                             |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows:              |
|               |            |                                                                                                     |

### Return

| Type   | Description                              |
| ------ | ---------------------------------------- |
| string | Returns the value of the latest version. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>The latest version is xyz.</result>
<latestVersion>xyz</latestVersion>
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
