set dllPath=%public%\documents\quick license manager\samples\redistrib\
set regasm=%windir%\Microsoft.NET\Framework\v2.0.50727\regasm.exe
set regasm64=%windir%\Microsoft.NET\Framework64\v2.0.50727\regasm.exe

del "%dllPath%\QlmLicenseLib.tlb"

rem register the DLL for 32 bit
%regasm% /codebase "%dllPath%\QlmLicenseLib.dll"
%regasm% /tlb "%dllPath%\QlmLicenseLib.dll"

rem register the DLL for 64 bit
%regasm64% /codebase "%dllPath%\QlmLicenseLib.dll"
%regasm64% /tlb "%dllPath%\QlmLicenseLib.dll"