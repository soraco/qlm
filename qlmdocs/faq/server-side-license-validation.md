# Server-side license validation

### Overview

Connection to the License Server is only required during the initial activation of the license. Once a license is activated, a computer-bound license key (or license file for non-Windows apps) is stored on the end-user system and used subsequently to validate the license.

If you set the QlmValidateLicenseOnServer property to true, QLM will then try to connect to the server every time the LicenseValidator.ValidateLicenseAtStartup function is called which should be every time you start your application. When QLM connects to the server, the server will verify whether:

* the license expiry date was extended
* the license was revoked
* the license was activated on another computer
* the license was deleted
* Etc.&#x20;

If the license was revoked or activated on another computer, QLM will automatically delete the license keys registered on the end-user system.&#x20;

QLM automatically detects server-side changes such as an extension to the expiry date, a change in the enabled features or an update to the number of floating seats. If a change is detected, the license is automatically reactivated to apply the change to the client.

If the client cannot reach the server, the behaviour can be configured by setting two other properties: QlmMaxDaysOffline and QlmOfflinePeriodExceededAction.

By default, QlmMaxDaysOffline is set to -1 which means that if a client cannot contact the QLM License Server, we will resume and assume everything is OK.

If QlmMaxDaysOffline is set to a specific value, say 5 days, a client who cannot connect for 5 days will continue to run properly until the 6th day. On the 6th day, the action specified by the QlmOfflinePeriodExceededAction property will be performed.

### Enabling Server-Side License Validation

Server-side license validation can be enabled in one of two ways:

* By updating the XML Settings file with the required properties
* Programmatically by setting the required properties

#### Configuring the XML Settings files

To enable server-side license validation:

* Go to the Protect Your Application tab
* Select your product and license server
* Select your programming language
* Set the following properties:
  * QlmMaxDaysOffline:&#x20;
    * 0 to prevent the user from going offline
    * -1 to allow the user to be offline indefinitely
    * n days where n specifies the number of days a user can be offline
  * QlmOfflinePeriodExceededAction: DoNothing | ExitApp | FireEvent | ThrowException
  * QlmValidateLicenseOnServer: true
* Then, generate the XML Settings file and the LicenseValidator class and update your application with these files.

&#x20;

<img src="https://support.soraco.co/hc/article_attachments/360024128692/mceclip0.png" alt="" height="871" width="1031">

#### Enabling server-side validation programmatically

To enable server-side license validation, set the following properies on the QlmLicense object:

{% code overflow="wrap" %}
```csharp
// Assuming you have an instance lv of the LicenseValidator class
lv.QlmLicenseObject.MaxDaysOffline = 30;
lv.QlmLicenseObject.OfflinePeriodExceededAction = EOfflinePeriodExceededAction.ExitApp;
lv.QlmLicenseObject.ValidateOnServer = true;
```
{% endcode %}
