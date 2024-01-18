# How to diagnose "The license key is invalid" message

If you generate a license key and license validation fails when you call ValidateLicenseEx or when you paste the license key in the QLM License Wizard or QLM .NET Control, review the troubleshooting steps below.

* If license validation fails in the QLM License Wizard standalone app.
  * Make sure that the QlmLicenseLib.dll is located in the same folder as the QlmLicenseWizard.exe
  * The QlmLicenseWizard.exe takes as arguments a settings XML file that contains details about your product. Make sure that your xml file is up-to-date. If in doubt, regenerate the settings xml file from the "Protect Your application" wizard (3rd tab).
  * Make sure that the following properties are set to the expected values when you protect your application via the Protect Your Application wizard (3rd tab in QLM Management Console):
    * QlmMajorVersion
    * QlmMinorVersion
    * QlmProductID
    * QlmPublicKey
    * QlmCommunicationEncryptionKey
  * Additionally, you should make sure the following properties are set to the expected values:
    * QlmWebServiceUrl
    * QlmGUID
    * QlmLicenseType
    * QlmStoreKeysLocation
* If the license validation fails in the QLM .NET control:
  * Make sure that the QlmLicenseLib.dll is located in the same folder as the your executable.
  * The QLM .NET Control has a set of QLM specific properties. The value of these properties must match the values associated to your product in the Define Products tab. More specifically, make sure the following properties are set in the QLM .NET Control: QlmMajorVersion, QlmMinorVersion, QlmProductID, QlmPublicKey
  * If you are using the LicenseValidator class, make sure that the arguments to DefineProduct and the PublicKey property match the values associated to your product in the Define Products tab.
* If license validation fails when calling ValidateLicenseEx:
  * Make sure that the QlmLicenseLib.dll is located in the same folder as the your executable.
  * If you are using the LicenseValidator class, make sure that the arguments to DefineProduct and the PublicKey property match the values associated to your product in the Define Products tab.
