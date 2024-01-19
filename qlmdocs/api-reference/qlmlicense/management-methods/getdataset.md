# GetDataSet

### Description

Gets a data set in XML format that meets the criteria specified in the filter.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
void GetDataSet (string webServiceUrl, string filter, ref string dataSet, 
                 out string response)
```

### Parameters

| Parameter     |  Type  | Description                                                                                                                                                                                                                                                                                    |
| ------------- | :----: | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                                                                                                                                                                                                                                                                 |
| filter        | string | SQL filter to determine which records to return. Use a where clause sql syntax, example: ActivationKey='AAAA'. Note that if the filter contains an Activation Key or a Computer Key, you must strip out the dashes in the license key. License keys in the database are stored without dashes. |
| dataSet       | string | returned dataset containing license key records that match criteria                                                                                                                                                                                                                            |
| response      | string | XML fragment containing the result of the call.                                                                                                                                                                                                                                                |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully executed query using filter...</result>
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
