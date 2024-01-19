# UpdateUserAccount

### Description

Updates a user account for a customer. You can update the following data in a user account:

* Email Address
* Password (if you know the previous password)

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
void UpdateUserAccount(string webServiceUrl, string userAccountName, 
                       QlmUserAccount userAccount, out string response)
```

### Parameters

| Parameter       |      Type      | Description                                     |
| --------------- | :------------: | ----------------------------------------------- |
| webServiceUrl   |     string     | URL to the QLM License Server.                  |
| userAccountName |     string     | name of the user account                        |
| userAccount     | QlmUserAccount | details about the user account to create        |
| response        |     string     | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>The user account xxx was updated successfully.</result>
</QuickLicenseManager>
```

### Example error response

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

## Remarks

Use [ParseResults ](../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../ilicenseinfo/)object.

```csharp
ILicenseInfo li = new LicenseInfo();
string message = string.Empty;
if (lv.QlmLicenseObject.ParseResults(response, ref li, ref message))
{
  // The operation  was successful	
}
else
{
  // The operation failed
}
```

### Requirements

* QLM Enterprise
* Version: 15.0.21240.1 or higher
