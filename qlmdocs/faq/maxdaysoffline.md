# MaxDaysOffline

### Overview

If you'd like your users to connect to your License Server regularly to continue using your software, you can set the MaxDaysOffline property to the number of days they can remain offline.

### Validation at startup

If you enable [server-side license validation](server-side-license-validation.md), and you're using the LicenseValidator class, when your application starts up, the LicenseValidator class attempts to connect to the License Server.

If the connection to the License Server fails, the value of MaxDaysOffline determines the behavior of the response. For example, if MaxDaysOffline is set to 5 days, the LicenseValidator class will not flag an error if the connection to the server fails for 5 consecutive days. On day 6, if the user attempts to start the application and the application is not able to connect to the License Server, the LicenseValidator.ValidateLicenseAtStartup will fail.

### Background validation

If the application was already running on day 6, the property QlmOfflinePeriodExceededAction specifies what action QLM should take if it is not able to connect to the License Server. Note that QLM has an internal timer that tries to connect to the License Server once per day.&#x20;

QlmOfflinePeriodExceededAction can be set to: DoNothing, ExitApp, FireEvent, ThrowException

DoNothing: as per the name, no action will be taken.

ExitApp: QLM will exit the application.

FireEvent: QLM will fire an event (only supported in .NET apps).

ThrowException: QLM will throw an exception (only recommended in .NET apps).

&#x20;

### How to set MaxDaysOffline

The MaxDaysOffline property can be set from the QLM Management Console / Protect Your Application wizard or programmatically by setting the [MaxDaysOffline](maxdaysoffline.md) property. Once you set the property, you must regenerate the LicenseValidator class and the XML Settings file, then update your application with these files.

&#x20;

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360071860252/mceclip1.png)
