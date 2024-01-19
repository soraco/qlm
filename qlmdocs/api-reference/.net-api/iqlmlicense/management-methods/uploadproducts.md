# UploadProducts

### Description

Uploads the list of products to the License Server.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
void UploadProducts (string webServiceUrl, string productsXml, 
                     DateTime updatedUtcDate, out string response)
```

### Parameters

| Parameter      |   Type   | Description                                                                                                                                              |
| -------------- | :------: | -------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl  |  string  | URL to the QLM License Server.                                                                                                                           |
| productsXml    |  string  | Xml file containing the list of products. The format of the XML file is identical to the products.xml file stored on the client side. See example below. |
| updatedUtcDate | DateTime | UTC Date at which the products were last updated.                                                                                                        |
| response       |  string  | XML fragment containing the result of the call                                                                                                           |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Succesfully uploaded products.</result>
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

### Example list

```xml
<?xml version='1.0' encoding='UTF-8'?>
<LICENSES>
<PRODUCTS>
<PRODUCT Name="Demo" ID="1" Major="2" Minor="0" Key="DemoKey" GUID="{AB932603-7336-4DA4-90C1-843C4146E388}" ReleaseDate="2008-12-11" Features="" LatestVersion="2.0" LatestVersionUrl="" LatestVersionNotes="" />
<PRODUCT Name="Demo" ID="1" Major="1" Minor="0" Key="DemoKey" GUID="{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}" ReleaseDate="2007-12-01" Features="0:1:F1;0:2:F2;0:4:F3;3:1:D1;" LatestVersion="1.1" LatestVersionUrl="http://yourserver/setup.exe" LatestVersionNotes="In this field, insert comments that describe the latest version of your product. This information can be retrieved by your application when checking for updates and displayed to the end user." />
</PRODUCTS>
</LICENSES>
```
