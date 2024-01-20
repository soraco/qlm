# How to create an Activation Key with Product Properties

The code below illustrates how to create an activation key with product properties.

{% code overflow="wrap" %}
```csharp
private void CreateActivationKey ()
{
 QlmProductProperties pps = new QlmProductProperties();

 // The arguments to AddProductProperty must be an exact match with the Product Properties defined in the 
 // Define Products tab in the QLM Management console. More specifically, the following arguments must match:
 // GUID, Category, Name, Type
 
 IQlmProductProperty pp = pps.AddProductProperty("{22a8d53a-2b51-4502-9f85-193b5f743b3b}", "category1", "property1", "string", "", "John");
 string ppsXml = pps.Serialize();

 string response;
 lv.QlmLicenseObject.CreateActivationKeyWithExpiryDateEx7(string.Empty, "john@soraco.co", null, 1, 1, 0, true, "5.0.00", string.Empty, string.Empty, string.Empty, DateTime.MinValue, -1, true, false, ELicenseModel.permanent, string.Empty, EOrderStatus.ENone,
 ppsXml, out response);

 ILicenseInfo licenseInfo = new LicenseInfo();
 string message = string.Empty;
 if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref message))
 {
    // Success
 }
 else
 {
    // Failure
 }
}
```
{% endcode %}
