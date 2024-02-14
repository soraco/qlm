# DownloadLicenseFileFromServer

### Description

Downloads a license file from the license server and stores it on the end user system.

{% code overflow="wrap" %}
```csharp
 bool DownloadLicenseFileFromServer(string webServiceUrl, 
                                    string activationKey, 
                                    string computerID, 
                                    out string errorMessage)
```
{% endcode %}

### Parameters

| Parameter     |  Type  | Description                                        |
| ------------- | :----: | -------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server                      |
| activationKey | string | the activation key                                 |
| computerID    | string | Unique identifier of the computer being activated. |
| errorMessage  | string | error message                                      |

### Return

| Type | Description                                             |
| ---- | ------------------------------------------------------- |
| bool | true if the download and save operation were successful |

### Remarks

You must call [DefineProduct ](https://soraco.readme.io/reference/defineproduct)before calling this function.

If the QlmLicense.[LicenseFilePath](https://soraco.readme.io/reference/qlmlicense-properties) property is set, the License File is stored on the end user system in the location specified by LicenseFilePath.

If the LicenseFilePath is not set, the license file is stored in the location specified by the QlmLicense.StoreKeysLocation property.
