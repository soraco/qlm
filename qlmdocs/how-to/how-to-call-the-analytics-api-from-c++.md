# How to call the Analytics API from C++

Here's a quick example of how to call the Analytics API from C++:

{% code overflow="wrap" %}
```cpp
 LicenseValidator  *m_lv = new LicenseValidator ();
 
// Add the install (replace the hard code values with the values of your choice)
CComBSTR bstrInstallID;

m_lv->analytics->AddInstall(_bstr_t("1.0.0.0"), _bstr_t("2.0.0.0"), _bstr_t("MYPC"), _bstr_t("MYPC"),
_bstr_t(activationKey), _bstr_t(computerKey), VARIANT_FALSE,
_bstr_t("MY_PRODUCT"), 1, 0, &bstrInstallID);
 
// Record the returned bstrInstallID in the registry or in your application's configuration file
 
// When your application is uninstalled, call RemoveInstall
CComBSTR bstrErrorMessage;
m_lv->analytics->RemoveInstall(_bstr_t(bstrInstallID), &bstrErrorMessage);
```
{% endcode %}

