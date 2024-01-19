# ValidateLicenseOnServerEx2

### Description

Performs the following validations on the License Server

* Checks if the time on the client system is synchronized with the License Server.
* Calls IsLicenseKeyRevokedEx to check if the license was revoked in which case the Activation Key and Computer Key are automatically deleted from the local system.
* Calls IsIllegalComputer to check whether the ActivationKey and ComputerKey are registered in the database. If the computer is detected as an illegal computer, the Activation Key and Computer Key are automatically deleted from the local system.
* If the server reports that the license has expired, the Computer Key stored on the local system is deleted.
* Publishes Analytics to the server if PublishAnalytics is set to true.
* Records the last time connection to the server was made in order to enforce the MaxDaysOffline setting.
* Verifies whether the system has exceeded the MaxDaysOffline setting.
* Returns whether the server has more up-to-date values for the SubscriptionExpiryDate, Features, and FloatingSeats.

```csharp
 bool ValidateLicenseOnServerEx2 (string webServiceUrl, 
                               string activationKey, 
                               string computerKey, 
                               string computerID, 
                               string computerName, 
                               bool autoReactivate, 
                               out EServerErrorCode errorCode, 
                               out string returnMsg)
```

### Parameters

| Parameter      |       Type       | Description                                                                                                                    |
| -------------- | :--------------: | ------------------------------------------------------------------------------------------------------------------------------ |
| webServiceUrl  |      string      | URL to the QLM License Server                                                                                                  |
| activationKey  |      string      | the license key to activate                                                                                                    |
| computerKey    |      string      | the computer bound key                                                                                                         |
| computerID     |      string      | the unique computer identifier                                                                                                 |
| computerName   |      string      | the name of the computer. If you pass an empty string, QLM will automatically extract the computer name of the current system. |
| autoReactivate |       bool       | if true, this function will automatically try to reactivate the license if it's not registered on the server.                  |
| errorCode      | EServerErrorCode | returned error code                                                                                                            |
| returnMsg      |      string      | returned error message                                                                                                         |

### Return

| Type | Description                   |
| ---- | ----------------------------- |
| bool | true if the license is valid. |

### Example

```c#
LicenseValidator lv = new LicenseValidator (settingsFile);

ILicenseInfo li = new LicenseInfo();
string serverMessage = string.Empty;
EServerErrorCode errorCode;

bool result = lv.QlmLicenseObject.ValidateLicenseOnServerEx2(string.Empty, activationKey, computerKey, computerID, Environment.MachineName, false, ref li, out errorCode, out serverMessage);

bool reactivate =  (li.NewExpiryDate != DateTime.MinValue) ||
 !String.IsNullOrEmpty(li.NewFeatures) ||
 (li.NewFloatingSeats != -1);

if (reactivate)

{

// Reactivate the key 

}
```
