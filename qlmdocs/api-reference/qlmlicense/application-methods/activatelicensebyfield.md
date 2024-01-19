# ActivateLicenseByField

### Description

Activates a license key over the internet, binds it to a specific user and returns a computer bound license key.

```csharp
 void ActivateLicenseByField(string webServiceUrl,
                             string fieldName, 
                             string fieldValue,
                             string email, 
                             string computerID, 
                             string computerName, 
                             string qlmVersion, 
                             string userData1, 
                             string affiliateID, 
                             out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                            |
| ------------- | :----: | -------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                         |
| fieldName     | string | Name of the field used to locate the Activation Key to activate                        |
| fieldValue    | string | Value of the field used to locate the Activation Key to activate                       |
| email         | string | Email address of user that owns the license                                            |
| computerID    | string | The unique computer identifier                                                         |
| computerName  | string | The name of the computer. This argument is not required but recommended.               |
| qlmVersion    | string | The version of the QLM Engine                                                          |
| userData1     | string | User data to associate with the license key                                            |
| affiliateID   | string | ID of affiliate                                                                        |
| response      | string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |        |                                                                                        |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<pckey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
<userCompany>My Company</userCompany>
<userFullName>John Smith</userFullName>
<userEmail>john@smith.com</userEmail>
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

You must call [DefineProduct ](../client-side-methods/defineproduct.md)before calling this function.

Use [ParseResults ](../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../ilicenseinfo/)object.

This function can be used to activate a license when the Activation Key is not known. For example, you can use this function to activate a license based on an Order ID. To do so, you set the fieldName argument to "OrderID" and set the fieldValue argument to the value of the Order ID.

By default, the supported fields are: OrderID and ReceiptID.

You can modify the list of supported fields by updating the activationByFieldAllowedFields setting in the QLM License Server's web.config file.

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
