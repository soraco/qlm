# CheckoutLicense

### Description

Checks out a license from the server. If the client is in offline mode and the offline expiry was not reached, no checkout is actually performed.

```csharp
ILicenseInfo CheckoutLicense(out string message)
```

### Parameters

| Parameter |  Type  | Description                               |
| --------- | :----: | ----------------------------------------- |
| message   | string | a returned message with error information |

### Return

| Type                         | Description                |
| ---------------------------- | -------------------------- |
| [ILicenseInfo](doc:overview) | License Information object |
