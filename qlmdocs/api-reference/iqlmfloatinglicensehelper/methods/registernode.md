# RegisterNode

### Description

Activates a floating license. This will consume one floating license, if available. You should call this function when your application is launched.

If the function returns QlmActivationStatus.Activated or QlmActivationStatus.AlreadyActivated, you can proceed with the launch of your application.

Any other value would indicate an issue and you should abort the launch of your application.

```csharp
QlmActivationStatus RegisterNode(out string message)
```

### Parameters

| Parameter |  Type  | Description                                                        |
| --------- | :----: | ------------------------------------------------------------------ |
| message   | string | return error message if there was an error during the registration |

### Return

| Type                                                                          | Description              |
| ----------------------------------------------------------------------------- | ------------------------ |
| [QlmActivationStatus](https://soraco.readme.io/reference/qlmactivationstatus) | status of the activation |
