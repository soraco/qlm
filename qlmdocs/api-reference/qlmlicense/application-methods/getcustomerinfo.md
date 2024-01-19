# GetCustomerInfo

### Description

Retrieves information about the customer associated with the specified activation key.

```csharp
IQlmCustomerInfo GetCustomerInfo (string webServiceUrl, string activationKey)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | the activation key to query   |

### Return

| Type                                        | Description                                                                |
| ------------------------------------------- | -------------------------------------------------------------------------- |
| [IQlmCustomerInfo](../../iqlmcustomerinfo/) | detailed information about the customer associated with the activation key |

### Example

```csharp
IQlmCustomerInfo customer = license.GetCustomerInfo (webServiceUrl, "A2GM0-50K00-PYU3F-784HH-1U1V5T");
```
