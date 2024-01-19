# DeleteLicense

### Description

Deletes a license key on the License Server.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
void DeleteLicense (string webServiceUrl, string activationKey, 
                    string computerID, bool multipleActivationsKey, 
                    bool historyTable, out string response)
```

### Parameters

| Parameter              |  Type  | Description                                                                                                                                   |
| ---------------------- | :----: | --------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl          | string | URL to the QLM License Server.                                                                                                                |
| activationKey          | string | the license key to delete                                                                                                                     |
| computerID             | string | the computer ID to delete. The computerID is optional if multipleActivationsKey is false.                                                     |
| multipleActivationsKey |  bool  | set to true if this key is a multiple activations key. The Delete operates then on the ActivationLog table. The computerID must be specified. |
| historyTable           |  bool  | set to true if you want to delete licenses from the history table where all released licenses are backed up.                                  |
| response               | string | XML fragment containing the result of the call.                                                                                               |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>ActivationKey A162DCF05C30D371A2D0E0461040A0 has been deleted.</result>
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
