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

| Data Type | Description                                                                                                                            |
| :-------: | -------------------------------------------------------------------------------------------------------------------------------------- |
|   string  | A message indicating the result of the validation. Do not parse this message. Use GetStatus to get the exact status of the validation. |

### Remarks

Prior to calling this function, you must:

* Call [DefineProduct](defineproduct.md)
* Set the PublicKey property

After calling this function, call [GetStatus ](getstatus.md)to get the status of the call.
