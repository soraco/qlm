# Overview

The QLM License Wizard User Control manages online and offline activation of license keys. Upon activation, the keys are stored on the end user system.

Note that you should always make sure that the properties set in the QLM Wizard control match the corresponding properties set in the LicenseValidator class. The most critical properties that you need to ensure are set to the same value in both locations are:

* QlmProductID
* QlmMajorVersion
* QlmMinorVersion
* QlmGUID
* QlmPublicKey
* QlmLicenseType
* QlmCommunicationEncryptionKey
* QlmWebServiceUrl
* QlmStoreKeysLocation
* QlmStoreKeysOptions

After setting any of the properties below programmatically, you must call the PostInitialize method for the settings to take effect. You should avoid calling PostInitialize more than once.

**The QLM License Wizard can also be used as a standalone application (exe).**
