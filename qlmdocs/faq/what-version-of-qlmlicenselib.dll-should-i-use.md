# What version of QlmLicenseLib.dll should I use?

_\[this article applies to QLM v8 and earlier]_

QlmLicenseLib.dll is a .NET  assembly.

QlmLicenseLib.dll depends on IsLicense50.dll which is an unmanaged C++ DLL. IsLicense50.dll exists in 2 versions: 32 bit and 64 bit.

QlmLicenseLib.dll exists in 2 versions:

1. The regular QlmLicenseLib.dll located in C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0 (or .net 4.0)
2. A QlmLicenseLib.dll that has the IsLicense50.dll embedded in it. This file is located in C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLibEmb.

When using (1), you need to ship along with QlmLicenseLib.dll, the 2 versions of IsLicense50.dll (32 bit and 64 bit). In the same folder where the QlmLicenseLib.dll exists, create 2 folders: x86 and x64. Install the appropriate version of IsLicense50.dll in the corresponding folder.

When using (2), the 2 versions of IsLicense50.dll are embedded and you only need to include a single file, i.e. QlmLicenseLib.dll. The requirement is that the folder where you install QlmLicenseLib.dll be writable by the user since at runtime, the proper version of IsLicense50.dll will be extracted and copied to the same folder as QlmLicenseLib.dll.

_Note that if your application is a 32 bit application, then you should always use the 32 bit version of IsLicense50.dll._
