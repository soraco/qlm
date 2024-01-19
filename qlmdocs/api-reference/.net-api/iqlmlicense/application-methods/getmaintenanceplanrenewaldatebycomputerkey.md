# GetMaintenancePlanRenewalDateByComputerKey

### Description

Gets the maintenance plan renewal date given a computer key.

```c#
DateTime GetMaintenancePlanRenewalDateByComputerKey (string webServiceUrl, 
                                                     string computerKey)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| computerKey   | string | the computer bound key        |

### Return

| Type     | Description                                                                                                                                                |
| -------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------- |
| DateTime | maintenance plan renewal date in UTC. In the event the maintenance plan date is not set, the return value is set to DateTime.MinValue which is Jan 1 0001. |
