# ReactivateKey

### Description

Validates a license

```c#
virtual bool ReactivateKey(string computerID)
```

### Parameters

| Parameter  |  Type  | Description                                                                                       |
| ---------- | :----: | ------------------------------------------------------------------------------------------------- |
| computerID | string | the unique computer identifier. The computerID is used when licenseBinding is set to UserDefined. |

### Return

| Type | Description                                   |
| ---- | --------------------------------------------- |
| bool | true if the license is valid; false otherwise |

### Remarks

Reactivates a license key in order to apply the latest server updates to the client. This is required when the following updates are performed on the server:

* The expiry date is updated
* The enabled features are updated
* The number of seats is updated
