# How to set the Application Version dynamically

### Overview

The Application Version property is used in 2 contexts:

* When performing a Check For Updates
* When populating the Client Version field during license activation. The Client Version field is associated with each license activation and allows you to determine which version of your application a customer is running.

Although the Application Version is embedded in QLM's settings XML file, you can dynamically set it after the XML settings file is loaded.&#x20;

### QLM License Wizard standalone executable

To set the Application Version when using the QLM License Wizard standalone executable, add the /appversion when launching the process.

Example: QlmLicenseWizard.exe /settings "Demo 1.0.lw.xml" /appversion 1.2

### QLM License Wizard User Control

To set the Application Version when using the QLM License Wizard user control , set the add the QlmApplicationVersion property before displaying the QLM License Wizard.

Example:&#x20;

{% code overflow="wrap" %}
```csharp
QlmLicenseWizard lw = new QlmLicenseWizard(true, false);

if (lw.LoadSettings(settingsFile, out lwErrorMsg) == true)
{
    lw.qlmWizardControl.QlmApplicationVersion = "1.2";
    lw.qlmWizardControl.PostInitialize();

    lw.ShowDialog();
}
```
{% endcode %}

### QLM License Object

To set the Application Version when using the QLM License object, set the QlmApplicationVersion property before displaying the QLM License Wizard.

Example:&#x20;

{% code overflow="wrap" %}
```csharp
QLM.LicenseValidator lv = new QLM.LicenseValidator(settingsFile);

lv.QlmLicenseObject.ApplicationVersion = "1.2";
```
{% endcode %}
