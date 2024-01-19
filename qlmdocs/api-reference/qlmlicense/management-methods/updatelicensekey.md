# UpdateLicenseKey

### Description

Updates a license key with another license key.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool UpdateLicenseKey (string webServiceUrl, string currentKey, 
                       string newKey, out string response)
```

### Parameters

| Parameter     |  Type  | Description                                    |
| ------------- | :----: | ---------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                 |
| currentKey    | string | the current activation key                     |
| newKey        | string | the new activation key                         |
| response      | string | XML fragment containing the result of the call |

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
