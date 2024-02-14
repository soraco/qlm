# License Server - Application Methods

The QLM License Server is an ASP.NET web service that your application communicates with in order to activate a license, deactivate a license, validate a license, etc.

As a license Administrator, you also communicate with the QLM License Server in order to manage license key, create new keys, revoke keys, etc.

Since the License Server is configured to allow anyone to connect to it (Anonymous Authentication), the web service methods that the QLM License Server exposes are secured by an encryption mechanism that encrypts the data of the web methods in order to prevent hackers from just calling the exposed web service methods. Therefore, the only way to communicate with the QLM License Server is via the QlmLicense object which encrypts the data before sending it to the server.

The QLM License Server API is divided into two groups: the QLM Application API which is the API you typically use in your application and the QLM Management API which is the API you would call from your own server.

The QLM Application API is protected with an encryption key called CommunicationEncryptionKey. Before calling any QLM Application API, you must set the QlmLicense.CommunicationEncryptionKey property. If you are using the QLM License Wizard, the CommunicationEnryptionKey is stored in the settings XML file encrypted.

The QLM Management API is protected with an encryption key called AdminEncryptionKey. Before calling any QLM Management API, you must set the QlmLicense.AdminEncryptionKeyproperty. You should never call the QLM Management API from within your application because doing so requires that your application sets the AdminEncryption in your code.The functions listed in this section are functions that you need to use within your application in order to interface with the QLM License Server.

Before calling any of the functions below, you need to set the CommunicationEncryptionKey property of the QlmLicense object to the value specified in your Site Properties (Manage Keys tab / Site).

If you are developing an application in .NET, it is highly recommended that you obfuscate your code, and more specifically that you encrypt sensitive strings such as the CommunicationEncryptionKey.

The QLM License Server provides a more extended set of APIs that you may want to use for managing your license keys or for integrating licensing with any other internal process that you may have. The extended set of functions is described under the [License Server Management API](https://soraco.readme.io/reference/server-side-management-methods) section.
