# CheckinLicense

### Description

Checks in a license to the license server. If the client is offline and the offline expiry period was not reached, no check-in occurs.

```c#
bool CheckinLicense(out string message);
```

### Parameters

| Parameter |  Type  | Description                               |
| --------- | :----: | ----------------------------------------- |
| message   | string | a returned message with error information |

### Returns

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
