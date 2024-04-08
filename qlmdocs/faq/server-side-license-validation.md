# Server-side license validation

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

The properties mentioned above can be set programmatically or from the Protect Your Application wizard as shown in the screenshots below. Remember to regenerate the LicenseValidator class and the XML settings file after modifying these properties.

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360024128692/mceclip0.png)
