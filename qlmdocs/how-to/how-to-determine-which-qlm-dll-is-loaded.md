# How to determine which QLM DLL is loaded

To determine which QLM DLLs are being loaded by your application at runtime, use the following procedure:

* Download ProcessExplorer from: https://technet.microsoft.com/en-us/sysinternals/processexplorer.aspx
* In ProcessExplorer, locate your application and select it
* Click View and select "Show Lower Pane"
* Click View and select "Lower Pane View" / DLLs
* Now in the lower pane view, locate IsLicense50.dll
* Right mouse click over IsLicense50.dll and select Properties
* This should give you the path from where IsLicense50.dll is being loaded.

You can repeat the same procedure for QlmLicenseLib.dll.
