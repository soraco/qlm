# Activation User Control

Important: \[this user control is deprecated and was replaced by the QLM License Wizard]

The QLM Activation Control manages online and offline activation of license keys. Upon activation, the keys are stored on the end-user system.

Note that you should always make sure that the properties set in the QLM Activation control match the corresponding properties set in the LicenseValidator class. The most critical properties that you need to ensure are set to the same value in both locations are:

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
