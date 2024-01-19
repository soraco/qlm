# ActivateLicenseDialog

### Description

Creates a form for the user to enter his contact information and the activation key. When submitted, the user is added to the database and his license is activated.

```csharp
bool ActivateLicenseDialog(string webServiceUrl, 
                                  string computerID, 
                                  string userData1, 
                                  Control parentWindow, 
                                  out string response)
```

### Parameters

| Parameter     |   Type  | Description                                                                            |
| ------------- | :-----: | -------------------------------------------------------------------------------------- |
| webServiceUrl |  string | URL to the QLM License Server.                                                         |
| computerID    |  string | The unique computer identifier                                                         |
| userData1     |  string | User data to associate with the license key                                            |
| parentWindow  | Control | parent of the activation form window                                                   |
| response      |  string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |         |                                                                                        |

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
