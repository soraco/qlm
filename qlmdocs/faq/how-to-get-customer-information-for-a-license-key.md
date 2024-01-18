# How to get customer information for a license key?

To retrieve customer information associated to a specific activation key:

\[Update the URL and activation key below]

**In C#:**

&#x20;IQlmCustomerInfo ci =  license.GetCustomerInfo("[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)", "AJGI0-C0N00-B9SJ6-A86HD-1P1WE4");

**In C++:**

&#x20;IQlmCustomerInfoPtr ci = license->GetCustomerInfo (\_bstr\_t("[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)"), \_bstr\_t("AJGI0-C0N00-B9SJ6-A86HD-1P1WE4"));
