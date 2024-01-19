# GetUserDataFromActivationLog

### Description

Gets the UserData1 field for a specific license key from the ActivationLog table. The ActivationLog table is used when a license key is of type MultipleActivationsKey and more than 1 seat is associated with the license key.

```c#
string GetUserDataFromActivationLog (string webServiceUrl, 
                                     string activationKey, 
                                     string computerID, 
                                     out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                                                                                |
| ------------- | :--------: | ------------------------------------------------------------------------------------------------------------------------------------------ |
| webServiceUrl |   string   | URL to the QLM License Server                                                                                                              |
| activationKey |   string   | The activation key to retrieve the subscription expiry date for. If this argument is set, you do not need to set the computerKey argument. |
| computerID    |   string   | Unique identifier of the computer on which the license was activated.                                                                      |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows                                                      |

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
