# RenewSubscription

### Description

Renews the subscription of a license by extending its expiry date.

When a subscription is renewed, each activated license is automatically reactivated on the server and a new computer bound key is generated with a new expiry date. When customers reactivate their license, they receive the new computer bound key with the new expiry date, thus extending their subscription period.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool RenewSubscription (string webServiceUrl, string activationKey, 
                        DateTime expiryDate, out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                                     |
| ------------- | :----: | ----------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                  |
| activationKey | string | activation key to extend                        |
| expiryDate    | string | new expiry date of the subscription             |
| errorMessage  | string | returned error message if the operation failed. |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |
