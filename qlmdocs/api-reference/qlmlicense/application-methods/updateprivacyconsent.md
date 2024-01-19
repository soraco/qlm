# UpdatePrivacyConsent

### Description

Updates the privacy consent of a customer.

```csharp
 void UpdatePrivacyConsent(string webServiceUrl, 
                           string email, 
                           bool consent, 
                           out string response)
```

### Parameters

| Parameter     |    Type    | Description                                     |
| ------------- | :--------: | ----------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                   |
| email         |   string   | email address of the user to update             |
| consent       |    bool    | flag to set whether the user consents or not    |
| response      | out string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result> Success message </result>
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
