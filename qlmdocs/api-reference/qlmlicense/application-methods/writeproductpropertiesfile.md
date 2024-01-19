# WriteProductPropertiesFile

### Description

Gets the product properties from the License Server, validates the signature, and then writes them to a file on disk. The QlmLicense.DefaultWebServiceUrl must be set before calling this function.

```csharp
bool WriteProductPropertiesFile(string activationKey, string licenseFile, 
                                out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                                  |
| ------------- | :----: | -------------------------------------------- |
| activationKey | string | activation key to query.                     |
| licenseFile   | string | the filename of the products properties file |
| errorMessage  | string | an error message if the operation fails.     |

### Return

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | true if successful; otherwise false. |
