# GetOrganization

### Description

Gets an organization

Note that to call this function, you must:

* Set the AdminEncryptionKey

{% code overflow="wrap" %}
```csharp
IQlmOrganizationInfo UpdateOrganization(string webServiceUrl, int orgID, string orgName)
```
{% endcode %}

### Parameters

| Parameter     |  Type  | Description                    |
| ------------- | :----: | ------------------------------ |
| webServiceUrl | string | URL to the QLM License Server. |
| orgID         |   int  | Organization ID                |
| orgName       | string | Organization Name              |

### Return

| Type                                                         | Description              |
| ------------------------------------------------------------ | ------------------------ |
| [IQlmOrganizationInfo](../../.net-api/iqlmorganizationinfo/) | Organization information |

### Remarks

You must set the orgID or the orgName.

### Availability

* Edition: QLM Enterprise
* Version: v17+
