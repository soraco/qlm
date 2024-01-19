# CreateLicenseKey

### Description

Creates a non-computer-bound license key.

```csharp
string CreateLicenseKey (System.DateTime expiryDate, int expiryDuration)
```

### Arguments

| Name           | Data Type | Description                                                                                                     |
| -------------- | :-------: | --------------------------------------------------------------------------------------------------------------- |
| expiryDate     |  DateTime | The date when the license will expire. Use DateTime.MinValue if you do not want to specify an expiry date.      |
| expiryDuration |    int    | The duration of the evaluation/subscription period is in days. Use -1 if you do not want to specify a duration. |

### Return

| Type   | Description                        |
| ------ | ---------------------------------- |
| string | the deactivation verification code |

## Remarks

If the expiryDate is NULL and the ExpiryDuration is -1, the license key is a permanent non-evaluation license key.

Prior to calling this function, you must call DefineProduct and set the PrivateKey property. Note that including the PrivateKey in your code is not recommended. Creation of license keys should never be done from within the application but rather from a server that the user does not have access to.
