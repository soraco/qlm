# How does online activation work?

If your customers are connected to the internet, they can activate their license online. The online activation process workflow is as follows:

* In your application. a customer enters an Activation Key and requests activation.
* Based on the selected [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding), a unique computer identifier is extracted from the customer's system (ComputerID).
* The Activation Key and the Computer ID are sent to the License Server.
* The License Server validates the Activation Key. For example, the server checks if the license has expired, has been revoked or has already been activated on another system.
* If the Activation Key is valid, the License Server then generates a new license key, referred to as Computer (Bound) Key, and returns this new ComputerKey to the client. The  ComputerKey is bound to the customer's system.
* The ComputerKey is then stored on the end-user system.&#x20;
* The next time the end-user launches your application, the ComputerKey is automatically read and validated. If the ComputerKey is valid, your application starts up.

There are 2 ways to perform online activation:

* From the QLM License Wizard
* From the QLM API

### Activation from QLM License Wizard

To perform an activation from the QLM License Wizard follows the steps below:

* Launch the QLM License Wizard with the proper arguments.
* Click Activate your license.
* Click Activate Online.
* On the Activate Online page, enter the Activation Key then click Activate.

### Activation from the QLM API

To perform an activation from the QLM API, use any of the APIs listed below:

* [QlmLicense.ActivateLicense](https://support.soraco.co/hc/en-us/articles/207295216-QlmLicense-ActivateLicense)
* [QlmLicense.ActivateLicenseByAuthorizationCode](https://support.soraco.co/hc/en-us/articles/360000491066-QlmLicense-ActivateLicenseByAuthorizationCode)
* [QlmLicense.ActivateLicenseByField](https://support.soraco.co/hc/en-us/articles/115001075983-QlmLicense-ActivateLicenseByField)
* [QlmLicense.ActivateLicenseEx](https://support.soraco.co/hc/en-us/articles/207610003-QlmLicense-ActivateLicenseEx)
* [QlmLicense.ActivateLicenseForUser](https://support.soraco.co/hc/en-us/articles/207295206-QlmLicense-ActivateLicenseForUser)
* [QlmLicense.ActivateLicenseForUserEx](https://support.soraco.co/hc/en-us/articles/360000871603-QlmLicense-ActivateLicenseForUserEx)
* [QlmLicense.ActivateLicenseForUserEx2](https://support.soraco.co/hc/en-us/articles/360000878426-QlmLicense-ActivateLicenseForUserEx2)
