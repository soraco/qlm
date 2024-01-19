# GetDataSetEx2

### Description

Gets a data set in XML format that meets the criteria specified in the filter.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```csharp
void GetDataSetEx2 (string webServiceUrl, string table, 
                   string filter, int maxRecords, 
                   string distinctFieldValue, string uniqueIDField, 
                   ref string dataSet, out string response)
```

### Parameters

| Parameter          | Type   | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| ------------------ | ------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| webServiceUrl      | string | URL to the QLM License Server.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| table              | string | <p>Specify the table to query. The possible values are:<br><br>qryLicenseInfo: the main view where all license keys are recorded.<br>qryActivationAttempts: the view containing the activation attempts.<br>qryActivationLog: the view containing the activation log for multiple activations keys.<br>qryAnalyticsInstalls: the view containing Analytics.<br>qryCustomerInfo: the view containing customer information<br>qryIllegalComputers: the view containing the illegal computers.<br>qryLicenseHistoryInfo: the view containing historical keys.<br><br>AuditTrail: table containing AuditTrail data.</p> |
| filter             | string | SQL filter to determine which records to return. Use a where clause sql syntax, example: ActivationKey='AAAA'. Note that if the filter contains an Activation Key or a Computer Key, you must strip out the dashes in the license key. License keys in the database are stored without dashes.                                                                                                                                                                                                                                                                                                                      |
| maxRecords         | int    | the maximum number of records to return. Set the value to -1 to return all records.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| distinctFieldValue | string | name of a field whose value should be distinct in the returned records                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| uniqueIDField      | string | name of a field that will be used to identify which record to return when multiple records have the same value in the specified distinctField.                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| dataSet            | string | returned dataset containing license key records that match criteria                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| response           | string | XML fragment containing the result of the call.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |

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

### Requirements

* QLM Enterprise
