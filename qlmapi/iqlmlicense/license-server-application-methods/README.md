# License Server - Application Methods

The functions listed in this section are functions that you need to use within your application in order to interface with the QLM License Server.

Before calling any of the functions below, you need to set the CommunicationEncryptionKey property of the QlmLicense object to the value specified in your Site Properties (Manage Keys tab / Site).

If you are developing an application in .NET, it is highly recommended that you obfuscate your code, and more specifically that you encrypt sensitive strings such as the CommunicationEncryptionKey.

The QLM License Server provides a more extended set of APIs that you may want to use for managing your license keys or for integrating licensing with any other internal process that you may have. The extended set of functions is described under the [License Server Management API](https://soraco.readme.io/reference/server-side-management-methods) section.
