# An attempt was made to load a program with an incorrect form

Error 1: If you get the following error when calling the QLM API:

> An attempt was made to load a program with an incorrect format.

\
\
The issue is that you are using the wrong version of IsLicenseX0.dll on your system.\
\
IsLicenseX0.dll is a C++ DLL. If you are targeting a 64 bit platform, you need to ship with your application the 64 bit version of this DLL. The 64 bit version of the DLL is found in the redistrib\x64 folder. As of QLM 5.2.0.5, you can create place the 64 bit version of the DLL in a folder called x64 and the 32 bit version in a folder called x86. The QlmLicenseLib.dll will automatically load the proper version.\
\
Note that the QlmLicenseLib.dll and QlmControls.dll are .NET assemblies. The same version of these DLLs works on 32bit or 64 bit platforms.\
\
If your application is intended to run as 32 bit application on a x64 bit operating system, then you need to use the 32 bit version of IsLicenseX0.dll. If you are using the provided merge modules to integrate QLM into your setup, you should use the IsLicense\_x86.msm or IsLicense\_x86.com.msm. These merge modules install the 32 bit version of the IsLicenseX0.dll regardless of the target platform.\
\
Error 2: If you get the following error when clicking on the Test button to validate the QLM web service:

> \*\*\*\* Failed to call QLM DLL. Error: An attempt was made to load a\
> program with an incorrect format. (Exception from HRESULT: 0x8007000B).

\
\
The issue is that you are using the wrong version of IsLicenseX0.dll on your system.\
\
IsLicenseX0.dll is a C++ DLL. If your web server is a 64 bit server, and your virtual directory is configured to run in x64 bit mode, you need to include the 64 bit version of this DLL in the bin folder of the web service. The 64 bit version of the DLL is found in the redistrib\x64 folder.

Note that for web applications, as of QLM 5.2.0.6, you just need to include the QlmLicenseLib.dll located in the Redistrib\\.net 2.0\QlmLicenseLibEmb folder. This DLL contains an embedded IsLicenseX0.dll (for x86 and x64). You no longer need to explicitly include the IsLicenseX0.dll.\
\
Note that the QlmLicenseLib.dll and QlmControls.dll are .NET assemblies. The same version of these DLLs works on 32bit or 64 bit platforms.
