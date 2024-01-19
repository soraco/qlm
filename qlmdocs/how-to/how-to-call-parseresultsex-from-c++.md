# How to call ParseResultsEx from C++

ParseResultsEx is a function used to parse most XML return values from the QLM web service.

&#x20;To call ParseResultsEx from C++:

{% code overflow="wrap" %}
```cpp
ILicenseInfoPtr li(__uuidof(LicenseInfo));
CComBSTR bstrMessage;
if (license->ParseResultsEx(_bstr_t(bstrResponse), li, &bstrMessage) == VARIANT_TRUE)
{
  // Access any of the pLicenseInfo properties
}
```
{% endcode %}

