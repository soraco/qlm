# LicenseValidator

The LicenseValidator class is the main class that should be referenced by your application. It is generated from the QLM Management Console / Protect Your Application wizard.

The main functionality of this class is to validate a license key locally or on the server.

The LicenseValidator class provides several benefits over working directly with a QlmLicense object:

* When the LicenseValidator class is generated, a default class constructor is created which properly initializes all the QlmLicense object properties that are specific to your product and your License Server.
* The LicenseValidator class provides a constructor that takes as input the XML settings file generated by the Protect Your Application wizard. Initializing the LicenseValidator class with the XML settings file is highly recommended because:
  * It provides consistency of information when using the QLM License Wizard. When using hard-coded settings in your code, you need to always ensure that these settings are consistent with the settings provided to the QLM License Wizard.&#x20;
  * It allows you to use the same LicenseValidator class across several products or product versions.
  * It allows you to make changes to your settings without having to rebuild your application.

The LicenseValidator class can be initialized with your product information by loading the XML settings file generated from the QLM Management Console / Protect Your Application wizard.

When your application starts up, you need to call [ValidateLicenseAtStartup ](methods/validatelicenseatstartup.md)to determine if the user has a valid license. If the license is not valid, you then need to prompt the user to enter a license key and activate it.

The LicenseValidator class internally references a QlmLicense object which performs the actual license validation operations. You can access the underlying QlmLicense object by accessing the QlmLicenseObject property.

### Important

If you need to modify any functionality of the LicenseValidator class, it is recommended that you subclass it and add your custom code to the subclass. This will simplify the upgrade process when a new version of the LicenseValidator class is released.