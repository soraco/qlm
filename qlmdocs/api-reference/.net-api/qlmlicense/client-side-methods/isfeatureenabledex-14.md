# IsLicenseTypeACloudLicense

### Description

Returns whether the provided license type is a cloud floating license

This API requires the use of QLM Engine version 6.0.00 or higher.

```csharp
 bool IsLicenseTypeACloudLicense(ELicenseType licenseType)
```

### Arguments

| Name        |               Data Type               | Description            |
| ----------- | :-----------------------------------: | ---------------------- |
| licenseType | <pre><code>ELicenseType
</code></pre> | license type to verify |

### Return

| Data Type | Description                                          |
| :-------: | ---------------------------------------------------- |
|    bool   | true if the license type is a cloud floating license |
