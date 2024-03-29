# ReadLicenseFile

### Description

Reads the license file generated by the License Server, validates the signature of the license file and populates the ILicenseInfo object.

```csharp
ILicenseInfo ReadLicenseFile(string licenseFile, string computerID, 
                             out string errorMessage)
```

### Arguments

| Name         | Data Type | Description                                               |
| ------------ | :-------: | --------------------------------------------------------- |
| licenseFile  |   string  | path to the license file generated by the license server. |
| computerID   |   string  | ID of the computer where the license is being validated.  |
| errorMessage |   string  | error message if the operation failed.                    |

### Return

|              Data Type              | Description                    |
| :---------------------------------: | ------------------------------ |
| [ILicenseInfo](../../ilicenseinfo/) | populated ILicenseInfo object. |

### Remarks

You must set the RsaPublicKey property before calling ReadLicenseFile.
