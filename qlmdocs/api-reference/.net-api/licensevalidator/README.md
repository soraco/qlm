# LicenseValidator

The LicenseValidator class is the main class that should be referenced by your application. It is generated from the QLM Management Console / Protect Your Application wizard.

The main functionality of this class is to validate a license key locally or on the server.

The LicenseValidator class can be initialized with your product information by loading the XML settings file generated from the QLM Management Console / Protect Your Application wizard.

When your application starts up, you need to call [ValidateLicenseAtStartup ](methods/validatelicenseatstartup.md)to determine if the user has a valid license. If the license is not valid, you then need to prompt the user to enter a license key and activate it.

The LicenseValidator class internally references a QlmLicense object which performs the actual license validation operations. You can access the underlying QlmLicense object by accessing the QlmLicenseObject property.

### Important

If you need to modify any functionality of the LicenseValidator class, it is recommended that you subclass it and add your custom code to the subclass. This will simplify the upgrade process when a new version of the LicenseValidator class is released.
