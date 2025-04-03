# How to register QlmLicenseLib.dll for non .NET applications running on Windows

To use QLM with non .NET applications running on Windows, you must register the QlmLicenseLib.dll using regasm as described below:

*   **Generate a type library to be referenced by your code**

    C:\Windows\Microsoft.NET\Framework64\v4.0.30319\regasm.exe /tlb "\<path>\QlmLicenseLib.dll"
*   **Register the QlmLicenseLib.dll as a COM object**

    C:\Windows\Microsoft.NET\Framework64\v4.0.30319\regasm.exe /codebase "\<path>\QlmLicenseLib.dll"

The variable \<path> above should be set to the location where you are deploying the QlmLicenseLib.dll file.

A register.bat file is attached to this article. In this batch file, update the "dllPath" variable to point to the location of the QlmLicenseLib.dll.

When running the batch file or executing regasm.exe directly from the Command Prompt, you muse make sure to execute these commands as Administrator. To do so:&#x20;

\* Click Start / All Programs / Accessories

\* Right mouse click "Command Prompt" and select Run As Administrator

\* Execute the batch file above

Note that the regasm utility comes in 2 versions: a 32 bit version and a 64 bit version. If you have a 64 bit application, you should register the QLM DLLs using the 64 bit version of regasm. If you have a 32 bit application, you should register the QLM DLLs with the 32 bit version of regasm.

The 32 bit version of regasm is located in this folder: %windir%\Microsoft.NET\Framework

The 64 bit version of regasm is located in this folder: %windir%\Microsoft.NET\Framework64

* [register.bat](https://support.soraco.co/hc/en-us/article_attachments/360015046532)740 Bytes [Download](https://support.soraco.co/hc/en-us/article_attachments/360015046532)
