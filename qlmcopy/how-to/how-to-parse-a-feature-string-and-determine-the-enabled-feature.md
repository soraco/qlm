# How to parse a feature string and determine the enabled feature

The most common way of determining if a feature is enabled is by calling the [QlmLicense.IsFeatureEnabledEx](https://support.soraco.co/hc/en-us/articles/207296836-QlmLicense-IsFeatureEnabled) API.&#x20;

However, if you have retrieved the feature value from the server's DB as a string, you can use the code below to parse the feature string and determine if a specific feature is enabled.

### Example in C#:

```
private bool IsFeatureEnabled (string featureString, int featureSet, int featureID)
{
 bool ret = false;
 // lv is an instance of the LicenseValidator class
 int[] features = lv.QlmLicenseObject.ConvertFeaturesToArray(featureString);

 int feature = features[featureSet];
 if ((feature & featureID) == featureID)
 {
     ret = true;
 }

 return ret;
}
```

### &#x20;Example in VC++:

```
bool QlmLicenseWizardDlg::IsFeatureEnabled(CString featureString, int featureSet, 
                                           int featureID)
{
 // lv is an instance of the LicenseValidator class
 SAFEARRAY* saFeatures = m_lv->license->ConvertFeaturesToArray(_bstr_t(featureString));
 int* pFeatures;
 bool ret = false;

 HRESULT hr = SafeArrayAccessData(saFeatures, (void**)& pFeatures); // direct access to SA memory
 if (SUCCEEDED(hr))
 {
     int feature = pFeatures[featureSet];
     if (feature && featureID)
     {
         ret = true;
     }
     SafeArrayUnaccessData(saFeatures);
 }
 SafeArrayDestroy(saFeatures);

 return ret;
}
```
