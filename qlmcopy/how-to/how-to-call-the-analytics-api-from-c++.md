# How to call the Analytics API from C++

Here's a quick example on how to call the Analytics API from C++:

&#x20;LicenseValidator  \*m\_lv = new LicenseValidator ();

// Add the install (replace the hard code values with the values of your choice)

CComBSTR bstrInstallID;\
m\_lv->analytics->AddInstall(\_bstr\_t("1.0.0.0"), \_bstr\_t("2.0.0.0"), \_bstr\_t("MYPC"), \_bstr\_t("MYPC"),\
\_bstr\_t(activationKey), \_bstr\_t(computerKey), VARIANT\_FALSE,\
\_bstr\_t("MY\_PRODUCT"), 1, 0, \&bstrInstallID);

&#x20;

// Record the returned bstrInstallID in the registry or in your application's configuration file

&#x20;

// When your application is uninstalled, call RemoveInstall

CComBSTR bstrErrorMessage;\
m\_lv->analytics->RemoveInstall(\_bstr\_t(bstrInstallID), \&bstrErrorMessage);
