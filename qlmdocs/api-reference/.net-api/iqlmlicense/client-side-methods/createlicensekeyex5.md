# CreateLicenseKeyEx5

### Description

Creates a computer-bound license key that has an expiry date, a number of licenses, and a specific set of features that are enabled. This API is functionally identical to CreateLicenseKeyEx4. It was created to accommodate programming languages such as VB6 that cannot handle the array data type used in CreateLicenseKeyEx4.

```c#
string CreateLicenseKeyEx5 (System.DateTime expiryDate, int expiryDuration, 
                            int numberOfLicenses, ELicenseType licenseType, 
                            string machineID, string Features)
```

```c++
_bstr_t CreateLicenseKeyEx5 (DATE expiryDate, int expiryDuration, 
                             int numberOfLicenses, ELicenseType licenseType, 
                             BSTR machineID, BSTR features)
```

### Arguments

\[block:parameters] { "data": { "h-0": "Name", "h-1": "Data Type", "h-2": "Description", "0-0": "expiryDate", "0-1": "DateTime", "0-2": "The date when the license will expire. Use DateTime.MinValue if you do not want to specify an expiry date.", "1-0": "expiryDuration", "1-1": "int", "1-2": "The duration of the evaluation/subscription period is in days. Use -1 if you do not want to specify a duration.", "2-0": "NumberOfLicenses", "2-1": "int", "2-2": "The number of licenses associated with the key. Use 1 if you do not want to use single activation licensing.", "3-0": "licenseType", "3-1": "[ELicenseType](https://soraco.readme.io/reference/elicensetype)", "3-2": "Specify the type of license to generate.", "4-0": "machineID", "4-1": "string", "4-2": "A unique identifier for the machine. If you specify a ComputerName as the LicenseType, this argument must be the Computer Name. If you specify User Defined as the LicenseType, this argument can be anything you want. When validating the license key in your code, you will need to provide the same value to the ValidateLicenseEx function.", "5-0": "features", "5-1": "string", "5-2": "A set of features to be enabled using the following syntax: \n :;: \nExample: "0:8;1:2;3:14" - Enables: feature id 8 in feature set 0, feature id 2 in feature set 1, and feature ids 2, 4, 8 (2 + 4 + 8 = 14) in feature set 3. \nTo combine features, perform a bitwise OR operation on the required features." }, "cols": 3, "rows": 6, "align": \[ "left", "center", "left" ] } \[/block]

### Return

| Type   | Description                  |
| ------ | ---------------------------- |
| string | a computer-bound license key |

## Remarks

Prior to calling this function, you must call DefineProduct and set the PrivateKey property. Note that including the PrivateKey in your code is not recommended. Creation of license keys should never be done from within the application but rather from a server that the user does not have access to.
