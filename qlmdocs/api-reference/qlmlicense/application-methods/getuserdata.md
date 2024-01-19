# GetUserData

### Description

Gets the UserData1 field for a specific license key.

```csharp
string GetUserData (string webServiceUrl, string activationKey, out string response)
```

### Parameters

| Parameter     |    Type    | Description                                     |
| ------------- | :--------: | ----------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                   |
| activationKey |   string   | activation key to query.                        |
| response      | out string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully executed query using filter...</result>
</QuickLicenseManager>
```

### Example error response

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

### Return

| Type   | Description   |
| ------ | ------------- |
| string | the user data |
