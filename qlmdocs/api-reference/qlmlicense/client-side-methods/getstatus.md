# GetStatus

### Description

Returns the last license validation status. See [ELicenseStatus ](../enums/elicensestatus.md)for possible values.

```csharp
int GetStatus ()
```

### Return

| Data Type | Description |
| :-------: | ----------- |
|    int    | the status  |

### Remarks

You must always call this function after calling ValidateLicense or ValidateLicenseEx to get the result of the validation.
