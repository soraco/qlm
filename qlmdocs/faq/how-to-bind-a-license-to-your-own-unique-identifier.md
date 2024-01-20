# How to bind a license to your own unique identifier

### Overview

QLM can bind a license to a computer identifier such as a Computer Name, MAC address, Motherboard Serial Number, etc. For more details about all the supported unique identifiers, check out the [ELicenseBinding ](../api-reference/qlmlicense/enums/elicensebinding.md)property.

If none of the out-of-the-box unique identifiers meet your requirements, you can use your own unique identifier to bind the license to.

### Configuration

1\. In the Protect Your Application wizard, set the QlmLicenseBinding property to UserDefined and regenerate the settings xml file and the LicenseValidator class. Note that you can also set this property programmatically.&#x20;

2\. If you are using the QLM License Wizard .NET User control, set the QlmLicenseBinding to UserDefined in the User Control.

3\. In your application, at startup, call the LicenseValidator.ValidateLicenseAtStartup function and provide your unique fingerprint as the computerID argument.

4\. If you are using the QLM License Wizard standalone executable, add the /computerID command line argument in order to provide your unique fingerprint to the wizard. Example: QlmLicenseWizard.exe /settings "yourproduct 1.0.lw.xml" /computerID 123456789. If you are using the QLM License Wizard .NET user control, programmatically set the QlmComputerID property of the .NET User control to your unique fingerprint.&#x20;

### Fingerprint Computation

To create your own Computer ID, you can use your own method of extracting a unique computer identifier. You can also make use of the QlmHardware class to create a unique fingerprint by combining several supported identifiers.

For example, to bind the license to the ComputerName and the first VolumeSerialNumber:

{% code overflow="wrap" %}
```csharp
string GetUniqueIdentifier()
{
    QlmHardware hw = new QlmHardware();
    // Combine the computer name with the first volume serial number
    string computerID = hw.GetMachineName();
    computerID += hw.GetFirstVolumeSerialNumber ();
    return computerID;
}

// Example when to call GetUniqueIdentifier

LicenseValidator lv = new LicenseValidator (settingsXml);
lv.ValidateLicenseAtStartup (GetUniqueIdentifier(), ...);



// When launching the wizard
string args = String.Format ("/settings \"{0}\" /computerID {1}", settingsXmlFile, GetUniqueIdentifier());
lv.QlmLicenseObject.LaunchProcess ("QlmLicenseWizard.exe", args, true, true);
```
{% endcode %}
