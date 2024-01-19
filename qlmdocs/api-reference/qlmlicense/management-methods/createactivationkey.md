# CreateActivationKey

### Description

Creates an activation key on the License Server.

Note that to call this function, you must:

* Enable the Server Property enableCreateActivationKey
* Set the AdminEncryptionKey
* Call [DefineProduct](https://soraco.readme.io/reference/defineproduct)

```csharp
void CreateActivationKey(string webServiceUrl, string email, 
                         int features, int quantity,
                         bool useMultipleActivationsKey, string qlmVersion,
                         string vendor, string userData1,
                         string affiliateID, out string response)
```

### Parameters

| Parameter                 |  Type  | Description                                                                                                                                              |
| ------------------------- | :----: | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl             | string | URL to the QLM License Server.                                                                                                                           |
| email                     | string | email address to associate with to the license key - can be empty                                                                                        |
| features                  |   int  | OR'ed value of the features to enable                                                                                                                    |
| quantity                  |   int  | the number of licenses to embed in the key                                                                                                               |
| useMultipleActivationsKey |  bool  | if set to true and quantity > 1, one license key will be generated for all required licenses. The number of licenses will be embedded in the license key |
| qlmVersion                | string | version of the QLM Engine                                                                                                                                |
| vendor                    | string | eCommerce vendor to use when generating the key                                                                                                          |
| userData1                 | string | user data to associate with the license key                                                                                                              |
| affiliateID               | string | ID of affiliate                                                                                                                                          |
| response                  | string | XML fragment containing the result of the call.                                                                                                          |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<keys>A062E-9D0CC-6DC80-0D6A0-E0701-000A0;A062E-9D0CC-6DC80-0D6A0-E0701-000A0</keys>
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
