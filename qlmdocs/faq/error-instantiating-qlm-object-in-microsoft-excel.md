# Error instantiating QLM object in Microsoft Excel

If you are using QML with Microsoft Excel, you may get an error instantiating the QLM object in Excel.

As described in the help, to use QLM from Excel, you must register the QlmLicenseLib.dll using regasm as described below:

&#x20;

*   **Generate a type library to be refrenced by your code**

    regasm /tlb "\QlmLicenseLib.dll"
*   **Register the QlmLicenseLib.dll as a COM object**

    regasm /codebase "\QlmLicenseLib.dll"

&#x20;

&#x20;A register.bat file is included in the samples folder. You can just execute this file to register the DLLs.

&#x20;

Note that the regasm utility comes in 2 versions: a 32 bit version and a 64 bit version. If you are using a 64 bit version of Excel, you should register the QLM DLLs using the 64 bit version of regasm. If you are using the 32 bit version of Excel, you should register the QLM DLLs with the 32 bit version of regasm.

The 32 bit version of regasm is located in this folder: %windir%\Microsoft.NET\Framework

The 64 bit version of regasm is located in this folder: %windir%\Microsoft.NET\Framework64

&#x20;

Additionally, Excel can get confused about which version of the .NET Framework to load if you have more than one version installed. If this happens you will get an automation error when you try to instantiate .NET objects at runtime from Excel. The .NET types will appear correctly in the Excel object browser.

The workaround for this is to tell Excel explicitly that the version of the .NET Framework that you are using is supported. To do this create a text file called Excel.exe.config and put it in the same directory as Excel.exe itself. The file should contain the text below (with the version number replaced with the .NET Framework version you are using):

```
xmlversion="1.0"?>
<configuration>
  <startup>
    <supportedRuntimeversion="v2.0.50727"/>
  startup> configuration>  
```
