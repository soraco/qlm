# DeleteUserEx

### Description

Deletes a customer, including the user account, from the License Server.

Note that to call this function, you must:

* Set the AdminEncryptionKey

{% code overflow="wrap" %}
```csharp
bool DeleteUserEx (string webServiceUrl, string email, bool deleteUserAccount, out string response)
```
{% endcode %}

### Parameters

| Parameter         |  Type  | Description                                                        |
| ----------------- | :----: | ------------------------------------------------------------------ |
| webServiceUrl     | string | URL to the QLM License Server.                                     |
| email             | string | email address of the customer to delete                            |
| deleteUserAccount |  bool  | flag indicating whether the user account should be deleted as well |
| response          | string | XML fragment containing the result of the call.                    |

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
