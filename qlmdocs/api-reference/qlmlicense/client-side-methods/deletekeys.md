# DeleteKeys

### Description

Deletes the license keys stored on the end-user system with the StoreKeys API. To store keys, use the StoreKeys API. To read the stored keys, use the ReadKeys API.

```csharp
void DeleteKeys ()
```

### Remarks

You must call DefineProduct before calling DeleteKeys.

DeleteKeys may fail to delete keys stored at the MACHINE level if the user invoking DeleteKeys does not have enough privileges to delete data stored at the MACHINE level. To ensure that DeleteKeys is able to delete keys stored at the MACHINE level, the process running the delete must run with elevated privileges.

For testing purposes, you can use the QlmDeleteKeys.exe application to remove keys from a given system. The QlmDeleteKeys.exe will request elevated privileges when it is launched.

Additionally, the Deactivate License option in the QLM License Wizard internally calls DeleteKeys. To ensure that keys are deleted at the MACHINE level, you should launch the QLMLicenseWizard.exe using the QlmLicense.LaunchProcess method while setting the elevated privileges flag to true.
