# RevokeLicense

### Description

Revokes or un-revokes a license key.

When a subscription is renewed, each activated license is automatically reactivated on the server and a new computer bound key is generated with a new expiry date. When customers reactivate their license, they receive the new computer bound key with the new expiry date, thus extending their subscription period.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool RevokeLicense (string webServiceUrl, string activationKey, 
                    bool revoke, out string response)
```

### Parameters

| Parameter     |  Type  | Description                                      |
| ------------- | :----: | ------------------------------------------------ |
| webServiceUrl | string | URL to the QLM License Server.                   |
| activationKey | string | activation key to extend                         |
| revoke        |  bool  | true to revoke a license, false to un-revoke it. |
| response      | string | XML fragment containing the result of the call.  |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully updated license information for ActivationKey=XYZ.</result>
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
