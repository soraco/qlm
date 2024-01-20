# How to get customer information for a license key?

To retrieve customer information associated with a specific activation key:

\[Update the URL and activation key below]

{% tabs %}
{% tab title="C#" %}
{% code overflow="wrap" %}
```csharp
 IQlmCustomerInfo ci =  license.GetCustomerInfo("
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx
", "AJGI0-C0N00-B9SJ6-A86HD-1P1WE4");
```
{% endcode %}
{% endtab %}

{% tab title="C++" %}
{% code overflow="wrap" %}
```cpp
 IQlmCustomerInfoPtr ci = license->GetCustomerInfo (_bstr_t("
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx
"), _bstr_t("AJGI0-C0N00-B9SJ6-A86HD-1P1WE4"));
```
{% endcode %}
{% endtab %}
{% endtabs %}

