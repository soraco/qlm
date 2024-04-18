# Online activation

If your customers are connected to the internet, they can activate their license online. The online activation process workflow is as follows:

* In your application. a customer enters an Activation Key and requests activation.
* Based on the selected [QlmLicenseBinding](../../api-reference/qlmlicense/enums/elicensebinding.md), a unique computer identifier is extracted from the customer's system (ComputerID).
* The Activation Key and the Computer ID are sent to the License Server.
* The License Server validates the Activation Key. For example, the server checks if the license has expired, has been revoked, or has already been activated on another system.
* If the Activation Key is valid, the License Server generates a new license key, referred to as Computer (Bound) Key, and returns this new ComputerKey to the client. The  ComputerKey is bound to the customer's system.
* The ComputerKey is then stored on the end-user system.&#x20;
* The next time the end-user launches your application, the ComputerKey is automatically read and validated. If the ComputerKey is valid, your application starts up.

There are 2 ways to perform online activation:

* From the QLM License Wizard
* From the QLM API

### Activation from QLM License Wizard

To perform an activation from the QLM License Wizard follow the steps below:

* Launch the QLM License Wizard with the proper arguments.
* Click Activate your license.
* Click Activate Online.
* On the Activate Online page, enter the Activation Key then click Activate.

### Activation from the QLM API

To perform an activation from the QLM API, use any of the APIs listed below:

* [QlmLicense.ActivateLicense](../../api-reference/qlmlicense/application-methods/activatelicense.md)
* [QlmLicense.ActivateLicenseByAuthorizationCode](../../api-reference/qlmlicense/application-methods/activatelicensebyauthorizationcode.md)
* [QlmLicense.ActivateLicenseByField](../../api-reference/qlmlicense/application-methods/activatelicensebyfield.md)
* [QlmLicense.ActivateLicenseEx](../../api-reference/qlmlicense/application-methods/activatelicenseex.md)
* [QlmLicense.ActivateLicenseForUser](../../api-reference/qlmlicense/application-methods/activatelicenseforuser.md)
* [QlmLicense.ActivateLicenseForUserEx](../../api-reference/qlmlicense/application-methods/activatelicenseforuserex.md)
* [QlmLicense.ActivateLicenseForUserEx2](../../api-reference/qlmlicense/application-methods/activatelicenseforuserex2.md)

