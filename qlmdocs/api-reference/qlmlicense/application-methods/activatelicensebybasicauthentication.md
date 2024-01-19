# ActivateLicenseByBasicAuthentication

### Description

Activates a license key with an user name and password.

```csharp
void ActivateLicenseByBasicAuthentication(string webServiceUrl, string username, string password,
                                        string computerID, string computerName, 
                                        string qlmVersion, string userData1, 
                                        string affiliateID, bool incrementActivationCount,
                                        out string response)
```

### Parameters

| Parameter                |  Type  | Description                                                                   |
| ------------------------ | :----: | ----------------------------------------------------------------------------- |
| webServiceUrl            | string | URL to the QLM License Server.                                                |
| username                 | string | the customer's user account name                                              |
| password                 | string | the customer's user account password                                          |
| computerID               | string | The unique computer identifier                                                |
| computerName             | string | The name of the computer. This argument is not required but recommended.      |
| qlmVersion               | string | The version of the QLM Engine                                                 |
| userData1                | string | User data to associate with the license key                                   |
| affiliateID              | string | ID of the Affiliate                                                           |
| incrementActivationCount |  bool  | Flag to determine if the activation count should be incremented on the server |
| response                 | string | XML fragment containing the result of the call.                               |

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

You must call [DefineProduct ](../client-side-methods/defineproduct.md)before calling this function.

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
