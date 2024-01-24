# GetLatestVersionHttp

### Description

Get information about the latest version of a product.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetLatestVersionHttp?is_productid=[product id]&is_majorversion=[major version]&is_minorversion=[minor version]
```
{% endcode %}

### Arguments

| Parameter        | Description                                    |
| ---------------- | ---------------------------------------------- |
| is\_majorversion | your product's major version as defined in QLM |
| is\_minorversion | your product's minor version as defined in QLM |
| is\_productid    | your product id as defined in QLM              |

## Return

```xml
<?xml version="1.0" encoding="UTF-8"?>
<QuickLicenseManager>
<result>The latest version is x.y.z</result>
<latestVersion>x.y.z</latestVersion>
<latestVersionUrl>a url to your download package</latestVersionUrl>
<latestVersionNotes>release notes</latestVersionNotes>
</QuickLicenseManager>

 
```
