# GetActivationLog

### Description

Gets the list of systems that have been activated using the specific activation key.

Note that to call this function, you must:

* Set the CommunicationEncryptionKey property

```csharp
 void GetActivationLog(string webServiceUrl, 
                       string activationLKey, 
                       ref string dataSet, 
                       out string response) 
```

To parse the returned dataSet, check this [article](https://support.soraco.co/hc/en-us/articles/200704985-How-to-parse-data-returned-by-GetDataSet-or-GetDataSetEx-).

### Parameters

| Parameter     |    Type    | Description                                                                            |
| ------------- | :--------: | -------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                          |
| activationKey |   string   | the activation key to query                                                            |
| dataSet       | ref string | returned dataset containing license key records that match the activation key          |
| response      |   string   | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |            |                                                                                        |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Successfully executed query using filter...</result>
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
