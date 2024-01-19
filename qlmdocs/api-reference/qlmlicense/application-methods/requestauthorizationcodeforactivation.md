# RequestAuthorizationCodeForActivation

### Description

Initiates the process of activating a license by authorization code.

```c#
void RequestAuthorizationCodeForActivation(string webServiceUrl, 
                                           string email, 
                                           string mobile, 
                                           string computerID, 
                                           out string response)
```

### Parameters

| Parameter     |    Type    | Description                                           |
| ------------- | :--------: | ----------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                         |
| email         |   string   | Email address of the user that owns the license       |
| mobile        |   string   | Mobile Phone Number of the user that owns the license |
| computerID    |   string   | the unique computer identifier                        |
| response      | out string | XML fragment containing the result of the call.       |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>result of theactivation</result>
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

If the server identifies a license key that corresponds to the user, an Authorization Code is generated and sent to the customer by email or SMS. The client application must then call QlmLicense.ActivateLicenseByAuthorizationCode.

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
