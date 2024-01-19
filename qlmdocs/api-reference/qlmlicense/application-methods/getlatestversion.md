# GetLatestVersion

### Description

Gets the latest version of the specified.

```csharp
 string GetLatestVersion (string webServiceUrl, 
                                  int productID, 
                                  int majorVersion, 
                                  int minorVersion, 
                                  out string downloadUrl, 
                                  out string notes, 
                                  out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                            |
| ------------- | :--------: | -------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                          |
| productID     |     int    | ID of the product.                                                                     |
| majorVersion  |     int    | Major version of the product                                                           |
| minorVersion  |     int    | Minor version of the product.                                                          |
| downloadUrl   | out string | returns the url to download the latest version.                                        |
| notes         | out string | returns notes about the latest version.                                                |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |            |                                                                                        |

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
