# QLM License Server: Application API v/s Management API

The QLM License Server API is exposed via the QlmLicense class which can be found in the QlmLicenseLib.dll file.

The API is divided into two categories: Application API and Management API.

The QLM Application API covers functions that you typically need to call from your application.

The QLM Management API covers functions that you typically need to call from your server or to integrate with third-party products.

The online help under "Quick License Manager Professional / API Reference" describes the functions available for both categories.

Before calling any QLM Application API function, you need to set the communicationEncryptionKey property of the QlmLicense object to the value specified in your Site Properties (Manage Keys tab / Site / Encryption Keys).

Before calling any QLM Management API function, you need to set the adminEncryptionKey property of the QlmLicense object to the value specified in your Site Properties (Manage Keys tab / Site / Encryption Keys).

For security reasons, it is **NOT** recommended to call Management API functions from within your application.

Additional Resources:

[CommunicationEncryptionKey and AdminEncryptionKey](https://support.soraco.co/hc/en-us/articles/115005268823)
