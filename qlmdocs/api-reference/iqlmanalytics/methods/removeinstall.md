# RemoveInstall

### Description

Unregisters an application with the server. You should call this function when the user uninstalls your application.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```csharp
bool RemoveInstall(string installID, out string errorMessage)
```

### Parameters

| Parameter    |  Type  | Description                            |
| ------------ | :----: | -------------------------------------- |
| installID    | string | unique identifier of this installation |
| errorMessage | string | retuned error message, if any.         |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the operation was successful; otherwise, false. |
