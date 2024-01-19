# CreateActivationKeyWithExpiryDateEx2

### Description

Creates an activation key on the License Server.

Note that to call this function, you must:

* Enable the Server Property enableCreateActivationKey
* Set the AdminEncryptionKey
* Call [DefineProduct](../client-side-methods/defineproduct.md)

```csharp
void CreateActivationKeyWithExpiryDateEx2(string webServiceUrl, string email, 
                                          string features, int numSeats, 
                                          bool useMultipleActivationsKey, string qlmVersion, 
                                          string vendor, string userData1, 
                                          string affiliateID, DateTime expiryDate, 
                                          int expiryDuration, out string response)
```

### Parameters

| Parameter                 |   Type   | Description                                                                                                                                                                                                                                              |
| ------------------------- | :------: | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl             |  string  | URL to the QLM License Server.                                                                                                                                                                                                                           |
| email                     |  string  | email address to associate with to the license key - can be empty                                                                                                                                                                                        |
| features                  |  string  | Semi comma separated list of feature sets and their corresponding enabled features. Example: 0:1;1:2;2:3;3:6 - enables feature 1 in feature set 0, feature 2 in feature set 1, feature 1+2 (3) in feature set 4 and features 1+2+3 (6) in feature set 3. |
| numSeats                  |    int   | the number of licenses to embed in the key                                                                                                                                                                                                               |
| useMultipleActivationsKey |   bool   | if set to true and quantity > 1, one license key will be generated for all required licenses. The number of licenses will be embedded in the license key                                                                                                 |
| qlmVersion                |  string  | version of the QLM Engine                                                                                                                                                                                                                                |
| vendor                    |  string  | eCommerce vendor to use when generating the key                                                                                                                                                                                                          |
| userData1                 |  string  | user data to associate with the license key                                                                                                                                                                                                              |
| affiliateID               |  string  | ID of affiliate                                                                                                                                                                                                                                          |
| expiryDate                | DateTime | expiry date of the key. Set this value to DateTime.MinValue to not set an expiry date.                                                                                                                                                                   |
| expiryDuration            |    int   | Expiry duration of the key. Set this value to -1 to not set an expiry duration.                                                                                                                                                                          |
| response                  |  string  | XML fragment containing the result of the call.                                                                                                                                                                                                          |

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
