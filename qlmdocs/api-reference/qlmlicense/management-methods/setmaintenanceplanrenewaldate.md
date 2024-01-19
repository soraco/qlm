# SetMaintenancePlanRenewalDate

### Description

Sets the maintenance plan renewal date. It is recommended to set a UTC date.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool SetMaintenancePlanRenewalDate (string webServiceUrl, string activationKey, 
                                    DateTime maintenancePlanRenewalDate, 
                                    out string errorMessage)
```

### Parameters

| Parameter                  |   Type   | Description                                   |
| -------------------------- | :------: | --------------------------------------------- |
| webServiceUrl              |  string  | URL to the QLM License Server.                |
| activationKey              |  string  | activation key to set the maintenance plan on |
| maintenancePlanRenewalDate | DateTime | the new renewal date of the maintenance plan  |
| errorMessage               |  string  | returned error message                        |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |
