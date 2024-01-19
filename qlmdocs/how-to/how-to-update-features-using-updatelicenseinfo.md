# How to update features using UpdateLicenseInfo

In order to update the features of a license, you can call UpdateLicenseInfo as shown below.

_Note that for security reasons, updating a license should never be done from within the application as it requires setting the AdminEncryptionKey in your code._

{% code overflow="wrap" %}
```csharp
// Assuming lv is an instance of the LicenseValidator class
string response;

// Enables the following features: 
// Feature Set: 0, Feature ID: 1
// Feature Set: 0, Feature ID: 2
// Feature Set: 0, Feature ID: 4
// Feature Set: 3, Feature ID: 64
string featuresToEnable = "0:7;3:64"; // 7 is the sum of Feature IDs 1 + 2 + 4

string licenseData = String.Format("<licenseArguments Features=\"'{0}'\"/>", featuresToEnable);

lv.QlmLicenseObject.UpdateLicenseInfo(string.Empty, lv.ActivationKey, licenseData, out response);

// Analyze the results
ILicenseInfo li = new LicenseInfo();
string msg = string.Empty;
if (lv.QlmLicenseObject.ParseResults(response, ref li, ref msg))
{
    // the update was successful
}
else
{
    // the update failed. Display msg to the end user
}
```
{% endcode %}
