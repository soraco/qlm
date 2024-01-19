# CreateLicenseKeyEx2

### Description

Creates a computer-bound license key that has an expiry date and a number of licenses.

```csharp
string CreateLicenseKeyEx2 (System.DateTime ExpiryDate, int ExpiryDuration, 
                            int NumberOfLicenses, ELicenseType LicenseType, 
                            string MachineID)
```

### Arguments

| Name             |                 Data Type                | Description                                                                                                                                                                                                                                                                                                                                      |
| ---------------- | :--------------------------------------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| expiryDate       |                 DateTime                 | The date when the license will expire. Use DateTime.MinValue if you do not want to specify an expiry date.                                                                                                                                                                                                                                       |
| expiryDuration   |                    int                   | The duration of the evaluation/subscription period is in days. Use -1 if you do not want to specify a duration.                                                                                                                                                                                                                                  |
| NumberOfLicenses |                    int                   | The number of licenses associated with the key. Use 1 if you do not want to use single activation licensing.                                                                                                                                                                                                                                     |
| licenseType      | [ELicenseType](../enums/elicensetype.md) | Specify the type of license to generate.                                                                                                                                                                                                                                                                                                         |
| machineID        |                  string                  | A unique identifier for the machine. If you specify a ComputerName as the LicenseType, this argument must be the Computer Name. If you specify User Defined as the LicenseType, this argument can be anything you want. When validating the license key in your code, you will need to provide the same value to the ValidateLicenseEx function. |

### Return

| Type   | Description                  |
| ------ | ---------------------------- |
| string | a computer-bound license key |

## Remarks

Prior to calling this function, you must call DefineProduct and set the PrivateKey property. Note that including the PrivateKey in your code is not recommended. Creation of license keys should never be done from within the application but rather from a server that the user does not have access to.
