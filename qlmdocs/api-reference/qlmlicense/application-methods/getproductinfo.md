# GetProductInfo

### Description

Gets information about a product from the server.

```csharp
 IQlmProductInfo GetProductInfo(string webServiceUrl, string productName, 
                                int productID, int majorVersion, int minorVersion)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| productName   | string | name of the product           |
| productID     |   int  | ID of the product             |
| majorVersion  |   int  | major version of the product  |
| minorVersion  |   int  | minor version of the product  |

### Return

| Type                                                |                           |
| --------------------------------------------------- | ------------------------- |
| [IQlmProductInfo](../interfaces/iqlmproductinfo.md) | details about the product |
