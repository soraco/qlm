# GetProductProperties

### Description

Gets the Product Properties associated to an Activation Key.

```c#
string GetProductProperties (string webServiceUrl,
                             string activationKey, 
                             out string response)

```

### Parameters

| Parameter     |    Type    | Description                                     |
| ------------- | :--------: | ----------------------------------------------- |
| webServiceUrl |   string   | URL to the QLM License Server                   |
| activationKey |   string   | the activation key                              |
| response      | out string | XML fragment containing the result of the call. |

### Response XML format

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<result>Success</result>
</QuickLicenseManager>

```

### Example error response

```xml
<?xml version='1.0' encoding='UTF-8'?>
<QuickLicenseManager>
<error>Details about the error</error>
</QuickLicenseManager>
```

### Return

| Type   | Description                                                                                |
| ------ | ------------------------------------------------------------------------------------------ |
| string | The return value is an XML fragment that contains all product properties and their values. |

### Remarks

The return value is an XML fragment that contains all product properties and their values. This XML fragment is digitally signed with an RSA Private Key. You can parse the XML fragment and convert it to a QlmProductProperty object by using the QlmProductProperties Deserialize method. In most cases, you will need to store this XML fragment in a file on the end-user system. It is recommended that every time you load the XML fragment from disk, you verify the digital signature to ensure that no tampering of the data in the file was performed.

### Example

```c#
LicenseValidator lv = new LicenseValidator();

string props = lv.QlmLicenseObject.GetProductProperties(string.Empty, "AXDJ0T0Z00AEIX8F8ZHE3J1G8P", out response);

QlmProductProperties pps = new QlmProductProperties();

// Before deserializing the data, check its signature

// The Public Key can be found in Define Products / Encryption Keys / Non-Windows Encryption Keys

string publicKey = "<RSAKeyValue><Modulus>uZsys/30c2wfP4ywq/Paxmztc/+p8vCgMzxHpguP3AMOtbUFMWC8RDhjdzQE5AuNXChVnp9IAs4MNKWMoVwfVLyDXVlVPaFKTPIbDmUMtz/8t0C4TOXcOTMMEPmvKvg8nolHWfdxJeF5jfOdDl/3TNtgATkSUDiT1ltLR6MaG9s=</Modulus><Exponent>AQAB</Exponent></RSAKeyValue>";

string errorMessage;

if (pps.ValidateSignature (props, publicKey, out errorMessage) == false)

{

    throw new Exception (errorMessage);

}
pps.Deserialize(props);

// Enumerate through the properies - only possible from .NET applications

foreach (QlmProductProperty pp in pps.Properties)
{
    Console.WriteLine(String.Format("Property: {0}, Value: {1}", pp.ToString(), pp.PropValue));
}

// Access a specific property

IQlmProductProperty pprop = pps.GetProperty("category", "number_of_clicks");
if (pprop != null)
{
    string val = pprop.PropValue.ToString();
}
```
