# GetDataSetEx

### Description

Gets a data set in XML format that meets the criteria specified in the filter.

Note that to call this function, you must:

* Set the AdminEncryptionKey

```c#
void GetDataSetEx (string webServiceUrl, string table, string filter, 
                   ref string dataSet, out string response)
```

### Parameters

\[block:parameters] { "data": { "h-0": "Parameter", "h-1": "Type", "h-2": "Description", "0-0": "webServiceUrl", "0-1": "string", "0-2": "URL to the QLM License Server.", "1-0": "table", "1-1": "string", "1-2": "specify the table to query. The possible values are: \n \nqryLicenseInfo: the main view where all license keys are recorded. \nqryActivationAttempts: the view containing the activation attempts. \nqryActivationLog: the view containing the activation log for multiple activations keys. \nqryAnalyticsInstalls: the view containing Analytics. \nqryCustomerInfo: the view containing customer information \nqryIllegalComputers: the view containing the illegal computers. \nqryLicenseHistoryInfo: the view containing historical keys. \n \nAuditTrail: table containing AuditTrail data.", "2-0": "filter", "2-1": "string", "2-2": "SQL filter to determine which records to return. Use a where clause sql syntax, example: ActivationKey='AAAA'. Note that if the filter contains an Activation Key or a Computer Key, you must strip out the dashes in the license key. License keys in the database are stored without dashes.", "3-0": "dataSet", "3-1": "string", "3-2": "returned dataset containing license key records that match criteria", "4-0": "response", "4-1": "string", "4-2": "XML fragment containing the result of the call." }, "cols": 3, "rows": 5, "align": \[ "left", "center", "left" ] } \[/block]

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
