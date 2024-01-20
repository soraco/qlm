# How to check if features were updated on the server

\[This article is now obsolete - as of QLM v12, the new LicenseValidator class automatically detects if features changed on the server and reactivate the key if needed]

You can automatically check if features were updated on the server, and force a reactivation of the key to apply the new features on the client.

Assuming you are using the LicenseValidator class, after calling ValidateLicenseAtStartup successfully, add the function below to your code and call the UpdateLicense method.

{% code overflow="wrap" %}
```csharp
private void UpdateLicense()
{
    // Assuming lv is an instance of the LicenseValidator class:
    string dataSet;
    string response;
    QlmLicenseLib.ILicenseInfo licenseInfo;
    licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, lv.ActivationKey, false, out                                 dataSet, out response);
    if (licenseInfo != null)
    {
        string serverFeatures = licenseInfo.Features;
        string localFeatures = lv.QlmLicenseObject.GetFeaturesAsString();
        if (serverFeatures != localFeatures)
        {
            //Reactivate the key
            lv.ReactivateKey(Environment.MachineName);
        }
    }
}
```
{% endcode %}

