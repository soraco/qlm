# Error calling any QLM API

If you get an error calling any QLM API such as DefineProduct, or if you get an error when calling an API that contacts the QLM Web Service saying "Could not find product: 0 0.0", the most likely reason for these errors is missing DLLs.

The following DLLs are required to be in your binary folder for QLM to work properly:

* QlmLicenseLib.dll
* x86\IsLicense50.dll
* x64\IsLicense50.dll

&#x20;

For details on where to install these DLLs and which versions of these DLLs to install, refer to this [article](https://support.soraco.co/hc/en-us/articles/200857310-What-version-of-QlmLicenseLib-dll-should-I-use-).
