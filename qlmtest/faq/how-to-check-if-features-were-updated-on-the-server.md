# How to check if features were updated on the server

\[This article is now obsolete - as of QLM v12, the new LicenseValidator class automatically detects if features changed on the server and reactivates the key if needed]

You can automatically check if features were updated on the server, and force a reactivation of the key to apply the new features on the client.

Assuming you are using the LicenseValidator class, after calling ValidateLicenseAtStartup successfully, add the function below to your code and call the UpdateLicense method.

private void UpdateLicense()\
{\
&#x20;   // Assuming lv is an instance of the LicenseValidator class:

&#x20;   string dataSet;\
&#x20;   string response;\
&#x20;   QlmLicenseLib.ILicenseInfo licenseInfo;

&#x20;   licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, lv.ActivationKey, false, out                                 dataSet, out response);

&#x20;   if (licenseInfo != null)

&#x20;   {\
&#x20;       string serverFeatures = licenseInfo.Features;\
&#x20;       string localFeatures = lv.QlmLicenseObject.GetFeaturesAsString();

&#x20;       if (serverFeatures != localFeatures)\
&#x20;       {\
&#x20;           //Reactivate the key\
&#x20;           lv.ReactivateKey(Environment.MachineName);\
&#x20;       }\
&#x20;   }\
}
