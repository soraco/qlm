# How to read product properties from a license file

When a license file is generated on the server, it embeds Product Properties associated with the license.

The code below shows how to extract the Product Properties from the license file.

Assuming lv is an instance of a LicenseValidator class, and that the license is bound to the computer name:

```
string licenseFileXml;
string computerID = Environment.MachineName;

if (lv.QlmLicenseObject.GetLicenseFile(string.Empty, lv.ActivationKey, string.Empty, 
                                        computerID, out licenseFileXml))
{
        ILicenseInfo li = new LicenseInfo();
        
        // Parse the xml and populate the LicenseInfo object
        li.LoadLicenseXml(licenseFileXml, computerID);

        QlmProductProperties pps = new QlmProductProperties();
        pps.Deserialize(li.ProductProperties);

        foreach (QlmProductProperty pp in pps.Properties)
        {
             Console.WriteLine(String.Format("Property: {0}, Value: {1}", 
                                pp.ToString(), pp.PropValue));
        }
}
```
