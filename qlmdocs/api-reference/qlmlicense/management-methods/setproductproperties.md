# SetProductProperties

### Description

Sets the Product Properties associated to an Activation Key.

SetProductProperties should typically never be called from within your application. SetProductProperties is considered to be part of the License Server Management API and therefore prior to calling it, you must set the QlmLicense.AdminEncryptionKey property.

If you must call SetProductProperties from within your application, we recommend that you do not set the QlmLicense.AdminEncryptionKey property in your application but rather set the Server Property setProductPropertiesUseAdminEncryptionKey property to false. You can set Server Properties from the QLM Management Console / Manage Keys / Sites / Server Properties / options.

```csharp
bool SetProductProperties (string webServiceUrl, string activationKey, 
                           string propertiesXml, out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                                   |
| ------------- | :----: | --------------------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.                |
| activationKey | string | activation key to set the maintenance plan on |
| propertiesXml | string | an xml fragment of product properties         |
| errorMessage  | string | returned error message                        |

### Return

| Type | Description                                               |
| ---- | --------------------------------------------------------- |
| bool | returns true if the operation succeeded; false otherwise. |

### Example

```c#
LicenseValidator lv = new LicenseValidator();

string props = lv.QlmLicenseObject.GetProductProperties(string.Empty, "AXDJ0T0Z00AEIX8F8ZHE3J1G8P", out response);

QlmProductProperties pps = new QlmProductProperties();
pps.Deserialize(props);

foreach (QlmProductProperty pp in pps.Properties)
{
    Console.WriteLine(String.Format("Property: {0}, Value: {1}", pp.ToString(), pp.PropValue));
    if ((pp.Name == "my_name") && (pp.Category == "my_category"))
    {
        pp.PropValue = 1;
    }
}

string xml = pps.Serialize();

string returnMessage;
lv.QlmLicenseObject.AdminEncryptionKey = "{14f3b542-8547-414f-a42b-1d571bd733d4}";
if (lv.QlmLicenseObject.SetProductProperties("", activationKey, xml, out returnMessage) == false)

{

// Check the returnMessage

}
```
