# UnregisterNode

### Description

Releases a floating license. You should call this function when you exit your application.

```c#
bool UnregisterNode(out string message)
```

### Parameters

| Parameter |  Type  | Description                                                          |
| --------- | :----: | -------------------------------------------------------------------- |
| message   | string | return error message if there was an error during the unregistration |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the operation was successful; otherwise, false. |
