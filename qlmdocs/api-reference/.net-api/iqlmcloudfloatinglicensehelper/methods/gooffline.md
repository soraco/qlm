# GoOffline

### Description

Configures the client for offline mode. You must specify the period in minutes that the client will go offline. After this period, an event will be fired and your application can take any action as needed.

```c#
bool GoOffline(double period, out string errorMessage);
```

### Parameters

| Parameter    |  Type  | Description                                                                                       |
| ------------ | :----: | ------------------------------------------------------------------------------------------------- |
| period       | double | the period in minutes that the client will go offline. After this period, an event will be fired. |
| errorMessage | string | a returned message with error information                                                         |

### Returns

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
