# FormatLicenseKeyEx

### Description

Formats a license key by adding dashes to the key, based on the values of groupSize and maxGroupSize.

```csharp
string FormatLicenseKeyEx (string licenseKey, int groupSize, int maxGroupSize)
```

### Arguments

| Name         |                                                                 Description                                                                 |
| ------------ | :-----------------------------------------------------------------------------------------------------------------------------------------: |
| licenseKey   |                                                          the license key to format                                                          |
| groupSize    |                                        the number of characters after which a dash should be inserted                                       |
| maxGroupSize | the maximum number of characters after which a dash should be inserted. Used for the last section of the key after all sections are created |

### Return

| Type   | Description              |
| ------ | ------------------------ |
| string | A formatted license key. |

### Remarks

The QLM License Server automatically formats license keys using the same API. On the server-side, groupSize and maxGroupSize can be configured via the QLM Server Properties.

### Example

```
License Key: BMTP0R0S00GHAJ2K8NDQ171116H9TCB97XQKTBS26M
Group Size: 5
Max Group Size: 9
Formatted Key: BMTP0-R0S00-GHAJ2-K8NDQ-17111-6H9TC-B97XQ-KTBS26M
```
