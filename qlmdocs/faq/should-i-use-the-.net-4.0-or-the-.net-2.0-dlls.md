# Should I use the .NET 4.0 or the .NET 2.0 DLLs?

QLM provides several sets of .NET DLLs that are located in these folders

C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\netx

QlmControls.dll

QlmLicenseLib.dll

QlmLicenseWizard.exe



The following table shows which version of .NET is preinstalled on Windows and which QLM DLL to use in each case. You can find the full article [here](https://en.wikipedia.org/wiki/.NET\_Framework\_version\_history).

| **.NET Version**                | <p><strong>Included in or</strong></p><p><strong>can be installed on</strong></p>      | **Works with**    |
| ------------------------------- | -------------------------------------------------------------------------------------- | ----------------- |
| .NET 2.0                        | <p>Windows 2003 Server</p><p>Windows  2008 Server</p>                                  |  QLM .NET 2 DLLs  |
| <p> </p><p>.NET 3.0</p><p> </p> | <p>Visa</p><p>Windows 2008 R2</p><p> </p>                                              | QLM .NET 2 DLLs   |
| .NET 3.5                        | <p>Windows 7</p><p>Windows 8, 8.1, 10 (can be installed)</p><p>Windows 2008 R2 SP1</p> | QLM .NET 2 DLLs   |
| .NET 4.52 or higher             | <p> </p><p>Windows 10 (requires latest update)</p><p>Windows Server 2016</p>           | QLM .NET 4.0 DLLs |

&#x20;

For example, if you install your application on a Windows 8.1 operating system, it is preferred to use the QLM .NET 4.0 DLLs. However, you can still use the .NET 2.0 DLLs on Windows 8.1 if you install .NET 2.0 (or 3.0 or 3.5) on the customer's system.
