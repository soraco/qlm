# UpgradeLicense

### Description

Upgrades a license. You can upgrade the following data associated with the license:

* Features associated to a license
* Expiry date of the license
* Duration of the license
* Major and Minor version of the product
* The version of the QLM Engine used to generate the license key

When a license is upgraded, a new license key is generated and replaces the existing one. The old license is copied to the History table.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
bool UpgradeLicense (string webServiceUrl, string activationKey, 
                     int productID, int majorVersion, int minorVersion, 
                     string qlmVersion, int[] features, 
                     DateTime dtExpiry, int expiryDuration, 
                     out string response)
```

```http
http://server/qlm/qlmservice.asmx/UpgradeLicense?is_avkey=<activationKey>&is_productid=<pid>&is_majorversion=<majorVersion>&is_minorversion=<minorVersion>&is_expdate=<yyyy-mm-dd>&is_expdate>&is_expduration=<expiry duration>
```

### Parameters

| Parameter      |   Type   | Description                                                                                                                                                                                                                              |
| -------------- | :------: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl  |  string  | URL to the QLM License Server.                                                                                                                                                                                                           |
| activationKey  |  string  | the current activation key                                                                                                                                                                                                               |
| productID      |    int   | ID of the product                                                                                                                                                                                                                        |
| majorVersion   |    int   | new major version of the product                                                                                                                                                                                                         |
| minorVersion   |    int   | new minor version of the product                                                                                                                                                                                                         |
| qlmVersion     |  string  | version of the QLM Engine to use.                                                                                                                                                                                                        |
| features       |  int\[]  | an array of feature sets specifying the features that should be enabled in the created key. Each feature has a unique feature set and ID associated to it. To combine features, perform a bitwise OR operation on the required features. |
| dtExpiry       | DateTime | expiry date of the license key                                                                                                                                                                                                           |
| expiryDuration |    int   | expiry duration of the license key                                                                                                                                                                                                       |
| response       |  string  | XML fragment containing the result of the call                                                                                                                                                                                           |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>The license was upgraded...</result>
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
