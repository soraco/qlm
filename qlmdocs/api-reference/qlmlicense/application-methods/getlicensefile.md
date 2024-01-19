# GetLicenseFile

### Description

Gets a digitally signed license file from the server associated with an Activation Key and a computer ID.

To use a proxy server, you must set the UseProxyServer, ProxyUser, ProxyDomain and ProxyPassword properties prior to calling this function.

You must call DefineProduct before calling this function.

```csharp
 bool GetLicenseFile(string webServiceUrl, 
                     string activationKey, 
                     string computerKey, 
                     string computerID, 
                     out string response);
```

### Parameters

| Parameter     |    Type    | Description                                                                            |
| ------------- | :--------: | -------------------------------------------------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                                                          |
| activationKey |   string   | the license key to activate                                                            |
| computerKey   |   string   | the computer Key associated with the license file (optional)                           |
| computerID    |   string   | unique computer identifier                                                             |
| response      | out string | XML fragment containing the result of the call. The Xml fragment schema is as follows: |
|               |            |                                                                                        |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Success</result>
</QuickLicenseManager>
```

### Example error response

In the event of an error, the XML fragments returns:

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager
```

### Return

| Type | Description                          |
| ---- | ------------------------------------ |
| bool | true if successful; otherwise false. |

### Remarks

The return response is an XML fragment that contains details about the license. This XML fragment is digitally signed with an RSA Private Key. You can parse the XML fragment and convert it to an ILicenseInfo object by using the LicenseInfo.LoadLicenseXml method. In most cases, you will need to store this XML fragment in a file on the end-user system. It is recommended that every time you load the XML fragment from disk, you verify the digital signature by calling QlmLicense.ValidateSignature to ensure that no tampering of the data in the file was performed.

## Example C\#

```c#
LicenseValidator lv = new LicenseValidator();
string computerID = "PCID123";
string licenseFileXml = string.Empty;

if (lv.QlmLicenseObject.GetLicenseFile(string.Empty, "AXDJ0T0Z00AEIX8F8ZHE3J1G8P", "", computerID, out licenseFileXml))
{
    ILicenseInfo li = new LicenseInfo();

    // Parse the xml and populate the LicenseInfo object
    li.LoadLicenseXml (licenseFileXml, computerID);

    // You can now access the data from the LicenseInfo object
    DateTime maintenancePlan = li.MaintenanceRenewalDate;
}
```

```Text
' Assuming lv is an instance of the LicenseValidator class

If lv.LicenseObject.GetLicenseFile("", lv.ActivationKey, "", "", xmlFile) Then
    Dim li As ILicenseInfo
    Set li = lv.GetLicenseInfo()
    Call li.LoadLicenseXml(xmlFile, "")

   'You can now access the data from the LicenseInfo object
    Dim fullName as String
    fullName = li.FullName
End If
```
