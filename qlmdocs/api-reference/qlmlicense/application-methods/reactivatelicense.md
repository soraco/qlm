# ReactivateLicense

### Description

Reactivates a license to get the latest server-side values such as a new expiry date, new features, etc.

This function should be used to avoid the ActivationCount being incremented with every re-activation of the same system. The ActivationCount is used to detect [fraud attempts](https://support.soraco.co/hc/en-us/articles/211530743-How-does-QLM-protect-an-application-hosted-on-a-Virtual-Machine-VM-) when cloning virtual machines.

```csharp
void ReactivateLicense (string webServiceUrl,
                        string activationKey, 
                        string computerID, 
                        out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                            |
| ------------- | :--------: | -------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                          |
| activationKey |   string   | the license key to activate                                                            |
| computerID    |   string   | the unique computer identifier                                                         |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |

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

### Example error response

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
