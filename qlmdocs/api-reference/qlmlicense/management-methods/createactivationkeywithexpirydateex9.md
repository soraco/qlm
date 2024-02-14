# CreateActivationKeyWithExpiryDateEx9

### Description

Creates an activation key on the License Server.

Note that to call this function, you must:

* Enable the Server Property enableCreateActivationKey
* Set the AdminEncryptionKey
* Call [DefineProduct](../client-side-methods/defineproduct.md)

{% code overflow="wrap" %}
```csharp
void CreateActivationKeyWithExpiryDateEx9(string webServiceUrl, string email,
                                          int[] features, int numKeysToCreate, 
                                          int numSeats, int numFloatingSeats, 
                                          bool useMultipleActivationsKey, string qlmVersion, 
                                          string vendor, string userData1, 
                                          string affiliateID, DateTime expiryDate, 
                                          int expiryDuration, DateTime maintenancePlanExpiryDate, 
                                          bool generic, ELicenseModel licenseModel, 
                                          string comment, EOrderStatus orderStatus, 
                                          string productProperties, string orderID, 
                                          out string response)
```
{% endcode %}

### Parameters

<table><thead><tr><th width="194">Parameter</th><th width="95.33333333333331">Type</th><th>Description</th></tr></thead><tbody><tr><td>webServiceUrl</td><td>string</td><td>URL to the QLM License Server.</td></tr><tr><td>email</td><td>string</td><td>email address to associate with to the license key - can be empty</td></tr><tr><td>features</td><td>int[]</td><td>4 element array of features. Each element in the array represents a feature set and the value of each element is the OR'ed value of all the enabled features in this feature set. For example:<br><br>int[] features = new features[4];<br><br>features[0] = 1 + 2 + 4; // In feature set 1, Feature 1, Feature 2 and Feature 4 are enabled<br><br>features[1] = 1 + 4; // In feature set 2, Feature 1 and Feature 4 are enabled<br><br>features[2] = 2 + 4 + 8; // In feature set 3, Feature 2, Feature 4 and Feature 8 are enabled<br><br>features[3] = 0; // In feature set 4, no features are enabled</td></tr><tr><td>numKeysToCreate</td><td>int</td><td>the number of licenses to create. Use this option to create large batches of license keys.</td></tr><tr><td>numSeats</td><td>int</td><td>the number of licenses to embed in the key. This controls how many activations are allowed per key.</td></tr><tr><td>numFloatingSeats</td><td>int</td><td>the number of floating seats for concurrent licensing (requires QLM Enterprise).</td></tr><tr><td>useMultipleActivationsKey</td><td>bool</td><td>if set to true and quantity > 1, one license key will be generated for all required licenses. The number of licenses will be embedded in the license key</td></tr><tr><td>qlmVersion</td><td>string</td><td>version of the QLM Engine</td></tr><tr><td>vendor</td><td>string</td><td>eCommerce vendor to use when generating the key</td></tr><tr><td>userData1</td><td>string</td><td>user data to associate with the license key</td></tr><tr><td>affiliateID</td><td>string</td><td>ID of affiliate</td></tr><tr><td>expiryDate</td><td>DateTime</td><td>expiry date of the key. Set this value to DateTime.MinValue to not set an expiry date.</td></tr><tr><td>expiryDuration</td><td>int</td><td>Expiry duration of the key. Set this value to -1 to not set an expiry duration.</td></tr><tr><td>maintenancePlanExpiryDate</td><td>DateTime</td><td>expiry date of the maintenance plan</td></tr><tr><td>generic</td><td>bool</td><td>set to true to create a generic license key. Generic license keys are designed for enterprise customers who purchase hundreds of licenses and do not want to have to activate licenses on every single computer. They activate a single license and get back a Generic Computer Key. Then on every other computer in the organization, they use the Generic Computer Key (not recommended).</td></tr><tr><td>licenseModel</td><td><a href="../enums/elicensemodel.md">ELicenseModel</a></td><td>set the one of the allowed values: permanent | trial | subscription</td></tr><tr><td>comment</td><td>string</td><td>comment to be added to the license record</td></tr><tr><td>orderStatus</td><td><a href="../enums/eorderstatus.md">EOrderStatus</a></td><td>set the order status of the license to one of the allowed values: EInProgress | EComplete | EUpgraded | EReleased</td></tr><tr><td>productProperties</td><td>string</td><td>XML string representing the product properties to set. The XML string can be created by calling IQlmProductProperties.Serialize.</td></tr><tr><td>orderID</td><td>string</td><td>ID of the order</td></tr><tr><td>response</td><td>string</td><td>XML fragment containing the result of the call.</td></tr></tbody></table>

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
