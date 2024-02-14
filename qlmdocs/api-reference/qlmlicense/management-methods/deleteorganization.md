# DeleteOrganization

### Description

Deletes an organization

Note that to call this function, you must:

* Set the AdminEncryptionKey

{% code overflow="wrap" %}
```csharp
bool DeleteOrganization(string webServiceUrl, IQlmOrganizationInfo orgInfo, out string response)
```
{% endcode %}

### Parameters

| Parameter     |         Type         | Description                                     |
| ------------- | :------------------: | ----------------------------------------------- |
| webServiceUrl |        string        | URL to the QLM License Server.                  |
| orgInfo       | IQlmOrganizationInfo | Organization information                        |
| response      |        string        | XML fragment containing the result of the call. |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Remarks

You must set the OrganizationID or the OrganizationName in the orgInfo object.

### Availability

* Edition: QLM Enterprise
* Version: v17+
