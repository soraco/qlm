# UpdateUserEx4

### Description

Updates the data of an existing user.

```csharp
 void UpdateUserEx4(string webServiceUrl, 
                    string previousEmail, 
                    IQlmCustomerInfo customerInfo, 
                    out string response)
```

### Parameters

| Parameter     |                                   Type                                  | Description                                     |
| ------------- | :---------------------------------------------------------------------: | ----------------------------------------------- |
| webServiceUrl |                                  string                                 | URL to the QLM License Server                   |
| previousEmail |                                  string                                 | Email address of the existing user to update    |
| customerInfo  | [IQlmCustomerInfo](https://soraco.readme.io/reference/iqlmcustomerinfo) | Customer Information                            |
| response      |                                  string                                 | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Customer ABC was updated successfully.".</result>
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

To instruct the server to ignore the Privacy Consent settings, you must set the customerInfo.PrivacyConsentLastUpdate field to DateTime.MaxValue.

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
