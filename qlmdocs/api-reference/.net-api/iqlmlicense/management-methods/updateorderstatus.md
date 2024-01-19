# UpdateOrderStatus

### Description

Updates the status of an order.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
bool UpdateOrderStatus (string webServiceUrl, string orderID, 
                        int orderStatus, out string response)
```

### Parameters

| Parameter     |  Type  | Description                                    |
| ------------- | :----: | ---------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                 |
| orderID       | string | ID of the order                                |
| orderStatus   |   int  | status of the order to set                     |
| response      | string | XML fragment containing the result of the call |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Order status updated successfully.</result>
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

### Example

```c#
QlmLicense license = new QlmLicense ();
license.DefineProduct(1, "Demo", 1, 0, "DemoKey", "{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}");
string response = string.Empty;
bool stat  = license.UpdateOrderStatus ("https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx", 
                                        1234, 2, out response);
ILicenseInfo li = new LicenseInfo();
string message = string.Empty;
if (license.ParseResults(response, ref li, ref message))
{
  // The operation  was successful	
}
else
{
  // The operation failed
}

```
