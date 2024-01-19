# IsLicenseKeyActivated

### Description

Checks if the provided license key has been activated on the specified system.

```c#
   bool IsLicenseKeyActivated (string webServiceUrl, 
                               string activationKey, 
                               string computerID )
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | activation key                |
| computerID    | string | the computerID to verify      |

### Return

| Type | Description                                            |
| ---- | ------------------------------------------------------ |
| bool | true if the license key is activated; false otherwise. |
