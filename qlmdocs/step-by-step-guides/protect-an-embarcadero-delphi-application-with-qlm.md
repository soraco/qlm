# Protect an Embarcadero Delphi application with QLM

This guide provides a step-by-step procedure to protect a Delphi app. Note that the steps below assume you have a QLM License Server already setup.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server
* Page 2: Select "Delphi / Pascal"
* Page 3: Leave the default settings or customize the look & feel if needed. By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* Page 4: Select the folder where your project source code is located and click Save.
* Page 5: Click Finish

5\. Open your Delphi project in RAD Studio

5\. Copy the following files to your project's folder:

* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseLib.dll
* C:\Program Files\Soraco\QuickLicenseMgr\Redistrib\\.net 4.0\QlmLicenseWizard.exe
* %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\Delphi\WizardSample\mscoree\_TLB.pas
* %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\Delphi\WizardSample\mscorlib\_TLB.pas
* %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\Delphi\WizardSample\QlmLicenseLib\_TLB.pas

6\. Add the following files to your project:

* LicenseValidator.pas
* mscoree\_TLB.pas
* mscorlib\_TLB.pas
* QlmLicenseLib\_TLB.pas

7\. The files QlmLicenseLib.dll, QlmLicenseWizard.exe and the XML settings file must be configured to be deployed to the same folder as your executable.

8\. In your app's module where you want to add license validation, add the following code:

* Add the following to the uses statement:
  * _uses QlmLicenseLib\_TLB, LicenseValidator;_
* Declare the following variables&#x20;
  * _lv : TLicenseValidator;_
  * _qlmWizard : String;_
  * _settingsFile : String;_
  * _wizardArgs : String;_
* _Declare the following functions:_
  * _function DisplayLicenseForm () : Integer;_

> &#x20;9\. Add the code similar to the code below where you want to perform the license validation. Mofify the class name below (TAppForm) to match your own class.

{% code overflow="wrap" %}
```pascal
procedure TAppForm.FormCreate(Sender: TObject);
Var
needsActivation : Boolean;
licenseValid : Boolean;
errorMsg : String;
exitCode : Integer;
computerID : String;
qlmHardware : IQlmHardware;
licenseBinding : ELicenseBinding;
begin
lv:=TLicenseValidator.Create;
needsActivation:=False;
errorMsg:='';
exitCode := 0;

// Example of getting a unique identifier
qlmHardware := lv.CreateQlmHardwareObject ();
computerID := qlmHardware.GetMachineName();
licenseBinding := ELicenseBinding_ComputerName;
settingsFile := ExtractFilePath (Application.ExeName) + 'Demo 1.0.lw.xml';
qlmWizard := ExtractFilePath (Application.ExeName) + 'QlmLicenseWizard.exe';

wizardArgs := '/settings "' + settingsFile + '"';
// If you use a LicenseBinding of type UserDefined, you must pass the computerID
// wizardArgs := '/settings "' + settingsFile + '" /computerID ' + computerID;
licenseValid:=lv.ValidateLicenseAtStartup(licenseBinding, needsActivation, errorMsg);
if needsActivation or (not licenseValid)
then
begin
DisplayLicenseForm ();
licenseValid:=lv.ValidateLicenseAtStartup(licenseBinding, needsActivation, errorMsg);
if (not licenseValid) then
Application.Terminate;
end
end;
function TAppForm.DisplayLicenseForm() : Integer;
begin
Result:= lv.QlmLicenseObject.LaunchProcess (qlmWizard, wizardArgs, true, true);
end;
```
{% endcode %}

This completes the integration. The next time you open your Delphi application the ValidateLicenseAtStartup method should get triggered and perform the license validation.&#x20;

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click OK.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.

The files that you need to distribute with your application are:

* QlmLicenseLib.dll
* QlmLicenseWizard.exe
* XML file generated by the Protect Your Application Wizard
