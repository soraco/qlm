# GoOffline

### Description

Configures the client for offline mode. You must specify the period in minutes that the client will go offline. After this period, an event will be fired and your application can take any action as needed.

```csharp
bool GoOffline(double period, out string errorMessage);
```

### Parameters

<table><thead><tr><th width="612.3333333333333">Parameter</th><th align="center">Type</th><th>Description</th></tr></thead><tbody><tr><td>period</td><td align="center">double</td><td>the period in minutes that the client will go offline. After this period, an event will be fired.</td></tr><tr><td>errorMessage</td><td align="center">string</td><td>a returned message with error information</td></tr></tbody></table>

### Returns

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
