# GetUniqueCombinedSystemIdentifier

### Description

Gets a unique system identifier that is a combination of different IDs based on the license-binding argument.

```c#
string GetUniqueCombinedSystemIdentifier(int licenseBinding)
```

### Parameters

| Parameter      | Type | Description                                                 |
| -------------- | :--: | ----------------------------------------------------------- |
| licenseBinding |  int | An OR'ed value of a combination of ELicenseBinding options. |

### Return

| Type   | Description                   |
| ------ | ----------------------------- |
| string | returns the unique identifier |
