# How to support floating and node locked licences in the same app

**This article applies to QLM v14 and higher.**

All the code described below can be found in the sample located in this folder: _%Public%\Documents\Quick License Manager\Samples\qlmenterprise\DotNet\C#\QlmFloatingAndNodeLockedSample_

The instructions below reference some parts of the code in order to explain the overall process. Please refer to the sample above to add a similar functionality to your own application.

This article will use an XML floating license file but the instructions provided here can be applied to an MS-Access floating license database or a SQL Server floating license database.

#### Product Configuration

In QLM v14, the QLM License Wizard supports new settings that allow your customers to select whether to activate a floating license or a node locked license. In order to enable this functionality, you must set the following properties in the QLM **Protect Your Application** wizard:

| **Property**                           | **Value**                                                                                |
| -------------------------------------- | ---------------------------------------------------------------------------------------- |
| QlmFloatingLicenseCheckBoxDefaultState | True or False. Select whether to default to a floating license or a node locked license. |
| QlmFloatingLicenseCheckBoxVisible      | True                                                                                     |
| QlmShowFloatingLicensePage             | True                                                                                     |

#### &#x20;![](https://support.soraco.co/attachments/token/kl3aavzKZyDPCiF37xp4QwFpW/?name=inline-270194354.png)

#### Required files and references

In order to protect your .NET application with QLM, you must:

* Add a reference to QlmLicenseLib.dll.
* From the Protect Your Application wizard, generate a LicenseValidator class and add it to your project.
* From the Protect Your Application wizard, generate the product settings file and add it to your project.

#### Initialization

At application startup, you need to determine the type of license that needs to be managed in order to process a node locked license or a floating license. The code below performs this determination.

```
private void ProcessLicense()
{
 string returnMsg = string.Empty;
 bool needsActivation = false;

 lv = new LicenseValidator(settingsXml);
 fh = new QlmFloatingLicenseHelper();

 fh.Init(lv.QlmLicenseObject, computerID, nodeName, settingsXml, dbType, Settings.Default.dbProvider);

 licenseStatus = lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref returnMsg);

 lk = fh.GetLicenseKind(licenseStatus, lv.ActivationKey);

 if (lk == QlmFloatingLicenseHelper.ELicenseKind.Undetermined)
 {
     LaunchWizard();
     licenseStatus = lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref returnMsg);

     // Now that we hopefully activated a license, let's check the license kind again
     lk = fh.GetLicenseKind(licenseStatus, lv.ActivationKey);
  }

  if ((lk == QlmFloatingLicenseHelper.ELicenseKind.FloatingMaster) || (lk == QlmFloatingLicenseHelper.ELicenseKind.FloatingNode))
  {
     ProcessFloatingLicense();
  }
  else 
  {
     ProcessNodeLockedLicense();
  }
 }
```

If the license is a floating license, the code above calls ProcessFloatingLicense which takes care of initializing and connecting to the floating license database. The implementation of LaunchWizard referenced below can be found in the provided sample.

```
private void ProcessFloatingLicense ()
{
    QlmActivationStatus activationStatus;

    bool licenseValid = fh.Load(out bool reRegisterLicense, out bool reRegisterDb, out bool isOffline, 
                                out bool wasOffline, out activationStatus, out string errorMessage, out string offlineError);

    if (licenseValid == false) 
    {
        if (activationStatus == QlmActivationStatus.NoMoreLicenses)
        {
            MessageBox.Show(this, errorMessage, "Quick License Manager", MessageBoxButtons.OK, MessageBoxIcon.Error);
            Environment.Exit(0);
        }

        if (activationStatus == QlmActivationStatus.OfflineLicenseExpired)
        {
            MessageBox.Show(this, offlineError, "Quick License Manager", MessageBoxButtons.OK, MessageBoxIcon.Error);
            Environment.Exit(0);
        }

        if (reRegisterLicense || reRegisterDb)
        {
            LaunchWizard(reRegisterLicense, reRegisterDb);
            licenseValid = fh.Load(out reRegisterLicense, out reRegisterDb, out isOffline, out wasOffline, out activationStatus, out errorMessage, out offlineError);
        }

        if (licenseValid == false)
        {
            Environment.Exit(0);
        }
    }

    RegisterViolationEvent();
    SetLicenseStatus(licenseValid, isOffline);
 }
```

f the license is a node locked license, the code above calls ProcessNodeLockedLicense which takes care of activating the node locked license if it needs activation. The implementation of LaunchWizard referenced below can be found in the provided sample.

```
private void ProcessNodeLockedLicense()
{
   if (licenseStatus == false)
   {
       int exitCode = LaunchWizard();

       if (exitCode == 4)
       {
           Environment.Exit(0);
       }

        string errorMsg = string.Empty;
        bool needsActivation = false;

        if (lv.ValidateLicenseAtStartup(licenseBinding, ref needsActivation, ref errorMsg) == false)
        {
            Environment.Exit(0);
        }
    }
 }

```

#### End-User Experience

The  first time your user launches your application, the LicenseKind will be undetermined and the QLM License Wizard will be displayed.

The Welcome page of the License Wizard contains a checkbox labeled, by default, "Floating License".

If the user checks this checkbox, the wizard will display the pages required to activate a floating license.&#x20;

If the user unchecks this checkbox, the wizard will display the pages required to activate a node locked license.&#x20;

For floating licenses, once a license is activated and the floating license database is initialized on one system, all other nodes just need to connect to the floating license database without the need to activate a license.
