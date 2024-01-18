# Online Activation By Authorization Code

With QLM v11, users can activate their license simply by using their email address. There's no need to remember an Activation Key.

[\[Watch a video tutorial\]](http://www.screencast.com/users/Soraco/folders/Quick%20License%20Manager%2011/media/bd4fd5ad-bec0-456a-99b3-195ada53dec1)

Activation by authorization code works as follows:

* A user provides his email rather than a license key for activation.
* The server determines if the user owns a license and if he does, an email or SMS message is sent to the user with a 6 digit, easy to type, authorization code.
* The user receives the authorization code and activates the license using the authorization code.

Activation by authorization code (AAC) is currently ideal for single activation keys since only a single email address can be associated to a license. A solution will be implemented for multiple activation keys in a future update.

AAC is supported in 3 different ways:

1. From the QLM License Wizard
2. By calling the [QlmLicense.RequestAuthorizationCodeForActivation](https://support.soraco.co/hc/en-us/articles/360000491823) and [QlmLicense.ActivateLicenseByAuthorizationCode](https://support.soraco.co/hc/en-us/articles/360000491066)
3. By calling the HTTP method [RequestAuthorizationCodeForActivationHttp](https://support.soraco.co/hc/en-us/articles/360000491863-RequestAuthorizationCodeForActivationHttp)and [ActivateLicenseByAuthorizationCodeHttp](https://support.soraco.co/hc/en-us/articles/360000491843-ActivateLicenseByAuthorizationCodeHttp)

**AAC using the QLM License Wizard**

To support AAC from the QLM License Wizard:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Set the QlmEnableActivationByAuthorizationCode property to true
* Save the wizard settings xml file and LicenseValidator class
* Update your application to use these files

You must then configure your QLM License Server to send emails. To do so, follow the instructions in the section "Configure the QLM License Server to send emails using SMTP" of this knowledge base [article](https://support.soraco.co/hc/en-us/articles/207894796-How-to-configure-QLM-to-send-mail-using-SMTP).

You can also send the Authorization Code by SMS message. To send the authorization code by SMS message, you must use a 3rd party SMS provider. QLM is integrated with [Twilio](https://www.twilio.com/) for sending SMS messages.

To configure your Twilio SMS settings:

* Go to the Manage Keys / Sites / Server Properties
* Locate the activation category
* Set the 3 properties: smsAccountNumber, smsAuthenticationToken and smsPhoneNumber

You can also configure the following server properties to control the behavior of AAC:

* activationByAuthorizationCodeEmailTemplate: the template of the email sent to the user with the authorization code. The default email template is: AuthorizationCode
* &#x20;activationByAuthorizationCodeExpiryDuration: the expiry duration in minutes of an authorization code. Once an authorization code has expired, it will be deleted from the server. The default value is 10 minutes.
* activationByAuthorizationCodeMaxAttempts: the maximum number of attempts allowed.&#x20;

When the end user launches your application for the first time:

* The QLM License Wizard is launched
* The user selects Online Activation
* The user enters the email address used at the time of purchase instead of entering an Activation Key
* The user clicks Activate
* The QLM License Wizard contacts the License Server and sends it the user's email address
* The QLM License Server locates the customer's license, generates a random 6 digit Authorization Code and emails it or texts it to the customer
* The QLM License Wizard prompts the user to enter a 6 digit code
* Once the user receives the email/text, he/shen enters the 6 digit code and activates the license

&#x20;

**AAC using the QlmLicense API**

* Call [QlmLicense.RequestAuthorizationCodeForActivation](https://support.soraco.co/hc/en-us/articles/360000491823)
* Call [QlmLicense.ActivationLicenseByAuthorizationCode](https://support.soraco.co/hc/en-us/articles/360000491066)

&#x20;

**AAC using the HTTP API**

* Call [RequestAuthorizationCodeForActivationHttp](https://support.soraco.co/hc/en-us/articles/360000491863)
* Call [ActivateLicenseBAuthorizationCodeHttp](https://support.soraco.co/hc/en-us/articles/360000491843)
