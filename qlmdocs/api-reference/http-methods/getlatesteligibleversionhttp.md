---
description: Available as of v20.0.26295.1
---

# GetLatestEligibleVersionHttp

### Description

Gets the latest version of the specified product that the user is eligible to. This works in conjunction with the Maintenance Plan feature and the product Release Date property.

A user is eligible to the latest version where the Maintenance Plan Renewal Date is greater than or equal to the product's release date. Note that if the maintenance plan is not enabled, then the latest version is returned based on the provided product ID, major version and minor version.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/QlmLicenseServerNetCore/api/v1/QlmApi/GetLatestEligibleVersionHttp?is_avkey=[activation key]&is_pckey=[computer key]&is_productid=[product id]&is_majorversion=[major version]&is_minorversion=[minor version]
```
{% endcode %}

### Arguments

| Parameter        | Description                                                                                         |
| ---------------- | --------------------------------------------------------------------------------------------------- |
| is\_avkey        | Activation Key of the customer. This argument can be empty if the ComputerKey argument is provided. |
| is\_pckey        | Computer Key of the customer. This argument can be empty if the ActivationKey argument is provided. |
| is\_majorversion | your product's major version as defined in QLM                                                      |
| is\_minorversion | your product's minor version as defined in QLM                                                      |
| is\_productid    | your product id as defined in QLM                                                                   |

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
