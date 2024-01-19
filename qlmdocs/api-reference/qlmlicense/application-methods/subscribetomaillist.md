# SubscribeToMailList

### Description

Subscribes or unsubscribes a user from the mailing list.

```csharp
 bool SubscribeToMailList (string webServiceUrl, 
                           string customerEmail, 
                           bool includeInMailList, 
                           sout string response)
```

```http
<http://server/qlm/qlmservice.asmx/SubscribeToMailListHttp?is_email=user@cie.com&is_include=1>
```

### Parameters

| Parameter         |    Type    | Description                                     |
| ----------------- | :--------: | ----------------------------------------------- |
| webServiceUrl     |   string   | URL to the QLM License Server                   |
| customerEmail     |   string   | email address of the customer                   |
| includeInMailList |    bool    | true to subscribe, false to unsubscribe         |
| response          | out string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Succesfully subscribed customer.</result>
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

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | true if successful; otherwise false. |
