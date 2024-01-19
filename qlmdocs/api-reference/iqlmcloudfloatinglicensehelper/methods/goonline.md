# GoOnline

### Description

Configures the client for online mode.

```c#
bool GoOnline(bool testConnection, out string errorMessage
```

### Parameters

| Parameter      |  Type  | Description                                                                                              |
| -------------- | :----: | -------------------------------------------------------------------------------------------------------- |
| testConnection |  bool  | when true, the server is pinged before attempting to go online to make sure that we can reach the server |
| errorMessage   | string | a returned message with error information                                                                |

### Returns

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
