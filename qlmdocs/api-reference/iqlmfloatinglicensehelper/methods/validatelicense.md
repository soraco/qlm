# ValidateLicense

### Description

Validate the license stored in the floating license database (XML or DB) and extract the total number of floating seats and consumed seats. This function should be called after the floating license DB has been initialized and the license has been activated.

```csharp
bool ValidateLicense(out bool reRegisterLicense, out bool reRegisterDb,
                     out QlmActivationStatus activationStatus, out string message)
```

### Parameters

| Parameter         |                                      Type                                     | Description                                                          |
| ----------------- | :---------------------------------------------------------------------------: | -------------------------------------------------------------------- |
| reRegisterLicense |                                      bool                                     | return flag indicating the license must be reactivated               |
| reRegisterDb      |                                      bool                                     | return flag indicating the floating license DB must be re-registered |
| activationStatus  | [QlmActivationStatus](https://soraco.readme.io/reference/qlmactivationstatus) | return flag indicating the current activation status                 |
| message           |                                     string                                    | error message if there was an error during the operation             |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the operation was successful; otherwise, false. |
