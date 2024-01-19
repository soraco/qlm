# ParseResults

### Description

Parses the result of a License Server response.

```c#
bool ParseResults(string results, ref ILicenseInfo licenseInfo, ref string message)
```

### Arguments

| Name         |                            Data Type                            | Description                                         |
| ------------ | :-------------------------------------------------------------: | --------------------------------------------------- |
| results      |                              string                             | XML response returned from any License Server call  |
| licenseInfo  | [ILicenseInfo](https://soraco.readme.io/reference/ilicenseinfo) | object containing the result of the parse operation |
| errorMessage |                              string                             | an error message if the operation fails.            |

### Return

| Data Type | Description                     |
| :-------: | ------------------------------- |
|    bool   | true if the call was successful |

### Remarks

Most License Server API functions return an XML fragment describing the results of the call. This function parses the results and returns an ILicenseInfo interface describing the results.
