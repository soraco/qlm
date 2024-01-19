# ActivateLicenseForUser

### Description

Activates a license key over the internet, binds it to a specific user and returns a computer bound license key.

```csharp
void ActivateLicenseForUser(string webServiceUrl, 
                            string activationKey, 
                            string email, 
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
| activationKey | string | Activation key                                                                         |
| email         | string | Email address of user that owns the license                                            |
| computerID    | string | The unique computer identifier                                                         |
| computerName  | string | the name of the computer.                                                              |
| qlmVersion    | string | the version of the QLM Engine to use                                                   |
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
