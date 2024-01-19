# Properties

<table><thead><tr><th width="259">Name</th><th width="89.33333333333331">Type</th><th>Description</th></tr></thead><tbody><tr><td>AdminEncryptionKey</td><td>string</td><td>encryption key used to encrypt communication with the License Server for admin operations</td></tr><tr><td>AllowGenericKeys</td><td>bool</td><td>Generic license keys are licenses that do not require activation and are not bound to a computer identifier. For example, if you embed a trial license in your source code, you are using a generic license key. Creation and validation of generic license keys will fail if AllowGenericKeys is false. The default value is false. To enable generic license keys on the server side, you must set the "options/AllowGenericKeys" server property to true.</td></tr><tr><td>ApplicationVersion</td><td>string</td><td>version of your application</td></tr><tr><td>CommunicationEncryptionKey</td><td>string</td><td>encryption key used to encrypt communication with the License Server</td></tr><tr><td>DateTamperingGracePeriod</td><td>int</td><td>specify the grace period allowed for date tampering - the default is 1</td></tr><tr><td>DaysLeft</td><td>int</td><td>number of days left for the evaluation. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>DefaultWebServiceUrl</td><td>string</td><td>URL to the License Server</td></tr><tr><td>DownloadLicenseFile</td><td>bool</td><td>flag to instruct QLM to automatically download a License File when activating or reactivating a license</td></tr><tr><td>DownloadProductProperties</td><td>bool</td><td>flag to instruct QLM to automatically download a Produt Properties File when activating or reactivating a license</td></tr><tr><td>Duration</td><td>int</td><td>duration associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>EnableClientLanguageDetection</td><td>bool</td><td>flag to force the server to use the same locale as the client</td></tr><tr><td>EnableDRSite</td><td>bool</td><td>flag to enable QLM DR Site</td></tr><tr><td>EnableRedirectUrl</td><td>bool</td><td>flag to enable URL redirect to the QLM License Server.</td></tr><tr><td>EnableSoapExtension</td><td>bool</td><td>flag to enable the QLM SOAP extension</td></tr><tr><td>EvaluationLicenseKey</td><td>string</td><td>A built-in evaluation license</td></tr><tr><td>EvaluationPerUser</td><td>bool</td><td>flag to specify if evaluation information should be stored per user or per machine</td></tr><tr><td></td><td></td><td></td></tr><tr><td>ExpiryDateRoundHoursUp</td><td>bool</td><td>when evaluating the number of days left for a license, any time that is less than a day can either be rounded up to a day or ignored. The default is to round up to a day.</td></tr><tr><td>ExpiryDate</td><td>DateTime</td><td>expiry date associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>FavorMachineLevelLicenseKey</td><td>bool</td><td>if a license key is stored both at the machine level and user level, QLM will use the machine level key if this attribute is set to true. The default value is false.</td></tr><tr><td>FloatingDbPassword</td><td>string</td><td>password of the floating license database</td></tr><tr><td>FloatingLicenseDbPath</td><td>string</td><td>path to the floating license database.</td></tr><tr><td>FloatingLicenseMaxOfflineDuration</td><td>int</td><td>maximum duration of an offline floating license. After this period expires, the license is no longer considered offline.</td></tr><tr><td>LicenseBinding</td><td><a href="https://soraco.readme.io/reference/elicensebinding">ELicenseBinding</a></td><td>the selected license binding</td></tr><tr><td>LicenseFilePath</td><td>string</td><td>Path where the license file should be stored. The path can include Windows Environment Variables. Example: %localappdata%\yourapp\license.xml".<br>If not set, the license file is stored based on the StoreKeysLocation property.</td></tr><tr><td>LicenseType</td><td><a href="https://soraco.readme.io/reference/elicensetype">ELicenseType</a></td><td>license type associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>LimitTerminalServerInstances</td><td>bool</td><td>limit the number of instances running on a Terminal Server to the number defined in the license key</td></tr><tr><td>MajorVersion</td><td>int</td><td>major version associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>MaxDaysOffline</td><td>int</td><td>number of days the app can work offline. ValidateOnServer must be true for this setting to take effect.</td></tr><tr><td>MaxDaysOfflineTimerEnabled</td><td>bool</td><td>enable a timer that runs once per day and checks the maxDaysOffline property. If the timer detects that the maxDaysOffline was exceeded, it will throw an exception. You should enable this option only if your code can handle exceptions. If you do not handle the exception, the application will crash.</td></tr><tr><td>MinorVersion</td><td>int</td><td>minor version associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>NumberOfLicenses</td><td>int</td><td>number of licenses associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>OfflinePeriodExceededAction</td><td><a href="https://soraco.readme.io/reference/eofflineperiodexceededaction">EOfflinePeriodExceededAction</a></td><td>specify the action to perform when the allowed offline period has been exceeded while the application is running.</td></tr><tr><td>OverrideKeyStoreRegistry</td><td>string</td><td>change the default registry key where QLM stores license key information. This is strictly for permanent licenses and does not affect trial licenses.</td></tr><tr><td>PreviousPublicKeys</td><td>string</td><td>List of the previous public keys. Keys must be separated by 2 semi-columns (;;).</td></tr><tr><td>PreviousRsaPublicKeys</td><td>string</td><td>List of the previous RSA public keys. Keys must be separated by 2 semi-columns (;;).</td></tr><tr><td>ProductID</td><td>int</td><td>product ID associated with the license key. Must be called after a call to ValidateLicense or ValidateLicenseEx.</td></tr><tr><td>ProductName</td><td>string</td><td>name of the product</td></tr><tr><td>ProductPropertiesPath</td><td>string</td><td>Path where the Product Properties file should be stored. The path can include Windows Environment Variables. Example: %localappdata%\yourapp\pp.xml".<br>If not set, the Product Properties file is stored based on the StoreKeysLocation property.</td></tr><tr><td>PublicKey</td><td>string</td><td>Public Key of the license</td></tr><tr><td>PublishAnalytics</td><td>bool</td><td>when validating a license, publish analytics to the server</td></tr><tr><td>QlmTimerDelayStart</td><td>int</td><td>delay the QLM timer by x minutes before starting</td></tr><tr><td>QlmTimerFrequency</td><td>int</td><td>timer frequency in minutes. The minimum is 60 minutes except when SimulateNoConnectivity is true.</td></tr><tr><td>RedirectorUrl</td><td>string</td><td>URL of the redirected site</td></tr><tr><td>RsaPublicKey</td><td>string</td><td>RSA Public Key used to sign Product Properties</td></tr><tr><td>SimulatedDateTime</td><td>DateTime</td><td>simulate the date/time used by the licensing engine.</td></tr><tr><td>SimulateNoConnectivity</td><td>bool</td><td>simulate no internet connectivity for testing purposes</td></tr><tr><td>StoreKeysCommonDataFilename</td><td>string</td><td>name of the file in the CommonData folder where license keys will be stored.</td></tr><tr><td>StoreKeysCommonDataFolder</td><td>string</td><td>name of the folder in the CommonData folder where license keys will be stored.</td></tr><tr><td>StoreKeysLocation</td><td><a href="https://soraco.readme.io/reference/estorekeysto">EStoreKeysTo</a></td><td>specifies where to store the keys, in a hidden file on the system or the registry.</td></tr><tr><td>StoreKeysOptions</td><td><a href="https://soraco.readme.io/reference/estorekeysoptions">EStoreKeysOptions</a></td><td>specifies how to store the keys, per user, per machine or both</td></tr><tr><td>ValidateOnServer</td><td>bool</td><td>when validating a license, validate it on the server as well</td></tr><tr><td>Version</td><td>string</td><td>the version of QLM Engine</td></tr></tbody></table>
