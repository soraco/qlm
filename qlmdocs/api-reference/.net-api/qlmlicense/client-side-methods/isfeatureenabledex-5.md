# IsLicenseKeyACloudLicense

### Description

Returns whether the provided license key is a cloud floating license&#x20;

This API requires the use of QLM Engine version 6.0.00 or higher.

```csharp
 bool IsLicenseKeyACloudLicense(string licenseKey)
```

### Arguments

| Name       | Data Type | Description           |
| ---------- | :-------: | --------------------- |
| licenseKey |  string   | license key to verify |

### Return

| Data Type | Description                                            |
| :-------: | ------------------------------------------------------ |
|    bool   | true if the license model is a cloud floating license  |
