# GetDaysOffline

### Description

The GetDaysOffline method returns the number of days a system has been offline.

```c#
int GetDaysOffline()
```

### Return

| Data Type | Description                               |
| :-------: | ----------------------------------------- |
|    bool   | the number of days the client was offline |

### Remarks

This method requires that MaxDaysOffline be set to a value other than -1.

Note that QLM starts recording offline days when you call QlmLicense.ValidateLicenseOnServer.

QlmLicense.ValidateLicenseOnServer is automatically called if you set the QlmValidateLicenseOnServer property to true in the QLM Management Console / Protect Your Application wizard (see screenshot below).

![](https://files.readme.io/7948fc3-image.png)
