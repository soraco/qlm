# How to call AddUser from C++

Here's an example for calling AddUser from C++:

{% code overflow="wrap" %}
```cpp
IQlmLicensePtr qlmLicense (__uuidof(QlmLicense));
qlmLicense->put_CommunicationEncryptionKey(_bstr_t("{B6163D99-F46A-4580-BB42-BF276A507A14}"));

CComBSTR bstrResponse;

qlmLicense->AddUser (
_bstr_t(m_qlmweburl),
_bstr_t("Jonathan Smith"),
_bstr_t ("jsmith@hotmail.com"),
_bstr_t ("514-876-1234"),
_bstr_t ("514-876-1235"),
_bstr_t ("514-876-1236"),
_bstr_t ("Interactive Studios"),
_bstr_t ("123 Interactive Road"),
_bstr_t ("Suite 123"),
_bstr_t ("Montreal"),
_bstr_t ("Quebec"),
_bstr_t ("H1K2P3"),
_bstr_t ("canada"),
_bstr_t (""),
_bstr_t ("no comments"),
TRUE,
&bstrResponse );

m_strResults = CString (bstrResponse);
ILicenseInfoPtr li (__uuidof(LicenseInfo));
CComBSTR bstrMessage;

if (qlmLicense->ParseResultsEx (_bstr_t(bstrResponse), li, &bstrMessage) == VARIANT_TRUE)
{
  // Display the bstrMessage to the end user for confirmation that the 
}
```
{% endcode %}

