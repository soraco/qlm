# Load

### Description

After initializing the QlmFloatingLicenseHelper by calling the Init function, you must call the Load method to load the floating license database and validate the license.

```csharp
bool Load(out bool reRegisterLicense, out bool reRegisterDb, 
          out bool isOffline, out bool wasOffline,
          out QlmActivationStatus activationStatus, out string errorMessage, 
          out string offlineError)
```

### Parameters

| Parameter         |                                      Type                                     | Description                                                            |
| ----------------- | :---------------------------------------------------------------------------: | ---------------------------------------------------------------------- |
| reRegisterLicense |                                      bool                                     | return flag indicating the license must be reactivated                 |
| reRegisterDb      |                                      bool                                     | return flag indicating the floating license DB must be re-registered   |
| isOffline         |                                      bool                                     | return flag indicating the system is offline                           |
| wasOffline        |                                      bool                                     | return flag indicating the system was offline but is currently online  |
| activationStatus  | [QlmActivationStatus](https://soraco.readme.io/reference/qlmactivationstatus) | return flag indicating the current activation status                   |
| errorMessage      |                                     string                                    | return error message if there was an error during the validation       |
| offlineError      |                                     string                                    | return error message if there was an error related to the offline mode |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the operation was successful; otherwise, false. |
