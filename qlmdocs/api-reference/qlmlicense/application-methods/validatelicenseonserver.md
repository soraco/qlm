# ValidateLicenseOnServer

### Description

Performs the following validations on the License Server:

* Checks if the time on the client system is synchronized with the License Server.
* Calls IsLicenseKeyRevokedEx to check if the license was revoked.
* Calls IsIllegalComputer to check if the license is registered in the database.
* Publishes Analytics to the server if PublishAnalytics is set to true.
* Records the last time connection to the server was made in order to enforce the MaxDaysOffline setting.
* Verifies whether the system has exceeded the MaxDaysOffline setting.

```csharp
 bool ValidateLicenseOnServer (string webServiceUrl, 
                               string activationKey, 
                               string computerKey, 
                               string computerID, 
                               out EServerErrorCode errorCode, 
                               out string returnMsg)
```

### Parameters

| Parameter     |                       Type                       | Description                    |
| ------------- | :----------------------------------------------: | ------------------------------ |
| webServiceUrl |                      string                      | URL to the QLM License Server  |
| activationKey |                      string                      | the license key to validate    |
| computerKey   |                      string                      | the computer bound key         |
| computerID    |                      string                      | the unique computer identifier |
| errorCode     | [EServerErrorCode](../enums/eservererrorcode.md) | returned error code            |
| returnMsg     |                      string                      | returned error message         |

### Return

| Type | Description                   |
| ---- | ----------------------------- |
| bool | true if the license is valid. |

### Remarks

If validation fails, errorCode and returnMsg provide additional details.
