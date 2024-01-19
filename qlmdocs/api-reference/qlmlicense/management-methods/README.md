# Management Methods

The QLM License Server provides an extended set of functions that you may want to use for managing your license keys or integrating licensing with any other internal process that you may have.

This extended set of functions should never be called from within your application but rather called from a server or a system that your end-user does not have access to.

Before calling any of the functions below, you need to set the AdminEncryptionKey property of the QlmLicense object to the value specified in your Site Properties (Manage Keys tab / Site).

If you are developing an application in .NET, it is highly recommended that you obfuscate your code, and more specifically that you encrypt sensitive strings such as the AdminEncryptionKey.
