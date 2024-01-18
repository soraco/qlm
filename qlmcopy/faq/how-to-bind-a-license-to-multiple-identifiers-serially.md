# How to bind a license to multiple identifiers, serially

QLM can bind a license to a computer identifier, such as a computer name, a volume serial number, a motherboard serial number, etc.

In some cases, depending on the manufacturer of a device, the device does not return a unique identifier as expected.

To circumvent these scenarios, you can create a fallback identifier, in case the first one does not return a value.

To implement such as scenario, you would need to do the following:

* Set the QlmLicenseBinding property to UserDefined.
* In your code, create an instance of QlmHardware and call the required method such as GetMotherBoardSerialNumber ().
* If the value returned by GetMotherBoardSerialNumber() is not empty, use it as input to any API that requires a computerID such as LicenseValidator.ValidateLicenseAtStartup
* If the value returned is empty, call your next preferred identifier, for example, QlmHardware.GetBiosUuid() or QlmHardware.GetMachineName()
* You can repeat this logic as often as needed.

When launching the QLM License Wizard, add the /computerID argument and pass the unique identifier that you computed.

&#x20;

Example:

string GetUniqueIdentifier()

{

&#x20;   QlmHardware hw = new QlmHardware();

&#x20;   string computerID = hw.GetMotherBoardSerialNumber();

&#x20;   if (String.IsNullOrEmpty(computerID))

&#x20;   {

&#x20;       computerID = hw.GetFirstVolumeSerialNumber ();

&#x20;       if (String.IsNullOrEmpty(computerID))

&#x20;       {

&#x20;               computerID = hw.GetMachineName();

&#x20;       }

&#x20;   }

}

// Example when to call GetUniqueIdentifier

LicenseValidator lv = new LicenseValidator ();

lv.ValidateLicenseAtStartup (GetUniqueIdentifier(), ...);

&#x20;

// When launching the wizard

string args = String.Format ("/settings \\"{0}\\" /computerID {1}", settingsXmlFile, GetUniqueIdentifier());

lv.QlmLicenseObject.LaunchProcess ("QlmLicenseWizard.exe", args, true, true);
