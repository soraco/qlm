# DownloadProductPropertiesFromServer

### Description

Downloads a license file from the license server and stores it on the end user system.

```csharp
bool DownloadProductPropertiesFromServer(string webServiceUrl, 
                                    string activationKey,                                     
                                    out string errorMessage)                                    
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | the activation key            |
| errorMessage  | string | error message                 |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the download and save operation were successful |

### Remarks

You must call [DefineProduct ](../client-side-methods/defineproduct.md)before calling this function.

If the QlmLicense.[ProdutPropertiesFilePath](https://docs.soraco.co/docs/api-reference/.net-api/iqlmlicense/properties) property is set, the License File is stored on the end user system in the location specified by ProductPropertiesFilePath.

If the ProductPropertiesFilePathis not set, the Product Properties file is stored in the location specified by the QlmLicense.StoreKeysLocation property.
