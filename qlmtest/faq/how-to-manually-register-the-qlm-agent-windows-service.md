# How to manually register the QLM Agent Windows Service

If the QLM Agent Windows Service fails to install, you can follow the procedure below to register it.

#### Install the QLM Agent Service

* Open a Windows command prompt as Administrator (Run As Administrator)
* Type: C\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe "C:\Program Files\Soraco\QuickLicenseMgr\QlmAgentSvc.exe" /install

If a previous version of the QLM Agent Service was not successfully removed, you can uninstall it as follows:

* Open a Windows command prompt as Administrator (Run As Administrator)
* Type: C\Windows\Microsoft.NET\Framework64\v4.0.30319\InstallUtil.exe "C:\Program Files\Soraco\QuickLicenseMgr\QlmAgentSvc.exe" /uninstall
