# Properties

### QLM Activation Control Properties

| Name                            | Description                                                                                                                                                                                                           |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| QlmCommunicationEncryptionKey   | Set the communicationEncryptionKey to use when connecting to the QLM web service. The communicationEncryptionKey must match the one defined in the web.confi file on the web server.                                  |
| QlmComputerID                   | Set the computer ID to use when activating the license. This property should be typically set programmatically at runtime.                                                                                            |
| QlmEnableMultiByte              | Enable multibyte to support system with a ComputerID that contains multibyte characters.                                                                                                                              |
| QlmEnableSoapExtension          | By default, QLM sends custom headers with every SOAP request and sends information to the server related to the customer's locale. If this interferes with your own SOAP extension, you can turn off QLM's extension. |
| QlmEncryptionKey                | Set the encryption key. This property is only required when using QLM engine version 4.0 and earlier.                                                                                                                 |
| QlmEvaluationLicenseKey         | Only applies if the QlmEvaluationVisible property is set to true. Set the evaluation key to use when the user selects to evaluate the software and does not have a license key.                                       |
| QlmEvaluationPerUser            | Sets whether the evaluation information is stored per user or per machine.                                                                                                                                            |
| QlmFavorMachineLevelLicenseKey  | If a license key is stored both at the user level and the machine level, set this property to true to favor the key stored at the machine level.                                                                      |
| QlmFormatLicenseKey             | Formats the license key by adding dash separators.                                                                                                                                                                    |
| QlmFormatLicenseKeyGroupSize    | Size of the group of characters in a formatted license. The QlmFormatLicenseKey property must be true for this to take effect.                                                                                        |
| QlmFormatLicenseKeyMaxGroupSize | Maximum size of group of characters in a formattted license. The QlmFormatLicenseKey property must be true.                                                                                                           |
| QlmGUID                         | Set the GUID associated to your product. The GUID can be found on the Define Product page in the QLM Console.                                                                                                         |
| QlmLicenseType                  | Set the license type. The license type can be: ComputerName, UserDefined or Generic.                                                                                                                                  |
| QlmMajorVersion                 | Set the Major Version associated to your product. The Major Version can be found on the Define Products page in the QLM Console.                                                                                      |
| QlmMinorVersion                 | Set the Minor Version associated to your product. The Minor Version can be found on the Define Products page in the QLM Console.                                                                                      |
| QlmOverrideKeyStoreRegistry     | Change the default registry key where QLM stores license key information. This is strictly for permanent licenses.                                                                                                    |
| QlmProductID                    | Set the Product ID Version associated to your product. The Product ID can be found on the Define Products page in the QLM Management Console.                                                                         |
| QlmProductName                  | Set your product name.                                                                                                                                                                                                |
| QlmPublicKey                    | Set the Public Key associated to your product. The Public Key Version can be found on the Define Products page (Keys tab) in the QLM Console.                                                                         |
| QlmStoreKeysCommonDataFilename  | Name of the file in the CommonData folder where license keys will be stored.                                                                                                                                          |
| QlmStoreKeysCommonDataFolder    | Name of the folder in the CommonData folder where license keys will be stored.                                                                                                                                        |
| QlmStoreKeysLocation            | By default, QLM stores the license keys in a hidden file on the end user system. You can also select to store the license keys in the registry by setting this property.                                              |
| QlmStoreKeysOptions             | Set whether to store license keys per user, per machine or both.                                                                                                                                                      |
| QlmValidateCertificate          | The QLM DLLs are digitally signed by a trusted certificate authority. In order to ensure that hackers do not replace the QLM DLLs by dummy ones, QLM can validate that the DLLs are properly signed.                  |
| QlmVersion                      | Version of the QLM License Engine to use. The recommended value is 5.0.00.                                                                                                                                            |
| QlmWebServiceUrl                | Set the URL to the QLM License Server. The value of this url is typically: [http://yourdomain.com/qlm/qlmservice.asmx](http://yourdomain.com/qlm/qlmservice.asmx)                                                     |

### QLM Activation Control UI Properties

| Name                  | Description                                                                      |
| --------------------- | -------------------------------------------------------------------------------- |
| QlmCloseButtonVisible | Show or hide to Close button                                                     |
| QlmForeColorControls  | Foreground color of all controls.                                                |
| QlmForeColorText      | Foreground color of all text fields.                                             |
| QlmFormBackColor      | Set the starting Background Color of the form to produce a gradient effect.      |
| QlmFormBackColor2     | Set the ending Background Color of the form to produce a gradient effect.        |
| QlmGlowColor          | Color that highlights in field when in focus.                                    |
| QlmHeaderBackColor    | Set the Background Color of the header pane.                                     |
| QlmHeaderBackColor2   | Set the ending Background Color of the header pane to produce a gradient effect. |
| QlmHeaderVisible      | Show or hide the header panel.                                                   |
| QlmLogoFont           | Set the font to use in the logo text.                                            |
| QlmLogoImage          | Set the image to use for the logo.                                               |
| QlmLogoText           | Set the text to use for the logo.                                                |
| QlmProxyButtonVisible | Show or hide the proxy settings button                                           |
