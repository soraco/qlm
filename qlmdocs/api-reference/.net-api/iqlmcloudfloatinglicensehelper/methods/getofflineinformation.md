# GetOfflineInformation

### Description

Get the time a client has been offline offline.&#x20;

```csharp
bool GetOfflineInformation(out double period, out DateTime startTime)
```

### Parameters

<table><thead><tr><th width="188.33333333333326">Parameter</th><th align="center">Type</th><th>Description</th></tr></thead><tbody><tr><td>period</td><td align="center">double</td><td>the period in minutes that the client has been offline. </td></tr><tr><td>startTime</td><td align="center">DateTime</td><td>The start time when the client went offline</td></tr></tbody></table>

### Returns

| Type    | Description                                         |
| ------- | --------------------------------------------------- |
| Boolean | true if the information was successfully retrieved. |
