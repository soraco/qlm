# CreateDeactivationCode

### Description

Creates a deactivation verification code.

```csharp
string CreateDeactivationCode(string activationKey, string computerID, 
                              ELicenseBinding licenseBinding)
```

### Arguments

| Name           |                    Data Type                   | Description                                                                                                                                                 |
| -------------- | :--------------------------------------------: | ----------------------------------------------------------------------------------------------------------------------------------------------------------- |
| activationKey  |                     string                     | the activation key to be deactivated                                                                                                                        |
| computerID     |                     string                     | the computerID of the computer being deactivated. This value can be empty if the LicenseBinding argument is set to a specific value.                        |
| licenseBinding | [ELicenseBinding](../enums/elicensebinding.md) | the license binding value. The computerID will be calculated based on the license binding value. This parameter is not required if computerID is specified. |

### Return

| Type   | Description                        |
| ------ | ---------------------------------- |
| string | the deactivation verification code |

## Remarks

A deactivation verification code is used to confirm that a user has indeed deactivated his/her license from a computer that is offline. If you are using your own user interface for activation/deactivation, you can use this function to generate a deactivation verification code. After the user deactivates his/her license, you need to display the code to the user and ask the user to send you that code.

You can then use the Deactivation code in 3 different contexts:

* When deactivating a key from the QLM Management Console / Manage Keys / Deactivate
* When deactivating a key from the QLM Portal / Release
* When deactivating a key from the QLM Self Help. To enable the DVC in the QLM Self Help, you must set the [Server Property ](../../../qlm-license-server/server-properties.md)customerSite/showDeactivationVerificationCode to true.

Note that a deactivation verification code expires in 1 day.

To create your own function to calculate the deactivation code, you need to compute the MD5 hash of the following concatenated strings

Activation Key (without dashes)|ComputerID|CommunicationEncryptionKey|Current date (yyyy-MM-dd)
