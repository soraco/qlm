# How to retrieve activation information from the License Server

To retrieve license activation information for a specific Activation Key from the License Server, there are two different use cases to consider:

1. Single Activation Key
2. Multiple Activations Key

License Information for single activation license keys is stored in the QLM main License Keys table and can be readily retrieved by calling the [GetLicenseInfo](https://support.soraco.co/hc/en-us/articles/210597466-QlmLicense-GetLicenseInfo) method.

&#x20;

For multiple activation license keys, license information is stored in a separate table called ActivationLog. You must therefore retrieve the information from this table by calling [GetActivationLog](https://support.soraco.co/hc/en-us/articles/360040197792-QlmLicense-GetActivationLog) and then retrieve the record from this table that corresponds to the client computer.

The code sample below illustrates how to retrieve the IP Address for a given activation. The lv

&#x20;

```
string ipAddress;

// lv is an instance of the LicenseValidator class 
// the code below assumes that you have already called lv.ValidateLicenseAtStartup

GetLicenseInformation (Environment.MachineName, out ipAddress);
```

&#x20;

```
private void GetLicenseInformation (string computerID, out string ipAddress)
{
    ipAddress = string.Empty;

    lv.QlmLicenseObject.GetLicenseInfo(string.Empty, lv.ActivationKey, false, out string dataSet, out string response);

    ILicenseInfo licenseInfo = new LicenseInfo();
    string message = string.Empty;

    if (lv.QlmLicenseObject.ParseResults(response, ref licenseInfo, ref message))
    {

        DataSet ds = new DataSet("NewDataSet");
        XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);

        if (!String.IsNullOrEmpty(dataSet))
        {
            ds.ReadXml(reader);

            if ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0))
            {
                DataRowCollection drc = ds.Tables[0].Rows;

                if ((drc != null) && (drc.Count > 0))
                {
                    DataRow dr = drc[0];

                    int numLicenses = (int)dr["NumLicenses"];
                    if (numLicenses <= 1)
                    {
                        ipAddress = dr["IP_Address"].ToString();
                    }
                    else
                    {
                        GetLicenseInfoFromActivationLog(computerID, out ipAddress);
                     }
                  }
             }
         }
      }
      else
      {
          throw new Exception(message);
      }
}

private void GetLicenseInfoFromActivationLog(string computerID, out string ipAddress)
{
    string dataSet = string.Empty;
    ipAddress = string.Empty;

    lv.QlmLicenseObject.GetActivationLog(string.Empty, lv.ActivationKey, ref dataSet, out string response);

    if (!String.IsNullOrEmpty (dataSet))
    {
        DataSet ds = new DataSet("NewDataSet");
        XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);

        if (!String.IsNullOrEmpty(dataSet))
        {
            ds.ReadXml(reader);

            if ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0))
            {
                DataRowCollection drc = ds.Tables[0].Rows;

                if (drc != null) 
                {
                    foreach (DataRow dr in drc)
                    {
                        string dbComputerID = (string) dr["ComputerID"];
                        if (String.Compare (computerID, dbComputerID) == 0)
                        {
                            ipAddress = dr["IP_Address"].ToString();
                            break;
                         }
                      }
                   }
              }
          }
          else
          {
              throw new Exception("Failed to get the activation log");
          }
    }
}
```

&#x20;

As an alternative, you can also retrieve license information by calling the [GetLicenseFile](https://support.soraco.co/hc/en-us/articles/360014382991-QlmLicense-GetLicenseFile) method which returns a digitally signed XML file contained information about the license
