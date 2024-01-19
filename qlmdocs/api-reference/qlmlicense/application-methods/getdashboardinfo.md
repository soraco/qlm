# GetDashboardInfo

### Description

Retrieves dashboard-type information related to a site. You need to set the QlmLicense.AdminEncryptionKey property to call this function.

To use a proxy server, you must set the UseProxyServer, ProxyUser, ProxyDomain and ProxyPassword properties prior to calling this function.

To retrieve a specific license key-related information, call GetDashboardLicenseInfo.

```csharp
IDashboardInfo GetDashboardInfo (string webServiceUrl, 
                                 int recentOrders, 
                                 int upcomingRenewals)
```

### Parameters

| Parameter        |  Type  | Description                                                                    |
| ---------------- | :----: | ------------------------------------------------------------------------------ |
| webServiceUrl    | string | URL to the QLM License Server                                                  |
| recentOrders     |   int  | Define the number of days prior to today that the recent orders query returns  |
| upcomingRenewals |   int  | Define the number of days after today that the upcoming renewals query returns |

### Return

| Type           | Description                                                                                                                                                                      |
| -------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| IDashboardInfo | After calling GetDashboardInfo, the following IDashboardInfo properties will be set: TotalOrders, TotalCustomers, TodaysOrders, YesterdaysOrders, RecentOrders, UpcomingRenewals |

### Example

```c#
QlmLicense license = new QlmLicense ();
license.DefineProduct(1, "Demo", 1, 0, "DemoKey", "{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}");
DashboardInfo di = license.GetDashboardInfo ("https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx", 10, 30);
if (ret == true)
{
   MessageBox.Show ("Total Licenses: " + di.TotalOrders);
}
```
