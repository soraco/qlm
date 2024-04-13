# Which QLM DLLs do I need to distribute with my application

The table below describes which QLM DLLs should be distributed with your application. In the target folder column, \<application> is the folder where your application's binary is installed.

Notes:&#x20;

* We no longer recommend using the .NET 2.0 binaries since .NET 4.0 has become the most common version of the .NET Framework on end-user systems.
* The .NET 6/7/8 binaries should only be used if you are building a .NET 6/7/8 application. Do NOT use .NET 6 for non .NET applications like VBA, Delphi, C++, etc.
* NuGet packages are available online.

***

.NET 4 App

| Files to distribute                                                                             | Target Folder  |
| ----------------------------------------------------------------------------------------------- | -------------- |
| redistrib\net4.0\QlmLicenseLib.dll                                                              | \<application> |
| <p>redistrib\net4.0\QlmControls.dll </p><p>(required if you are using the QLM .NET Control)</p> | \<application> |
| redistrib\net4.0\QlmLicenseWizard.exe (required if you are using the QLM License Wizard)        | \<application> |

***

ASP.NET 4 App

| Files to distribute                | Target Folder                     |
| ---------------------------------- | --------------------------------- |
| redistrib\net4.0\QlmLicenseLib.dll | <p>&#x3C;application></p><p> </p> |

***

.NET 6/7/8 App

| Files to distribute                                          | Target Folder  |
| ------------------------------------------------------------ | -------------- |
| redistrib\netx.0-windows\QlmLicenseLib.dll                   | \<application> |
| redistrib\netx.0-windows\QlmLicenseWizard.exe                | \<application> |
| redistrib\netx.0-windows\QlmLicenseWizard.dll                | \<application> |
| redistrib\netx.0-windows\QlmLicenseWizard.deps.json          | \<application> |
| redistrib\netx.0-windows\QlmLicenseWizard.runtimeconfig.json | \<application> |
| redistrib\netx.0-windows\runtimes\\\*                        | \<application> |

***

ASP.NET 6/7/8 App

| **Files to distribute**            | **Target Folder**                 |
| ---------------------------------- | --------------------------------- |
| redistrib\netx.0\QlmLicenseLib.dll | <p>&#x3C;application></p><p> </p> |

***

.NET Core App

***

| Files to distribute                 | Target Folder                     |
| ----------------------------------- | --------------------------------- |
| redistrib\netcore\QlmLicenseLib.dll | <p>&#x3C;application></p><p> </p> |

***

.NET Std App

***

| Files to distribute                | Target Folder                     |
| ---------------------------------- | --------------------------------- |
| redistrib\netstd\QlmLicenseLib.dll | <p>&#x3C;application></p><p> </p> |

***

Excel, MS-Access, VB6, VBA

***

<table><thead><tr><th width="374">Files to distribute</th><th>Target Folder</th></tr></thead><tbody><tr><td>redistrib\net4.0\QlmLicenseLib.dll</td><td><p>&#x3C;application></p><p> </p></td></tr><tr><td><p>redistrib\net4.0\QlmCLRHost_x64.dll</p><p>(required if not using DLL registration)</p></td><td>&#x3C;application></td></tr><tr><td><p>redistrib\net4.0\QlmCLRHost_x86.dll</p><p>(required if not using DLL registration)</p></td><td>&#x3C;application></td></tr><tr><td><p>redistrib\net4.0\QlmLicenseWizard.exe </p><p>(required if you are using the QLM License Wizard)</p></td><td>&#x3C;application></td></tr></tbody></table>

***

Office Add-ins

| Files to distribute                                                                      | Target Folder                     |
| ---------------------------------------------------------------------------------------- | --------------------------------- |
| redistrib\net4.0\QlmLicenseLib.dll                                                       | <p>&#x3C;application></p><p> </p> |
| redistrib\net4.0\QlmLicenseWizard.exe (required if you are using the QLM License Wizard) | \<application>                    |

***

C++

| Files to distribute                                                                                    | Target Folder  |
| ------------------------------------------------------------------------------------------------------ | -------------- |
| redistrib\net4.0\QlmLicenseLib.dll                                                                     | \<application> |
| redistrib\net4.0\QlmLicenseLib.dll.manifest                                                            | \<application> |
| <p>redistrib\net4.0\QlmLicenseWizard.exe </p><p>(required if you are using the QLM License Wizard)</p> | \<application> |

***

Delphi Apps

| Files to distribute                                                                                    | Target Folder                     |
| ------------------------------------------------------------------------------------------------------ | --------------------------------- |
| redistrib\net4.0\QlmLicenseLib.dll                                                                     | <p>&#x3C;application></p><p> </p> |
| <p>redistrib\net4.0\QlmLicenseWizard.exe </p><p>(required if you are using the QLM License Wizard)</p> | \<application>                    |

***

#### **Notes**

#### What is the difference between "QlmLicenseLib.dll" and "QlmLicenseLibNotEmbedded\QlmLicenseLib.dll"

,QlmLicenseLib.dll includes all the  QLM Express, Professional, and Enterprise functionality (excluding user interface components). In addition, QlmLicenseLib.dll acts as a wrapper for IsLicense50.dll which is a C++ DLL that contains our core licensing engine. QlmLicenseLib.dll depends on IsLicense50.dll. IsLicense50.dll comes in 2 versions: one version of 32 bit systems and another version for 64 bit systems. When your application is running as a 64 bit app, we need to load the 64 bit version of IsLicense50.dll and similarly for 32 bit apps. To simplify deployment of the QLM binaries, QlmLicenseLib.dll includes the two versions of the IsLicense50.dll as resources. At runtime, the correct version of IsLicense50.dll is automatically extracted, temporarily stored on disk then loaded from disk. If it cannot be stored on disk due to security limitations, it is loaded directly from memory.

QlmLicenseLibNotEmbedded\QlmLicenseLib.dll is a version of QLmLicenseLib.dll that does not embed IsLicense50.dll. It is included for customers using QLM 7 or earlier versions. Unless advised by our support team, you should not need to use this version if you are using QLM 8 or later.

Finally note that as of QLM 9.2, IsLicense50.dll is no longer required.
