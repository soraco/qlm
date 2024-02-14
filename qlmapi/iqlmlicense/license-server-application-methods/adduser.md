# AddUser

### Description

Adds a new user.

```c#
void AddUser(string webServiceUrl, 
             string customerName, 
             string customerEmail, 
             string customerPhone, 
             string customerFax, 
             string customerMobile, 
             string customerCompany, 
             string customerAddress1, 
             string customerAddress2, 
             string customerCity, 
             string customerState, 
             string customerZip, 
             string customerCountry, 
             string customerIP, 
             string customerNotes, 
             bool includeInMailList, 
             out string response)
```

### Parameters

| Parameter         |  Type  | Description                                                                            |
| ----------------- | :----: | -------------------------------------------------------------------------------------- |
| webServiceUrl     | string | URL to the QLM License Server                                                          |
| customerName      | string | Full Name                                                                              |
| customerEmail     | string | Email address                                                                          |
| customerPhone     | string | Phone number                                                                           |
| customerFax       | string | Fax number                                                                             |
| customerMobile    | string | Mobile phone number                                                                    |
| customerCompany   | string | Company name                                                                           |
| customerAddress1  | string | User data to associate with the license keyAddress 1                                   |
| customerAddress2  | string | Address 2                                                                              |
| customerCity      | string | City                                                                                   |
| customerState     | string | State                                                                                  |
| customerZip       | string | Zip Code                                                                               |
| customerCountry   | string | Country                                                                                |
| customerIP        | string | IP Address                                                                             |
| customerNotes     | string | Notes                                                                                  |
| includeInMailList | string | Include in mail list                                                                   |
| response          | string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|                   |        |                                                                                        |

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
