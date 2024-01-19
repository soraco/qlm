# SetUserData

### Description

Sets the user data field associated with an activation key.

```csharp
bool SetUserData (string webServiceUrl, 
                  string activationKey, 
                  string userData, 
                  out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | the activation key.           |
| userData      | string | the user data to set          |
| errorMessage  | string | returned error message        |

### Return

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | true if successful; otherwise false. |
