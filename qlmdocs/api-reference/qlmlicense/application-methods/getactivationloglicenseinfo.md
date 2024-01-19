# GetActivationLogLicenseInfo

### Description

Retrieves information about an activated Activation Key for multiple activations keys.

```c#
 ILicenseInfo GetActivationLogLicenseInfo (string webServiceUrl, 
                                           string activationKey, 
                                           string computerID,
                                           out string dataSet, out string response)
```

To parse the data returned in dataSet, check this [article](https://support.soraco.co/hc/en-us/articles/200704985-How-to-parse-data-returned-by-GetDataSet-or-GetDataSetEx-).

### Parameters

| Parameter     |    Type    | Description                                                                            |
| ------------- | :--------: | -------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                          |
| activationKey |   string   | the activation key to query                                                            |
| computerID    |   string   | the unique computer identifier                                                         |
| dataSet       | ref string | returned dataset containing license key records that match the activation key          |
| response      |   string   | XML fragment containing the result of the call. The Xml fragment schema is as follows: |

### Return

| Type                                                            | Description                                                                   |
| --------------------------------------------------------------- | ----------------------------------------------------------------------------- |
| [ILicenseInfo](https://soraco.readme.io/reference/ilicenseinfo) | detailed information about the activated license for the specified computerID |

### C# Example

```c#
ILicenseInfo li = license.GetActivationLogLicenseInfo (webServiceUrl, 
                                                       "A2GM0-50K00-PYU3F-784HH-1U1V5T", 
                                                       "PC-001", 
                                                       out dataSet,
                                                       out response);
```
