# CreateLicenseKeyEx5

### Description

Creates a computer-bound license key that has an expiry date, a number of licenses, and a specific set of features that are enabled. This API is functionally identical to CreateLicenseKeyEx4. It was created to accommodate programming languages such as VB6 that cannot handle the array data type used in CreateLicenseKeyEx4.

```csharp
string CreateLicenseKeyEx5 (System.DateTime expiryDate, int expiryDuration, 
                            int numberOfLicenses, ELicenseType licenseType, 
                            string machineID, string Features)
```

### Arguments

<table><thead><tr><th width="206.33333333333331">Name</th><th width="155">Data Type</th><th>Description</th></tr></thead><tbody><tr><td>expiryDate</td><td>DateTime</td><td>The date when the license will expire. Use DateTime.MinValue if you do not want to specify an expiry date.</td></tr><tr><td>expiryDuration</td><td>int</td><td>The duration of the evaluation/subscription period is in days. Use -1 if you do not want to specify a duration.</td></tr><tr><td>NumberOfLicenses</td><td>int</td><td>The number of licenses associated with the key. Use 1 if you do not want to use single activation licensing.</td></tr><tr><td>licenseType</td><td><a href="https://soraco.readme.io/reference/elicensetype">ELicenseType</a></td><td>Specify the type of license to generate.</td></tr><tr><td>machineID</td><td>string</td><td>A unique identifier for the machine. If you specify a ComputerName as the LicenseType, this argument must be the Computer Name. If you specify User Defined as the LicenseType, this argument can be anything you want. When validating the license key in your code, you will need to provide the same value to the ValidateLicenseEx function.</td></tr><tr><td>features</td><td>string</td><td>A set of features to be enabled using the following syntax:<br><br>:;:<br>Example: "0:8;1:2;3:14" - Enables: feature id 8 in feature set 0, feature id 2 in feature set 1, and feature ids 2, 4, 8 (2 + 4 + 8 = 14) in feature set 3.<br>To combine features, perform a bitwise OR operation on the required features.</td></tr></tbody></table>

### Return

| Type   | Description                  |
| ------ | ---------------------------- |
| string | a computer-bound license key |

## Remarks

Prior to calling this function, you must call DefineProduct and set the PrivateKey property. Note that including the PrivateKey in your code is not recommended. Creation of license keys should never be done from within the application but rather from a server that the user does not have access to.
