# Which DLLs do you need to distribute with your C++ application

**QLM 9.2 and later:**

* QlmLicenseLib.dll
* QlmLicenseLib.dll.manifest
* QlmLicenseWizard.exe (if you are using it)

**QLM 9.1 and earlier**

If your application is developed in C++, VB6, Office, Delphi, etc., you must include the following DLLs with your application:

* QlmLicenseLib.dll
* x86\IsLicense50.dll
* x64\IsLicense50.dll
* QlmLicenseWizard.exe (if you are using it)&#x20;

The 3 DLLs above should ideally be installed in C:\Program Files\Common Files\Soraco but you may install them in your own folder if you choose to do so.

In addition, you must register the QlmLicenseLib.dll as follows:

regasm.exe /tlb "\<fullpath>\QlmLicenseLib.dll"

regasm.exe /codebase "\<fullpath>\QlmLicenseLib.dll"

A batch file called register.bat can be found in the QLM samples folder (and is attached to this article). Note that Administrative privileges may be required to properly register the DLLs.

**.NET Version**

QLM supports .NET 2.0 and .NET 4.0.  There are 2 versions of the QlmLicenseLib.dll, one for .NET 2.0 and one for .NET 4.0.

We recommend you use the .NET 4.0 version as it has become the standard with Windows 10.

* [register.bat](https://support.soraco.co/hc/en-us/article\_attachments/201493974)510 Bytes [Download](https://support.soraco.co/hc/en-us/article\_attachments/201493974)
