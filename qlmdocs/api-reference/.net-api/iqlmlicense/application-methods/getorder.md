# GetOrder

### Description

Gets the details of an order.

```c#
DataRowCollection GetOrder (string webServiceUrl, 
                            string orderID, 
                            out string response)
```

### Parameters

| Parameter     |  Type  | Description                                     |
| ------------- | :----: | ----------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server                   |
| orderID       | string | ID of the order                                 |
| response      | string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Order retrieved  successfully.</result>
</QuickLicenseManager>	
```

### Error Response example

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>The order id is not valid</error>
</QuickLicenseManager>
```

### Return

| Type              | Description                                                           |
| ----------------- | --------------------------------------------------------------------- |
| DataRowCollection | DataRowCollection containing all the data associated with this order. |

### Example

```c#
QlmLicense license = new QlmLicense ();
license.DefineProduct(1, "Demo", 1, 0, "DemoKey", "{24EAA3C1-3DD7-40E0-AEA3-D20AA17A6005}");
string response = string.Empty;
DataRowCollection drc = license.GetOrder ("https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx", 1234, out response);
if (drc != null)
{
   foreach (DataRow dr in drc)
   {
               string activationKey = dr["ActivationKey"];
   }
}

```
