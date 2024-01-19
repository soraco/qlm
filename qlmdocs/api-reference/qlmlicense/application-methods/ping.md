# Ping

### Description

Pings the License Server and returns the UTC date on the server.

```c#
bool Ping(string webServiceUrl, 
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

| Type | Description                       |
| ---- | --------------------------------- |
| bool | true if the server is accessible. |

## Remarks

It is recommended to use the new [PingEx](https://soraco.readme.io/reference/pingex) method which has a faster timeout.
