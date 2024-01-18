# How to call ParseResultsEx from C++

ParseResultsEx is a function used to parse most xml return values from the QLM web service.

&#x20;

To call ParseResultsEx from C++:

ILicenseInfoPtr li(\_\_uuidof(LicenseInfo));\
CComBSTR bstrMessage;

if (license->ParseResultsEx(\_bstr\_t(bstrResponse), li, \&bstrMessage) == VARIANT\_TRUE)\
{\
&#x20; // Access any of the pLicenseInfo properties\
}
