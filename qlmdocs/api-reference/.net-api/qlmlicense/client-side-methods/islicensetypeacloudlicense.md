# IsLicenseTypeACloudLicense

### Description

Returns whether the provided license type is a cloud floating license

This API requires the use of QLM Engine version 6.0.00 or higher.

```csharp
 bool IsLicenseTypeACloudLicense(ELicenseType licenseType)
```

### Arguments

<table><thead><tr><th>Name</th><th align="center">Data Type</th><th>Description</th></tr></thead><tbody><tr><td>licenseType</td><td align="center"><pre><code>ELicenseType
</code></pre></td><td>license type to verify</td></tr></tbody></table>

### Return

| Data Type | Description                                          |
| :-------: | ---------------------------------------------------- |
|    bool   | true if the license type is a cloud floating license |
