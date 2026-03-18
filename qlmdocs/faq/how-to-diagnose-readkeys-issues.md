# How to Diagnose ReadKeys issues

If ReadKeys does not return any data although you successfully activated a license, follow the troubleshooting steps below to diagnose the issue.

### Configuration Issues

ReadKeys and StoreKeys work in tandem. The options that are used when calling StoreKeys must be identical to the ones used when calling ReadKeys.

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

### Permission Issues

Another potential issue is permissions to write information to the end-user system. Depending on the selected options ([StoreKeysLocation ](../api-reference/.net-api/qlmlicense/properties/storekeyslocation.md)and [StoreKeysOptions](../api-reference/.net-api/qlmlicense/properties/storekeysoptions.md)), a user might need permissions to write license information to the registry or the file system.

The [StoreKeysEx ](../api-reference/qlmlicense/client-side-methods/storekeysex.md)API writes license information to the end user system. Your application might be calling the StoreKeysEx API directly, or if you use the QLM License Wizard to activate a license, the StoreKeysEx API is called by the wizard with the options configured in the XML Settings file. For more information about the permissions required for each setting, we recommend reviewing the following articles:

* [StoreKeysLocation ](https://docs.soraco.co/docs/api-reference/.net-api/qlmlicense/properties/storekeyslocation)property
* [StoreKeysOptions](https://docs.soraco.co/docs/api-reference/.net-api/qlmlicense/properties/storekeysoptions) property
* [StoreKeysEx API](https://docs.soraco.co/docs/api-reference/.net-api/qlmlicense/client-side-methods/storekeysex)

