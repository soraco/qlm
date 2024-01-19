# UpdateLastAccessedDate

### Description

Updates the Last Accessed Date associated to a registered installation on the server.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```csharp
bool UpdateLastAccessedDate(string installID)
```

### Parameters

| Parameter |  Type  | Description                                                              |
| --------- | :----: | ------------------------------------------------------------------------ |
| installID | string | unique identifier of this installation, returned by a call to AddInstall |

### Return

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |
