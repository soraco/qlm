# IsLicenseKeyValid

### Description

Checks if the provided license key is valid.

```c#
void IsLicenseKeyValid (string webServiceUrl, 
                        string activationKey, 
                        out string response)
```

### Parameters

| Parameter     |    Type    | Description                                     |
| ------------- | :--------: | ----------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                   |
| activationKey |   string   | activation key                                  |
| response      | out string | XML fragment containing the result of the call. |

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
<error>The activation key is not valid</error>
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
