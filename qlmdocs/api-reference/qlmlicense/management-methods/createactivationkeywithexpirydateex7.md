# CreateActivationKeyWithExpiryDateEx7

### Description

Creates an activation key on the License Server.

Note that to call this function, you must:

* Enable the Server Property enableCreateActivationKey
* Set the AdminEncryptionKey
* Call [DefineProduct](https://soraco.readme.io/reference/defineproduct)

```c#
void CreateActivationKeyWithExpiryDateEx7(string webServiceUrl, string email, 
                                          int[] features, int numKeysToCreate, 
                                          int numSeats, int numFloatingSeats, 
                                          bool useMultipleActivationsKey, string qlmVersion, 
                                          string vendor, string userData1, 
                                          string affiliateID, DateTime expiryDate, 
                                          int expiryDuration, bool maintenance, 
                                          bool generic, ELicenseModel licenseModel, 
                                          string comment, EOrderStatus orderStatus, 
                                          string productProperties, out string response)
```

### Parameters

\[block:parameters] { "data": { "h-0": "Parameter", "h-1": "Type", "h-2": "Description", "0-0": "webServiceUrl", "0-1": "string", "0-2": "URL to the QLM License Server.", "1-0": "email", "1-1": "string", "1-2": "email address to associate with to the license key - can be empty", "2-0": "features", "2-1": "int\\\[]", "2-2": "4 element array of features. Each element in the array represents a feature set and the value of each element is the OR'ed value of all the enabled features in this feature set. For example: \n \nint\\\[] features = new features\[4]; \n \nfeatures\[0] = 1 + 2 + 4; // In feature set 1, Feature 1, Feature 2 and Feature 4 are enabled \n \nfeatures\[1] = 1 + 4; // In feature set 2, Feature 1 and Feature 4 are enabled \n \nfeatures\[2] = 2 + 4 + 8; // In feature set 3, Feature 2, Feature 4 and Feature 8 are enabled \n \nfeatures\[3] = 0; // In feature set 4, no features are enabled", "3-0": "numKeysToCreate", "3-1": "int", "3-2": "the number of licenses to create. Use this option to create large batches of license keys.", "4-0": "numSeats", "4-1": "int", "4-2": "the number of licenses to embed in the key. This controls how many activations are allowed per key.", "5-0": "numFloatingSeats", "5-1": "int", "5-2": "the number of floating seats for concurrent licensing (requires QLM Enterprise).", "6-0": "useMultipleActivationsKey", "6-1": "bool", "6-2": "if set to true and quantity > 1, one license key will be generated for all required licenses. The number of licenses will be embedded in the license key", "7-0": "qlmVersion", "7-1": "string", "7-2": "version of the QLM Engine", "8-0": "vendor", "8-1": "string", "8-2": "eCommerce vendor to use when generating the key", "9-0": "userData1", "9-1": "string", "9-2": "user data to associate with the license key", "10-0": "affiliateID", "10-1": "string", "10-2": "ID of affiliate", "11-0": "expiryDate", "11-1": "DateTime", "11-2": "expiry date of the key. Set this value to DateTime.MinValue to not set an expiry date.", "12-0": "expiryDuration", "12-1": "int", "12-2": "Expiry duration of the key. Set this value to -1 to not set an expiry duration.", "13-0": "maintenance", "13-1": "bool", "13-2": "set to true to enable the maintenance plan for this license", "14-0": "generic", "14-1": "bool", "14-2": "set to true to create a generic license key. Generic license keys are designed for enterprise customers who purchase hundreds of licenses and do not want to have to activate licenses on every single computer. They activate a single license and get back a Generic Computer Key. Then on every other computer in the organization, they use the Generic Computer Key (not recommended).", "15-0": "licenseModel", "15-1": "[ELicenseModel](https://soraco.readme.io/reference/elicensemodel)", "15-2": "set the one of the allowed values: permanent \\| trial \\| subscription", "16-0": "comment", "16-1": "string", "16-2": "comment to be added to the license record", "17-0": "orderStatus", "17-1": "[EOrderStatus](https://soraco.readme.io/reference/eorderstatus)", "17-2": "set the order status of the license to one of the allowed values: EInProgress | EComplete | EUpgraded | EReleased", "18-0": "productProperties", "18-1": "string", "18-2": "XML string representing the product properties to set. The XML string can be created by calling IQlmProductProperties.Serialize.", "19-0": "response", "19-1": "string", "19-2": "XML fragment containing the result of the call." }, "cols": 3, "rows": 20, "align": \[ "left", "center", "left" ] } \[/block]

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
