# Error 80131700, 8013101b, 80131515 when instantiating a QLM object

If you are protecting an Office application, you may get one of the following errors:

1. Error 0x80131700: "Failed to load the runtime"
2. Error 0x8013101b: "This assembly is built by a runtime newer than the currently loaded runtime and cannot be loaded"
3. Error: 0x80131515: "Could not load file or assembly..."&#x20;

Here are some troubleshooting tips for each error case:&#x20;

&#x20;

<table data-header-hidden><thead><tr><th width="244"></th><th></th></tr></thead><tbody><tr><td><strong>Error</strong></td><td><strong>Description / Tips</strong></td></tr><tr><td>0x80131700</td><td><ul><li>The .NET Framework may not be installed. Install .NET 2.0 or .NET 4.0, either for x86 or x64 depending on whether you are running Office 32 bit or 64 bit.</li><li>The .NET Framework may be corrupted. Reinstall the .NET Framework</li></ul></td></tr><tr><td>0x8013101b</td><td><ul><li>The Excel version you are using has already loaded another version of .NET than the one QLM is referencing. To resolve this issue you must reference the QLM DLL that uses the expected .NET version. For example, if you were referencing the .NET 4.0 version of QlmLicenseLib.tlb, you must reference instead the .NET 2.0 version of QlmLicenseLib.tlb. Additionally, you must include the corresponding QlmLicenseLib.dll in your folder.</li></ul></td></tr><tr><td>0x80131515</td><td><ul><li>This error can occur if the QlmLicenseLib.dll file was blocked by Windows. Windows sometimes blocks files from being opened when they are copied from an untrusted computer. To resolve this issue, simply right-mouse click QlmLicenseLib.dll and view its properties. If the file was blocked, you will see an "Unblock" button on the General tab. Click the Unblock button. Repeat this for all QLM related files.</li></ul></td></tr></tbody></table>
