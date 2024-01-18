# How to call AddUser from C++

Here's an example for calling AddUser from C++:

IQlmLicensePtr qlmLicense (\_\_uuidof(QlmLicense));

qlmLicense->put\_CommunicationEncryptionKey(\_bstr\_t("{B6163D99-F46A-4580-BB42-BF276A507A14}"));

CComBSTR bstrResponse;\
qlmLicense->AddUser (\
\_bstr\_t(m\_qlmweburl),\
\_bstr\_t("Jonathan Smith"),\
\_bstr\_t ("jsmith@hotmail.com"),\
\_bstr\_t ("514-876-1234"),\
\_bstr\_t ("514-876-1235"),\
\_bstr\_t ("514-876-1236"),\
\_bstr\_t ("Interactive Studios"),\
\_bstr\_t ("123 Interactive Road"),\
\_bstr\_t ("Suite 123"),\
\_bstr\_t ("Montreal"),\
\_bstr\_t ("Quebec"),\
\_bstr\_t ("H1K2P3"),\
\_bstr\_t ("canada"),\
\_bstr\_t (""),\
\_bstr\_t ("no comments"),\
TRUE,\
\&bstrResponse );

m\_strResults = CString (bstrResponse);

ILicenseInfoPtr li (\_\_uuidof(LicenseInfo));\
CComBSTR bstrMessage;

if (qlmLicense->ParseResultsEx (\_bstr\_t(bstrResponse), li, \&bstrMessage) == VARIANT\_TRUE)\
{\
&#x20; // Display the bstrMessage to the end user for confirmation that the \
}
