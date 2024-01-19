# AddOrganization

### Description

Adds a new organization

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool AddOrganization(string webServiceUrl, IQlmOrganizationInfo orgInfo, out string response)
```

### Parameters

| Parameter     |                                 Type                                 | Description                                     |
| ------------- | :------------------------------------------------------------------: | ----------------------------------------------- |
| webServiceUrl |                                string                                | URL to the QLM License Server.                  |
| orgInfo       | [IQlmOrganizationInfo](../../iqlmcustomerinfo/iqlmorganizationinfo/) | Organization information                        |
| response      |                                string                                | XML fragment containing the result of the call. |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Availability

* Edition: QLM Enterprise
* Version: v17+
