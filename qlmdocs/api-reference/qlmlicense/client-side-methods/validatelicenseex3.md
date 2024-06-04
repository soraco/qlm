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

| Data Type | Description                                                                                                                            |
| :-------: | -------------------------------------------------------------------------------------------------------------------------------------- |
|   string  | A message indicating the result of the validation. Do not parse this message. Use GetStatus to get the exact status of the validation. |

### Remarks

Prior to calling this function, you must:

* Call [DefineProduct](defineproduct.md)
* Set the PublicKey property

You can call this function for any type of license key. If the license key is not computer-bound, set the ComputerID to an empty string.

After calling this function, call [GetStatus ](getstatus.md)to get the status of the call.

### Example

{% code overflow="wrap" %}
```csharp
string returnMsg = license.ValidateLicenseEx3(licenseKey, ELicenseBinding.ComputerName, false, false);
bool ret = false;
bool needsActivation = true;

int nStatus = (int)license.GetStatus();

if (IsTrue(nStatus, (int)ELicenseStatus.EKeyInvalid) ||
    IsTrue(nStatus, (int)ELicenseStatus.EKeyProductInvalid) ||
    IsTrue(nStatus, (int)ELicenseStatus.EKeyMachineInvalid) ||
    IsTrue(nStatus, (int)ELicenseStatus.EKeyExceededAllowedInstances) ||
    IsTrue(nStatus, (int)ELicenseStatus.EKeyTampered))
{
    // the key is invalid
    ret = false;
}
else if (IsTrue(nStatus, (int)ELicenseStatus.EKeyVersionInvalid))
{
    // wrongProductVersion
    ret = false;
}
else if (IsTrue(nStatus, (int)ELicenseStatus.EKeyDemo))
{
    // The key has an expiry date

    if (IsTrue(nStatus, (int)ELicenseStatus.EKeyExpired))
    {
        // the key has expired
        ret = false;        
    }
    else
    {
        // the key is still valid
        ret = true;
        // call license.DaysLeft to get the remaining days
    }
}
else if (IsTrue(nStatus, (int)ELicenseStatus.EKeyPermanent))
{
    // the key is valid and permanent
    ret = true;
}

if (ret == true)
{

    if (license.IsActivationLicense (license.LicenseType))
    {
        needsActivation = true;
        ret = false;
    }                
}
```
{% endcode %}
