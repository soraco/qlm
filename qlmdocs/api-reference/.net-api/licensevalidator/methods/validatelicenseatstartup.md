# ValidateLicenseAtStartup

### Description

Validates a license

```csharp
bool ValidateLicenseAtStartup(ELicenseBinding licenseBinding, 
                              ref bool needsActivation, ref string returnMsg)
```

### Parameters

| Parameter       |                               Type                              | Description                                                        |
| --------------- | :-------------------------------------------------------------: | ------------------------------------------------------------------ |
| licenseBinding  | [ELicenseBinding](../../../qlmlicense/enums/elicensebinding.md) | the license binding to use when validating the license             |
| needsActivation |                               bool                              | returned flag indicating whether the license needs to be activated |
| returnMsg       |                              string                             | message returned by the license validation operation               |

### Return

| Type | Description                                   |
| ---- | --------------------------------------------- |
| bool | true if the license is valid; false otherwise |

### Remarks

This function is typically called when your application starts up. It looks for an Activation Key and a Computer Key on the user system. If found, it validates the license and returns the result of the validation.

The validation is a two-step process: client-side validation and server-side validation (optional).

First, the license is validated locally without contacting the server. If the license validation fails because it has expired or the version is wrong, and if [server-side validation ](https://support.soraco.co/hc/en-us/articles/360025213372-Server-side-license-validation)is enabled, ValidateLicenseAtStartup contacts the server and determine whether the expiry date was extended or whether the user has a maintenance plan that entitles use of the installed version of the product.

If the local license validation succeeds, and if [server-side validation ](https://support.soraco.co/hc/en-us/articles/360025213372-Server-side-license-validation)is enabled, ValidateLicenseAtStartup contacts the server and perform 2 sets of operations:

* Determines if the license is valid on the server by checking if:
  * the license is found on the server
  * the license was not revoked on the server
  * the current computer is not detected as [illegal](https://support.soraco.co/hc/en-us/articles/360042944151-Fraud-Detection-Illegal-Computers-and-Activation-Attempts)
  * the client system date is identical to the server's system date, within a specified threshold
* Determines if there were changes to the license on the server-side that need to be applies to the client:
  * the license expiry date was updated on the server
  * the features associated with the license were updated on the server
  * the number of seats associated with the license were updated on the server

If the server-side validation fails, ValidateLicenseAtStartup returns false and sets the property [ServerErrorCode](../../../qlmlicense/enums/eservererrorcode.md).
