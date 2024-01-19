# ValidateSignature

### Description

Adds a new product property.

```csharp
bool ValidateSignature(string xmlValue, string publicKey, out string errorMessage)
```

### Parameters

| Parameter    |  Type  | Description                                      |
| ------------ | :----: | ------------------------------------------------ |
| xmlValue     | string | xml fragment representing the product properties |
| publicKey    | string | the RSA public key                               |
| errorMessage | string | returned error message if the validation failed  |

### Return

| Type | Description                                      |
| ---- | ------------------------------------------------ |
| bool | true if the signature is valid; otherwise false. |
