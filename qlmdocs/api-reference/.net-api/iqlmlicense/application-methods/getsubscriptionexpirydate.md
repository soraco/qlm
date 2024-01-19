# GetSubscriptionExpiryDate

### Description

Gets the subscription expiry date associated with the license.

```c#
DateTime GetSubscriptionExpiryDate(string webServiceUrl, 
                                   string activationKey, string computerKey, 
                                   out string response)
```

### Parameters

| Parameter     |    Type    | Description                                                                                                                                |
| ------------- | :--------: | ------------------------------------------------------------------------------------------------------------------------------------------ |
| webServiceUrl |   string   | URL to the QLM License Server                                                                                                              |
| activationKey |   string   | The activation key to retrieve the subscription expiry date for. If this argument is set, you do not need to set the computerKey argument. |
| computerKey   |   string   | The computer key to retrieve the subscription expiry date for. If this argument is set, you do not need to set the activationKey argument. |
| response      | out string | XML fragment containing the result of the call.                                                                                            |

### Response XML format

Returns the value of the userData1 field.

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully executed.</result>
</QuickLicenseManager>

```

### Example error response

In the event of an error, the XML fragments returns:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

### Return

| Type     | Description                          |
| -------- | ------------------------------------ |
| DateTime | the subscription expiry date in UTC. |
