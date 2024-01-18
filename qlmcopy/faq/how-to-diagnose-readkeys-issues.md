# How to Diagnose ReadKeys issues

If ReadKeys does not return any data although you successfully activated a license, follow the troubleshooting steps below to diagnose the issue.

ReadKeys and StoreKeys work in tandem. The options that are used when calling StoreKeys must be identical to the ones used when calling ReadKeys.&#x20;

* If you activate a license via the QLM License Wizard standalone app and ReadKeys fails in your code.
  * If you are using the LicenseValidator class, make sure that the arguments to DefineProduct and the PublicKey property match the values associated to your product in the Define Products tab. This is a list of properties that must match:
    * Product ID
    * Major Version
    * Minor Version
    * GUID (persistence key)
    * PublicKey
    * LicenseType
    * CommunicationEncryptionKey
    * WebServiceUrl
    * StoreKeysLocation
    * StoreKeysOptions
  * The QlmLicenseWizard.exe takes as arguments a settings XML file that contains details about your product. Make sure that your xml file is up-to-date. If in doubt, regenerate the settings xml file from the "Protect Your application" wizard (3rd tab).
