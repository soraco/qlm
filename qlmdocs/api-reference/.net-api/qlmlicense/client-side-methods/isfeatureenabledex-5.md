# IsLicenseKeyAFloatingLicense

### Description

Returns whether the provided license key is an on-premise floating license&#x20;

This API requires the use of QLM Engine version 6.0.00 or higher.

```csharp
 bool IsLicenseKeyAFloatingLicense(string licenseKey)
```

### Arguments

| Name       | Data Type | Description           |
| ---------- | :-------: | --------------------- |
| licenseKey |  string   | license key to verify |

### Return

| Data Type | Description                                                  |
| :-------: | ------------------------------------------------------------ |
|    bool   | true if the license model is an on-premise floating license  |
