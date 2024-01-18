# ValidateLicense

### Description

Validates a license

```c#
 virtual bool ValidateLicense(string activationKey, string computerKey, string computerID, 
                              ref bool needsActivation, ref string returnMsg)
```

### Parameters

| Parameter       |  Type  | Description                                                                                       |
| --------------- | :----: | ------------------------------------------------------------------------------------------------- |
| activationKey   | string | the activation key                                                                                |
| computerKey     | string | the computer bound key                                                                            |
| computerID      | string | the unique computer identifier. The computerID is used when licenseBinding is set to UserDefined. |
| needsActivation |  bool  | returned flag indicating whether the license needs to be activated                                |
| returnMsg       | string | message returned by the license validation operation                                              |

### Return

| Type | Description                                   |
| ---- | --------------------------------------------- |
| bool | true if the license is valid; false otherwise |

### Remarks

This function perform a local license validation without contacting the server.
