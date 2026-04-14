# QLM Agent Service not installed

In some conditions, the QLM setup will fail to install the QLM Agent Service. The procedure below provides a manual procedure to install the QLM Agent service.

* Download the attached PowerShell script
* Open a powershell terminal as Administrator (Run As Administrator)
* Execute the following command (you might need to update the paths if you did not install QLM in the default location):

{% code overflow="wrap" %}
```ps1
.\QlmInstallAgentSvc.ps1 -ServiceName "Quick License Manager Agent" -ExePath "C:\Program Files\Soraco\QuickLicenseMgr\QlmAgentSvc\QlmAgentSvc.exe" -DisplayName "Quick License Manager Agent" -Description "Quick License Manger Agent Service" -StartType Automatic
```
{% endcode %}

{% file src="../.gitbook/assets/QlmInstallAgentSvc (1).ps1" %}
