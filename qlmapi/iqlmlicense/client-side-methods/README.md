# Client-Side Methods

QLM provides a set of client-side functions that you can use in your application or in any other order processing application that you may have.

Client-side functions do not communicate with the QLM License Server.

Before calling any of the functions below, you need to call the [DefineProduct ](https://soraco.readme.io/reference/defineproduct)function and set the PublicKey property.

Functions that create license keys such as CreateLicenseKey should not typically be used from within your application. They should be used from a server or a system that the end user does not have access to. In order to call any of the functions that create license keys, you must set the PrivateKey property of the QlmLicense object. The Public and Private keys for your product can be found in the Define Products tab / Keys tab.

If you are developing an application in .NET, it is highly recommended that you obfuscate your code, and more specifically that you encrypt sensitive strings such as the PrivateKey.
