# How to get the latest enabled features from the server

The code below illustrates how to retrieve the latest features from the server and check if a specific feature is enabled.

```
// Feature IDs of each feature as per the Define Products tab in QLM
private const int FEATURE_STD = 1 << 0; 
private const int FEATURE_PRO = 1 << 1;
private const int FEATURE_ENT = 1 << 2;

private void GetLatestFeatures()
{
 // Assuming lv is an instance of the LicenseValidator class:

string dataSet;
string response;
QlmLicenseLib.ILicenseInfo licenseInfo;

licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, lv.ActivationKey, false, out dataSet, out response);

if (licenseInfo != null)
{
 if (!String.IsNullOrEmpty(licenseInfo.Features))
 {
   int[] features = lv.QlmLicenseObject.ConvertFeaturesToArray(licenseInfo.Features);

  // Check if feature set 1, feature ID 1 is enabled
  if ((features[0] & FEATURE_STD) == FEATURE_STD)
  {
      // the feature is enabled
   }
  }
 }
}
```
