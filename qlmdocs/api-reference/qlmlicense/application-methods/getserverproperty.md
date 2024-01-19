# GetServerProperty

### Description

Gets the value of a server property.

```csharp
 string GetServerProperty (string webServiceUrl, 
                           string property, 
                           out string response)
```

### Parameters

| Parameter     |    Type    | Description                                     |
| ------------- | :--------: | ----------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                   |
| property      |   string   | the name of the property to retrieve            |
| response      | out string | XML fragment containing the result of the call. |

### Response XML format

Returns the value of the userData1 field.

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully executed.</result>
</QuickLicenseManager>

```

### Example error response

In the event of an error, the XML fragments returns:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

### Return

| Type   | Description                |
| ------ | -------------------------- |
| string | the value of the property. |

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
