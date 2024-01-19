# ValidateLicenseEx3

### Description

Validates a computer-bound license key.

```csharp
string ValidateLicenseEx3 (string LicenseKey, ELicenseBinding licenseBinding,
                           bool skipWrites, bool skipExpiryValidation)
```

### Arguments

| Name                 |                               Data Type                               | Description                                                                         |
| -------------------- | :-------------------------------------------------------------------: | ----------------------------------------------------------------------------------- |
| computerKey          |                                 string                                | computer-bound license key                                                          |
| licenseBinding       | [ELicenseBinding](https://soraco.readme.io/reference/elicensebinding) | license binding type                                                                |
| skipWrites           |                                  bool                                 | Do not write any data on the end user system. Should be set to false in most cases. |
| skipExpiryValidation |                                  bool                                 | Do not check for expiry of the license. Should be set to false in most cases.       |

### Return

| Data Type | Description                       |
| :-------: | --------------------------------- |
|   string  | Error message if validation fails |

### Remarks

Prior to calling this function, you must:

* Call [DefineProduct](https://soraco.readme.io/reference/defineproduct)
* Set the PublicKey property

You can call this function for any type of license key. If the license key is not computer-bound, set the licenseBinding argument to None.

After calling this function, call [GetStatus ](https://soraco.readme.io/reference/getstatus)to get the status of the call.
