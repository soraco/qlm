# ActivateLicenseEx

### Description

Activates a license key over the internet.

```c#
void ActivateLicenseEx (string webServiceUrl, 
                        string activationKey, 
                        string computerID, 
                        string computerName, 
                        string qlmVersion, 
                        string userData1, 
                        string affiliateID, 
                        out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                            |
| ------------- | :----: | -------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                         |
| activationKey | string | the license key to activate                                                            |
| computerID    | string | The unique computer identifier                                                         |
| computerName  | string | the name of the computer, not required but recommended.                                |
| qlmVersion    | string | the version of the QLM Engine                                                          |
| userData1     | string | User data to associate with the license key                                            |
| affiliateID   | string | ID of affiliate                                                                        |
| response      | string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |        |                                                                                        |

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

You must call [DefineProduct ](https://soraco.readme.io/reference/defineproduct)before calling this function.

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
