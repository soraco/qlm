# ValidateLicense

### Description

Validates a license key.

```csharp
string ValidateLicense (string LicenseKey)
```

### Arguments

| Name       | Data Type | Description             |
| ---------- | :-------: | ----------------------- |
| licenseKey |   string  | license key to validate |

### Return

| Data Type | Description                                                                                    |
| :-------: | ---------------------------------------------------------------------------------------------- |
|   string  | Error message if ValidateLicense fails to validate or if the license is an evaluation license. |

### Remarks

Prior to calling this function, you must:

* Call [DefineProduct](defineproduct.md)
* Set the PublicKey property

After calling this function, call [GetStatus ](getstatus.md)to get the status of the call.
