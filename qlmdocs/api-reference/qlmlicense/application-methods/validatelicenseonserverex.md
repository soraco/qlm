# ValidateLicenseOnServerEx

### Description

Performs the following validations on the License Server

* Checks if the time on the client system is synchronized with the License Server.
* Calls IsLicenseKeyRevokedEx to check if the license was revoked.
* Calls IsIllegalComputer to check if the license is registered in the database.
* Publishes Analytics to the server if PublishAnalytics is set to true.
* Records the last time connection to the server was made in order to enforce the MaxDaysOffline setting.
* Verifies whether the system has exceeded the MaxDaysOffline setting.

```csharp
 bool ValidateLicenseOnServerEx (string webServiceUrl, 
                               string activationKey, 
                               string computerKey, 
                               string computerID, 
                               string computerName, 
                               bool autoReactivate, 
                               out EServerErrorCode errorCode, 
                               out string returnMsg)
```

### Parameters

| Parameter      |       Type       | Description                                                                                                                     |
| -------------- | :--------------: | ------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl  |      string      | URL to the QLM License Server                                                                                                   |
| activationKey  |      string      | the license key to activate                                                                                                     |
| computerKey    |      string      | the computer bound key                                                                                                          |
| computerID     |      string      | the unique computer identifier                                                                                                  |
| computerName   |      string      | the name of the computer.                                                                                                       |
| autoReactivate |       bool       | when true, if the license is not activated on the server, it will be automatically reactivated if licenses are still available. |
| errorCode      | EServerErrorCode | returned error code                                                                                                             |
| returnMsg      |      string      | returned error message                                                                                                          |

### Return

| Type | Description                   |
| ---- | ----------------------------- |
| bool | true if the license is valid. |
