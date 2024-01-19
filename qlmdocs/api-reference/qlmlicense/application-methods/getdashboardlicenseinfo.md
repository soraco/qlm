# GetDashboardLicenseInfo

### Description

Retrieves dashboard-type information related to the specified license key.

To use a proxy server, you must set the UseProxyServer, ProxyUser, ProxyDomain and ProxyPassword properties prior to calling this function.

```csharp
 IDashboardLicenseInfo GetDashboardLicenseInfo (string webServiceUrl,
                                                string activationKey, 
                                                string computerKey,
                                                string computerID)
```

### Parameters

| Parameter     |  Type  | Description                   |
| ------------- | :----: | ----------------------------- |
| webServiceUrl | string | URL to the QLM License Server |
| activationKey | string | Activation Key                |
| computerKey   | string | Computer Key                  |
| computerID    | string | Computer ID                   |

### Return

| Type                  | Description           |
| --------------------- | --------------------- |
| IDashboardLicenseInfo | Dashboard information |

### Example

```c#
QlmLicense license = new QlmLicense ();
license.DefineProduct(1, "Demo", 1, 0, "DemoKey", "{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}");
IDashboardLicenseInfo di = license.GetDashboardLicenseInfo ("https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx", "AXXX", "UXXX", Environment.MachineName);
if (ret == true)
{
   MessageBox.Show ("Total Licenses: " + di.TotalLicenses);
}
```
