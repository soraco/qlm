# ReadKeys

### Description

Reads the license keys stored on the end-user system with the StoreKeys API.

```csharp
bool ReadKeys (ref string activationKey, ref string computerKey)
```

### Arguments

| Name          | Data Type | Description                   |
| ------------- | :-------: | ----------------------------- |
| activationKey |   string  | the stored activation key     |
| computerKey   |   string  | the stored computer bound key |

### Return

| Data Type | Description                     |
| :-------: | ------------------------------- |
|    bool   | true if the call was successful |

### Remarks

To store keys, use the StoreKeys API. To clear the stored keys, use the DeleteKeys API.

Use the FavorMachineLevelLicenseKey to control which key takes precedence if the keys are stored at the user and machine levels.

The function returns true if either an activationKey or a computerKey was read, otherwise, it returns false.
