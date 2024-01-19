# DeleteUser

### Description

Deletes a customer from the License Server.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool DeleteUser (string webServiceUrl, string email, out string response)
```

### Parameters

| Parameter     |  Type  | Description                                     |
| ------------- | :----: | ----------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                  |
| email         | string | email address of the customer to delete         |
| response      | string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>User abc@test.com has been deleted.</result>
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
