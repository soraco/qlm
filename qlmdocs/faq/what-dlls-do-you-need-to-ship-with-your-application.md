# What DLLs do you need to ship with your application?

There are several sections in the online help that cover this topic. They are located under:

* _Quick License Manager Express | Distribute your application_
* _Quick License Manager Pro  | Distribute your application_

In a nutshell, there are 2 DLLs that you need to include:

* QlmLicenseLib.dll
* IsLicense50.dll

IsLicense50.dll comes in 2 versions: a 32 bit version and a 64 bit version. There are 3 ways to include IsLicense50.dll with your application:

1. Install the proper version (32 or 64) depending on the architecture of the system where you are installing.IsLicense50.dll needs to be in the same folder as QlmLicenseLib.dll.
2. In the same folder where QlmLicenseLib.dll is located, create a x64 folder and a x86 folder and copy the corresponding IsLicense50.dll to each folder  (this option is only possible as of QLM 5.2).
3. Use the QlmLicenseLib.dll located in redistrib/.net 2.0/QlmLicenseLibEmb. This version of QlmLicenseLib.dll has IsLicense50.dll embedded as a resource. This version is particularly suited to web applications, outlook add-ins, Ms-Excel, and Ms-Access. The requirement for this version is that the folder where QlmLicenseLib.dll is located be "writable" by the user, i.e. the user must have WRITE permissions on this folder. If you are installing a Windows Application under Program Files, this is usually NOT the case (this option is only possible as of QLM 5.2).
