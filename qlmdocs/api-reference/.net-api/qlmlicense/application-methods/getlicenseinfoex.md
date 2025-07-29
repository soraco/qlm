# GetLicenseInfoEx

### Description

Retrieves information about an Activation Key.

```csharp
  ILicenseInfo GetLicenseInfoEx (string webServiceUrl, 
                                 string activationKey, 
                                 string computerID,
                                 bool historyTable,
                                 ExtendedLicenseInformation exLicenseInfo, 
                                 out string dataSet, 
                                 out string response)
```

### Parameters

| Parameter     |                                 Type                                 | Description                                                    |
| ------------- | :------------------------------------------------------------------: | -------------------------------------------------------------- |
| webServiceUrl |                                string                                | URL to the QLM License Server                                  |
| activationKey |                                string                                | the license key to activate                                    |
| computerID    |                                string                                | computer unique identifier                                     |
| historyTable  |                                 bool                                 | search for the activation key in the history table             |
| exLicenseInfo | [ExtendedLicenseInformation](../enums/extendedlicenseinformation.md) | specifies the level of information to retrieve from the server |
| dataSet       |                              out string                              | data set returned by the server                                |
| response      |                              out string                              | result of the call to the server.                              |

### Return

| Type                                   | Description                   |
| -------------------------------------- | ----------------------------- |
| [ILicenseInfo](../../../ilicenseinfo/) | information about the license |

## Remarks

To parse the data returned in dataSet, check this [article](https://support.soraco.co/hc/en-us/articles/200704985-How-to-parse-data-returned-by-GetDataSet-or-GetDataSetEx-).

### C# Example

```csharp
ILicenseInfo li = license.GetLicenseInfo (webServiceUrl, "A2GM0-50K00-PYU3F-784HH-1U1V5T", 
                                           false, out dataSet out response);
if (li != null)
{
    int numLicenses = li.NumLicenses;
    int availableLicenses = li.AvailableLicenses;
}
```
