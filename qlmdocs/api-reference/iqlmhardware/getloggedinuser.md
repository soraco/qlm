# GetLoggedInUser

### Description

Gets the name of the currently logged-in user. This function is only available on Windows.

```c#
string GetLoggedInUser(out string errorMessage)
```

### Parameters

| Parameter |  Type  | Description                                                     |
| --------- | :----: | --------------------------------------------------------------- |
| message   | string | return error message if there was an error during the operation |

### Return

| Type   | Description                            |
| ------ | -------------------------------------- |
| string | returns the name of the logged in user |
