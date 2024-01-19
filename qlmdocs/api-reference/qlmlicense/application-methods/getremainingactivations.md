# GetRemainingActivations

### Description

Determines how many activations are still available for the given activation key.

```c#
int GetRemainingActivations(string webServiceUrl, string activationKey )
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | activation key                |

### Return

| Type | Description                         |
| ---- | ----------------------------------- |
| int  | the number of remaining activations |
