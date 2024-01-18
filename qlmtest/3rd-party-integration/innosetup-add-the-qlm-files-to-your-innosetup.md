# InnoSetup - Add the QLM files to your InnoSetup

**For .NET 4.0 apps**

\[Files]\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.dll"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmControls.dll"; DestDir: "{app}"\


**For .NET 2.0 apps**

\[Files]\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLib.dll"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmControls.dll"; DestDir: "{app}"

**For VBA, MS-Access, and Excel apps with .NET 4.0**

\[Files]

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseWizard.exe"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.dll"; DestDir: "{app}"

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x64.dll"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmCLRHost\_x86.dll"; DestDir: "{app}"

**For VBA, MS-Access, and Excel apps with .NET 2.0**

\[Files]

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseWizard.exe"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmLicenseLib.dll"; DestDir: "{app}"

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmCLRHost\_x64.dll"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 2.0\QlmCLRHost\_x86.dll"; DestDir: "{app}"

**For Xojo Apps**

\[Files]

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseWizard.exe"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.dll"; DestDir: "{app}"

Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\Xojo\QlmWrapper.dll"; DestDir: "{app}"\
Source: "C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\Xojo\QlmWrapper.tlb"; DestDir: "{app}"

\[Setup]\
PrivilegesRequired=admin

\[Run]

Filename: {param:Path|{app\}}\register.bat
