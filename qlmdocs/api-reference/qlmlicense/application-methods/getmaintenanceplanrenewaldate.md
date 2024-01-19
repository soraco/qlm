# GetMaintenancePlanRenewalDate

### Description

Gets the maintenance plan renewal date.

```csharp
  DateTime GetMaintenancePlanRenewalDate (string webServiceUrl, 
                                          string activationKey)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | the activation key            |

### Return

| Type     | Description                                                                                                                                                |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| DateTime | maintenance plan renewal date in UTC. In the event the maintenance plan date is not set, the return value is set to DateTime.MinValue which is Jan 1 0001. |
