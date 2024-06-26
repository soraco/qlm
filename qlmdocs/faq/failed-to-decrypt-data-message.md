# Failed to decrypt data message

You get the following message when the QLM Management Console connects to the License Server or when calling any QLM Pro API:

_"Failed to decrypt data"_

QLM encrypts data when communicating between the client and the web service. Data is encrypted using the communicationEncryptionKey and/or adminEncryptionKey.

Note that if you are using SSL, data is additionally encrypted by the SSL layer.

If you get the mentioned error, verify that te communicationEncryptionKey and adminEncryptionKey are the same in the following locations:

1. Web server config file:&#x20;
   1. QlmLicenseServer\web.config
   2. QlmPortal\web.config
   3. QlmCustomerSite\web.config
   4. QlmCustomerPortal\qlm-portal-api\web.config
2. In the QLM Management Console
   1. In QLM v4: QLM Console / Tools / Options : CommunicationEncryptionKey
   2. In QLM v5+: QLM Console / Manage Keys / Sites / Encryption Keys: CommunicationEncryptionKey / AdminEncryptionKey
3. In any of the QLM .NET User Controls, the QlmCommunicationEncryptionKey property
4. In the constructor of LicenseValidator class
5. Any time you instantiate a QlmLicense object.
6. In the settings.xml file generated by the Protect Your Application wizard (3rd tab).

If you are getting the error when calling the QLM API, make sure you set the CommunicationEncryptionKey or AdminEncryptionKey property of the QlmLicense object.

You must set the CommunicationEncryptionKey when calling the QLM **Web Service Application API**.

You must set the AdminEncryptionKey when calling the QLM **Web Service Management API**. It is not recommended to set the AdminEncryptionKey in your application nor to call QLM **Web Service Management API** methods from within your application. The QLM **Web Service Management API** is designed to be called from your server.

If you are getting the error when using the QLM .NET Control, make sure you set the control's QlmCommunicationEncryptionKey property.
