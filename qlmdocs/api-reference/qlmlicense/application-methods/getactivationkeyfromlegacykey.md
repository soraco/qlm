# GetActivationKeyFromLegacyKey

### Description

Gets an activation key given an OrderID.

```csharp
 string GetActivationKeyFromOrderID(string webServiceUrl, 
                                    string legacyKey, 
                                    out string response)


```

### Parameters

| Parameter     |  Type  | Description                                                                            |
| ------------- | :----: | -------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server                                                          |
| legacyKey     | string | Legacy License Key                                                                     |
| response      | string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |

### Return

| Type   | Description        |
| ------ | ------------------ |
| string | the activation key |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>

<QuickLicenseManager>
<avkey>C06C4C90A497F091C2F080501000C076A0578E</pckey>
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

```c#
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
