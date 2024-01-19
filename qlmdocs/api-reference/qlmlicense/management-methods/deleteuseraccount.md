# DeleteUserAccount

### Description

Deletes a user account for the QLM Portal or QLM Customer Portal.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
void DeleteUserAccount(string webServiceUrl, string userAccountName, 
                       out string response)
```

### Parameters

| Parameter       |  Type  | Description                                     |
| --------------- | :----: | ----------------------------------------------- |
| webServiceUrl   | string | URL to the QLM License Server.                  |
| userAccountName | string | name of the user account                        |
| response        | string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>The user account xxx was deleted successfully.</result>
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

Use [ParseResults ](https://soraco.readme.io/reference/parseresults)to interpret the results of the call and load the returned data into an [ILicenseInfo ](https://soraco.readme.io/reference/ilicenseinfo)object.

```c#
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
