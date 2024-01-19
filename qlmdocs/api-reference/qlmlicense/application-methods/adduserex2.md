# AddUserEx2

### Description

Adds a new user.

```csharp
 bool AddUserEx2(string webServiceUrl, 
                 IQlmCustomerInfo customerInfo, 
                 bool updateIfExists, 
                 out
                 string response);
```

### Parameters

| Parameter      |                     Type                    | Description                                                                            |
| -------------- | :-----------------------------------------: | -------------------------------------------------------------------------------------- |
| webServiceUrl  |                    string                   | URL to the QLM License Server                                                          |
| customerInfo   | [IQlmCustomerInfo](../../iqlmcustomerinfo/) | customer to add                                                                        |
| updateIfExists |                     bool                    | update the customer information if the customer already exists                         |
| response       |                    string                   | XML fragment containing the result of the call. The Xml fragment schema is as follows: |

### Return

| Type | Description                                                                                                                                                                                                                                                          |
| ---- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| bool | Returns true if the user was added. If the user was not added because of an error or because the user already exists and updateIfExists is false, the response contains details about the error. You can use QlmLicense.ParseResults to get details about the error. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Customer ABC was added successfully.".</result>
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
QlmCustomerInfo ci = new QlmCustomerInfo();

ci.FullName = "John Smith";
ci.Email = "John.Smith@js.com";
ci.Phone = "514-344-4483";
ci.Fax = "514-344-4484";
ci.Mobile = "514-344-4484";
ci.Company = "Soraco";
ci.Address1 = "123 Soraco Road";
ci.Address2 = "Suite 123";
ci.City = "Montreal";
ci.State = "Quebec";
ci.Zip = "H5X 3X6";
ci.Country = "Canada";
ci.IncludeInMailList = true;
ci.ExternalID = "01234";
ci.UserData1 = "MyUserData";
ci.Notes = "My Notes";
ci.LoginName = "jsmith";


string response;

lv.QlmLicenseObject.AddUserEx2(string.Empty, ci, true, out response);
ILicenseInfo li = new LicenseInfo();
string message = string.Empty;
if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
{
  // success
}
else
{
  // error
}
```
