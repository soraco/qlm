# How to tighten binding to a virtual machine

When binding a license to a virtual machine, we recommend setting the QlmLicenseBinding to EQlmUniqueSystemIdentifier2. This binding detects if the user is running on a virtual machine and binds the license to the UUID of the virtual machine.

The UUID of a virtual machine is supposed to be unique. When users clone a virtual machine, they are however presented with the option to create a clone with the same UIID as the source virtual machine. This is typically needed when the purpose of the cloning is to move the virtual machine to a new host. In an enterprise environment, having two virtual machines with the same UUID is problematic from a virtual machine management perspective.

The solution presented here is meant to protect against the use case of two VMs using the same UUID.&#x20;

The proposed solution creates a new computer unique identifier (computerID) by combining the UUID of the virtual machine with a QLM-generated unique identifier.

To achieve this, you must set the QlmLicenseBinding to EUserDefined and create the computerID at runtime.

The code below shows how to create a new unique computer identifier.

{% code overflow="wrap" %}
```csharp
 private string GetComputerID ()
 {
     QlmHardware hw = new QlmHardware();
     string computerID = hw.GetUniqueSystemIdentifier2();
                 
     string qlm_uuid = GetUniqueVMIdentifier();

     if (!String.IsNullOrEmpty(qlm_uuid))
     {
         computerID += "::" + qlm_uuid;
     }

     return computerID;     
 }
 private string GetComputerID ()
 {
     QlmHardware hw = new QlmHardware();
     string computerID = hw.GetUniqueSystemIdentifier2();
                 
     string qlm_uuid = GetUniqueVMIdentifier();

     if (!String.IsNullOrEmpty(qlm_uuid))
     {
         computerID += "::" + qlm_uuid;
     }

     return computerID;
     
 }
```
{% endcode %}

The code below shows how to use the LicenseValidator class to use the new computer identifier:

{% code overflow="wrap" %}
```csharp
private void VerifyLicense()
{
    bool needsActivation = false;
    string errorMsg = string.Empty;

    ELicenseBinding licenseBinding = ELicenseBinding.UserDefined;  

    if (lv.ValidateLicenseAtStartup(computerID, ref needsActivation, ref errorMsg) == false)
    {
        int exitCode = DisplayLicenseForm();

        if (exitCode == 4)
        {
            Environment.Exit(0);
        }

        if (lv.ValidateLicenseAtStartup(computerID, ref needsActivation, ref errorMsg) == false)
        {
            Environment.Exit(0);
        }
    }
}

private int DisplayLicenseForm()
{
    string errorMessage;
    if (lv.QlmLicenseObject.ValidateSettingsFile (settingsFile, out errorMessage) == false)
    {
        MessageBox.Show(this, errorMessage, "QLM", MessageBoxButtons.OK, MessageBoxIcon.Error);
        return 0; 
    }

    string args = String.Format("/settings \"{0}\" /computerID \"{1}\"", settingsFile, computerID);
    
    int ret = lv.QlmLicenseObject.LaunchProcess(wizardExe, args, true, true);

    return ret;
}
```
{% endcode %}
