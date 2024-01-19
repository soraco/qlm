# GetActivationKeyFromUserData

### Description

Gets an activation key given the user data.

```csharp
  string GetActivationKeyFromUserData(string webServiceUrl,
                                      string userData,
                                      out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                            |
| ------------- | :----: | -------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server                                                          |
| userData      | string | the data stored in the QLM user data field.                                            |
| response      | string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |

### Return

| Type   | Description                  |
| ------ | ---------------------------- |
| string | the Activation Key if found. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<avkey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
</QuickLicenseManager>
```

### Example error response

In the event of an error, the XML fragments returns:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<avkey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
</QuickLicenseManager>
```

## Remarks

Use [ParseResults ](../../iqlmcustomerinfo/methods/parseresults.md)to interpret the results of the call and load the returned data into an [ILicenseInfo ](../../ilicenseinfo/)object.

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
