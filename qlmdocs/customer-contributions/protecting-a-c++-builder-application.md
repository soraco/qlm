# Protecting a C++ Builder application

| <p>I attach my adaptation of vc10 sample project, for protecting a C++Builder application. Details follow.</p><p><br><strong>Development</strong></p><p>You also need to run command prompt with elevated privileges and do (I use .NET 2.0, but you can use .NET 4.0 if you have the DLL for such framework)<br>- C:\Windows\Microsoft.NET\Framework\v2.0.50727\regasm /tlb "C:\...etc...\TestQlmWizard\Win32\Debug\license\QlmLicenseLib.dll"<br></p><p>- C:\Windows\Microsoft.NET\Framework\v2.0.50727\regasm /codebase "C:\...etc...\TestQlmWizard\Win32\Debug\license\QlmLicenseLib.dll"</p><p>Then in C++Builder do (this creates COM wrapper units, in my attached project they are already there, but it could be better to generate them in your workstation):</p><p>        Component > Import component... > Import a Type Library > select QlmLicenseLib<br>        Unit Dir Name = &#x3C;my project folder> and uncheck "Generate Component Wrappers"<br>        "Add unit to TestQlmWizard.cbproj project" > Finish</p><p>Create configuration files (.lw.xml and .lw.ui.xml) for QlmLicenseWizard.exe, with "Protect your application" in QLM program (they are already there in my attachment but you have to generate yours).</p><p><strong>Distribution</strong></p><p><br>- inside the executable folder create a folder named "license" (as you can see in my attached project), in which you have to insert<br>    (depending on .NET version on the target machine (2.0 or 4.0))<br>        - either .net 2.0/QlmLicenseLib.dll or .net 4.0/QlmLicenseLib.Net4.dll (rename it QlmLicenseLib.dll to make it coherent)<br>        - either .net 2.0/QlmLicenseWizard.exe or .net 4.0/QlmLicenseWizard.exe<br>        if none of these .NET versions is present prompt the user for installing one of them<br>    - x86\IsLicense50.dll<br>    - x64\IsLicense50.dll<br>    - configuration files for QlmLicenseWizard.exe, created with "Protect your application" in QLM program:<br>        - My application 1.2.lw.xml<br>        - My application 1.2.lw.ui.xml<br>- depending on .NET version on the target machine (2.0 or 4.0) register the DLL running either C:\Windows\Microsoft.NET\Framework\v2.0.50727\regasm /codebase QlmLicenseLib.dll or C:\Windows\Microsoft.NET\Framework\v4.0.30319\regasm /codebase QlmLicenseLib.dll<br>- configure LicenseValidator constants correctly for your application</p> |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |

[TestQlmWizard.zip](https://support.soraco.co/hc/en-us/article\_attachments/200551964)