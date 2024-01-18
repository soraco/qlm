# How to initialize the QLM License Wizard programmatically

The QLM License Wizard is typically initialize by loading the xml settings file generated from the QLM Management Console / Protect Your application wizard.

If you'd rather initialize the License Wizard programmatically, you can do so as described below.

### .NET Winforms App

If your application is a .NET Winforms application, you can simply use the QLM License Wizard .NET User Control and set its properties in the Visual Studio IDE.

### Other apps

If your application is not a .NET Winforms app, the code below illustrates how to initialize the QLM License Wizard. The example below is configured for the built-in Demo product and connects to the Demo License Server. You must update most settings to use your own product and your own License Server.

```
QlmLicenseWizard lw = CreateWizard();
lw.ShowDialog();


private QlmLicenseWizard CreateWizard ()
{
 QlmLicenseWizard lw = new QlmLicenseWizard();

 lw.qlmWizardControl.QlmApplicationVersion = "1.2";
 lw.qlmWizardControl.QlmCommunicationEncryptionKey = "{B6163D99-F46A-4580-BB42-BF276A507A14}";
 lw.qlmWizardControl.QlmCustomerSiteUrl = "";
 lw.qlmWizardControl.QlmGUID = "{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}";
 lw.qlmWizardControl.QlmLicenseBinding = ELicenseBinding.ComputerName;
 lw.qlmWizardControl.QlmLicenseServerUrl = "https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx";
 lw.qlmWizardControl.QlmMajorVersion = 1;
 lw.qlmWizardControl.QlmMinorVersion = 0;
 lw.qlmWizardControl.QlmProductID = 1;
 lw.qlmWizardControl.QlmPublicKey = "A59Jip0lt73Xig==";
 lw.qlmWizardControl.QlmStoreKeysLocation = EStoreKeysTo.EFileCommonData;
 lw.qlmWizardControl.QlmValidateLicenseOnServer = true;

 lw.qlmWizardControl.QlmClose += new QlmControls.v10.QlmWizardControl.QlmCloseHandler(qlmWizardControl_QlmClose);
 lw.qlmWizardControl.QlmCancel += new QlmControls.v10.QlmWizardControl.QlmCancelHandler(qlmWizardControl_QlmCancel);

 // Make sure to call PostInitialize once all the settings are set
 lw.qlmWizardControl.PostInitialize();

 return lw;
}
public void qlmWizardControl_QlmClose()
{
}
private void qlmWizardControl_QlmCancel()
{
}
```
