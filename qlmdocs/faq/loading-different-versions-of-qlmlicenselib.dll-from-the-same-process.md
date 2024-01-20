# Loading different versions of QlmLicenseLib.dll from the same process

If you need to load different versions of QlmLicenseLib.dll from the same process, you must create a .config file for the process and specify the location of each version of QlmLicenseLib.dll.

The typical use case is a plugin for a 3d party application. Since different plugin developers might use different versions of QLM, the application might need to load different versions of QLM.

To do so, you must ensure that each version of QlmLicenseLib.dll is located in a separate directory and **that no version of QlmLicenseLib.dll is located in the same folder as the executable**. Then, you must create or update the config file of the application's executable. The filename of the config file is the name of the executable suffixed with .config. For example, if the executable is called Act.exe, the config file would be called Act.exe.config.

Edit the config file and add or update the runtime section, by specifying the location of each version of QlmLicenseLib.dll as shown in the example below.

```xml
<?xml version="1.0" encoding="utf-8"?>
<configuration>
<startup> 
   <supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.5.2"/>
</startup>
<runtime>
    <assemblyBinding xmlns="urn:schemas-microsoft-com:asm.v1">
       <dependentAssembly>
         <assemblyIdentity name="QlmLicenseLib" publicKeyToken="9c65e32c060523a1" culture="neutral" />
         <codeBase version="10.0.17195.5" href="v10\QlmLicenseLib.dll" />
         <codeBase version="15.0.21207.1" href="v15\QlmLicenseLib.dll" />
       </dependentAssembly>
    </assemblyBinding>
</runtime>
</configuration>
```
