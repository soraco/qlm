# IsLicenseKeyRevoked

### Description

Checks if the provided license key is valid.

```c#
  bool IsLicenseKeyRevoked (string webServiceUrl, 
                            string activationKey )
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | activation key                |

### Return

| Type | Description                                           |
| ---- | ----------------------------------------------------- |
| bool | true if the license key was revoked; false otherwise. |
