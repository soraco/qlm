# GetCustomersInfo

### Description

Retrieves information about a set of customers.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
DataSet GetCustomersInfo (string webServiceUrl, string fieldName, 
                          string fieldOperator, string fieldValue, 
                          out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                     |
| ------------- | :----: | ------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                  |
| fieldName     | string | field from the Customers table. Typical fields are: Email, FullName, CustomerID |
| fieldOperator | string | a valid SQL operator such as: =, like, <>                                       |
| fieldValue    | string | value of the field to match                                                     |
| response      | string | XML fragment containing the result of the call.                                 |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Succesfully retrieved customers.</result>
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

### Example

```c#
DataSet ds = license.GetCustomersInfo (webServiceUrl, 
                                       "email", "=", "'customer@mail.com'", 
                                       out response);
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
