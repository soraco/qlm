# How to protect a .NET Core app with QLM

Note that QLM support for .NET Core is currently in Beta. It will be officially released in Sept 2019 when .NET Core 3 will be released.

Please contact us to request access to the Beta release.

To protect a .NET Core app with QLM:

* Download the QLM .NET Core library (QlmLicenseLibNetCore.dll)
* In your .NET Core project:
  * Add a reference to QlmLicenseLibNetCore.dll
  * Add the following nuget packages:
    * System.Private.ServiceModel
    * System.Security.Cryptography.Xml
    * System.ServiceModel.Http
* From the QLM Management Console, generate a LicenseValidator class (C#)
* Add the LicenseValidator class your .NET Core project
* When your application is loaded, call the LicenseValidator.ValidateLicenseAtStartup function as shown in the code below (this is similar to a regular .NET 4.x project)

```
ELicenseBinding licenseBinding = ELicenseBinding.ComputerName;

if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)
{
    DisplayLicenseForm();

    if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)
    {
        Environment.Exit(0);
    }
}

private int DisplayLicenseForm()
{
    string errorMessage;
    if (lv.QlmLicenseObject.ValidateSettingsFile(settingsFile, out errorMessage) == false)
    {
        MessageBox.Show(this, errorMessage, "QLM", MessageBoxButtons.OK, MessageBoxIcon.Error);
        return 0;
    }

    string args = String.Format("/settings \"{0}\"", settingsFile);

    int ret = lv.QlmLicenseObject.LaunchProcess(wizardExe, args, true, true);

    return ret;
}
```
