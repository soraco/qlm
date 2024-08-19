# ReleaseLicense

### Description

Deactivates a license key on the License Server.

```csharp
void ReleaseLicense (string webServiceUrl, 
                     string activationKey, 
                     string computerID,
                     string computerKey, 
                     bool logRelease, 
                     bool useActivationCount,
                     out string response)
```

### Parameters

| Parameter          |    Type    | Description                                                                                                                                                                                                   |
| ------------------ | :--------: | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl      |   string   | URL to the QLM License Server                                                                                                                                                                                 |
| activationKey      |   string   | the license key to deactivate                                                                                                                                                                                 |
| computerID         |   string   | the unique computer identifier                                                                                                                                                                                |
| computerKey        |   string   | the computer key being released                                                                                                                                                                               |
| logRelease         |    bool    | flag that determines whether the release will be logged in the history table. If you are using cloud based floating licenses, you should set this argument to false to prevent bloating of the history table. |
| useActivationCount |    bool    | flag that determines whether the deactivation of the license decrements the activation count. This is typically needed for cloud floating licenses.                                                           |
| response           | out string | XML fragment containing the result of the call.                                                                                                                                                               |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>ActivationKey A162DCF05C30D371A2D0E0461040A0 has been released.</result>
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

You can control how many times a user can release a license with the following Server Properties:

* maxReleaseCount: The maximum number of times an end-user can release a license.
* maxReleasePeriodInDays: When counting the number of released licenses, only count the ones that have been released in the past "maxReleasePeriodInDays" days. For example, if you want to allow a user to release a license twice per month, set maxReleasePeriodInDays to 30 and maxReleaseCount to 2.
* maxReleasePerClient: When counting the number of released licenses for a given activation key, count only the ones associated with a specific client. By default, QLM counts all the released licenses for a given activation regardless of the client system.

By default, you must set the CommunicationEncryptionKey before calling ReleaseLicense. The server property releaseLicenseUseAdminEncryptionKey can be used to configure the server to require the AdminEncryption to be set in order to call ReleaseLicense.

Use [ParseResults ](../../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../../ilicenseinfo/)object.

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
