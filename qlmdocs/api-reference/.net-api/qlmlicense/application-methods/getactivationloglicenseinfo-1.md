# GetActivationLogLicenseInfo

### Description

Retrieves information about the activation of a multiple activations license key, for a specific computer.

{% code overflow="wrap" %}
```csharp
  ILicenseInfo GetActivationLogLicenseInfo(string webServiceUrl, 
                                 string activationKey, 
                                 string computerID,                                                                  
                                 out string dataSet, 
                                 out string response)
```
{% endcode %}

### Parameters

| Parameter     |    Type    | Description                       |
| ------------- | :--------: | --------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server     |
| activationKey |   string   | the license key to activate       |
| computerID    |   string   | computer unique identifier        |
| dataSet       | out string | data set returned by the server   |
| response      | out string | result of the call to the server. |

### Return

| Type                                   | Description                   |
| -------------------------------------- | ----------------------------- |
| [ILicenseInfo](../../../ilicenseinfo/) | information about the license |

## Remarks

To parse the data returned in dataSet, check this [article](https://support.soraco.co/hc/en-us/articles/200704985-How-to-parse-data-returned-by-GetDataSet-or-GetDataSetEx-).

### C# Example

```csharp
ILicenseInfo li = license.GetActivationLogLicenseInfo(webServiceUrl, "A2GM0-50K00-PYU3F-784HH-1U1V5T", 
                                           Environment.MachineName, out dataSet out response);
if (li != null)
{
    string clientVersion = li.ClientVersion;
}
```
