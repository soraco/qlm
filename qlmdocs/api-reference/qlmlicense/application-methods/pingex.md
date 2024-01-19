# PingEx

### Description

Pings the License Server and returns the UTC date on the server.

```csharp
bool PingEx(string webServiceUrl, 
          out string response, 
          out DateTime serverDate)
```

### Parameters

| Parameter     |     Type     | Description                         |
| ------------- | :----------: | ----------------------------------- |
| webServiceUrl |    string    | URL to the QLM License Server       |
| response      |  out string  | the response from the server        |
| serverDate    | out DateTime | the date/time on the server in UTC. |

### Return

| Type   | Description                       |
| ------ | --------------------------------- |
| string | true if the server is accessible. |

### Remarks

This function is recommended over the Ping method as it will timeout in a faster, more reliable way. You can configure the timeout by setting the QlmLicense.Timeout property.

###
