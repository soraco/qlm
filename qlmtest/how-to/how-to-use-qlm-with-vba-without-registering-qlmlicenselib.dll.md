# How to use QLM with VBA without registering QlmLicenseLib.dll

As of QLM 8.2, you can now use the QLM binaries without the need to register the QLM DLL using regasm.exe

This has the benefit of simplifying the deployment of your VBA application and avoid issues with the user permissions required to run regasm.exe.

This applies to Excel, Access, VB6 and any other VBA based application.

**Note:** if you are new to QLM and are starting with QLM v10+, you can ignore this article. The steps described below are an integral part of the product as of QLM 10. This article is intended for customers who are using QLM v9 or earlier.

To use QLM without registration, follow the steps below.

**For .NET 2.0:**

1. In your VBA project, add a reference to: C:\windows\Microsoft.NET\Framework\v2.0.50727\mscorlib.tlb
2. Add another reference to: C:\windows\Microsoft.NET\Framework\v2.0.50727\mscoree.tlb
3. Add a reference to: QlmLicenseLib.tlb (this is optional - we recommend you add the reference during development to benefit from intellisense)

&#x20;**For .NET 4.0:**

1. In your VBA project, add a reference to: C:\windows\Microsoft.NET\Framework\v4.0.30319\mscorlib.tlb
2. Add another reference to: 'C:\windows\Microsoft.NET\Framework\v4.0.30319\mscoree.tlb
3. Add a reference to: QlmLicenseLib.tlb (this is optional - we recommend you add the reference during development to benefit from intellisense)

**In your code:**

Instead of instantiating a QlmLicense object, call GetQlmLicense to create an instance of the QlmLicense object.

Example:

&#x20;        Dim lic As IQlmLicense\
&#x20;        Set lic = GetQlmLicense()

&#x20;   or if you want to use late binding:

Dim lic As Object

Set lic = GetQlmLicense ()

&#x20;

The GetQlmLicense function is included in the LicenseValidator class. You can generate the Licensevalidator class from the QLM Management Console / Protect your application tab.

The LicenseValidator class contains an accessor property called LicenseObject that returns the underlying QlmLicense object.

Note that you must deploy the following binaries with your application:

* QlmLicenseLib.dll
* QlmCLRHost\_x64.dll
* QlmCLRHost\_x86.dll
* QlmLicenseLib.tlb (if you want to use early binding).
