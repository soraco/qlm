# SetUserDataInActivationLog

### Description

Sets the user data field associated with an activation key and a computer ID. This method should be used for multiple activations keys.

```c#
bool SetUserDataInActivationLog (string webServiceUrl, string activationKey, 
                                 string computerID, string userData, 
                                 out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                         |
| ------------- | :----: | ----------------------------------- |
| webServiceUrl | string | URL to the QLM License Server       |
| activationKey | string | the activation key                  |
| computerID    | string | the unique identifier of the system |
| userData      | string | the user data to set                |
| errorMessage  | string | returned error message              |

### Return

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | true if successful; otherwise false. |
