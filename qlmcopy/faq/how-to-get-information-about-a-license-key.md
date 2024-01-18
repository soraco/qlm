# How to get information about a license key

To retrieve information about a specific license key from the License Server, call the [GetLicenseInfo](https://support.soraco.co/hc/en-us/articles/210597466-QlmLicense-GetLicenseInfo) API. If the call is successful, the ILicenseInfo will be populated with the most common fields associated to the license. If the field you are interested in is not part of the ILicenseInfo structure, you can retrieve it by parsing the returned dataSet.

If the call fails, the return value will be null.

&#x20;

**C# Example:**

```
// Assuming lv is an instance of the LicenseValidator class:

string dataSet;
string response;
QlmLicenseLib.ILicenseInfo licenseInfo;

licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, lv.ActivationKey, false, out dataSet, out response);

if (licenseInfo != null)
{
 // access the licenseInfo structure
 string computerKey = licenseInfo.ComputerKey;

 // If you want access to all the fields, access the dataSet
 DataSet ds = new DataSet("NewDataSet");
 XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);

 if (!String.IsNullOrEmpty(dataSet))
 {
    ds.ReadXml(reader);

    if ((ds.Tables.Count > 0) && ds.Tables[0].Rows.Count > 0)
    {
        DataRow dr = ds.Tables[0].Rows[0];

        string computerID = dr["ComputerID"].ToString();
        int numLicenses = (int) dr["NumLicenses"];
        int availableLicenses = (int)dr["AvailableLicenses"];
        bool revoked = (bool)dr["Disabled"];
        string enabledFeatures = dr["Features"].ToString();
        int[] features = lv.QlmLicenseObject.ConvertFeaturesToArray(enabledFeatures);
     }
   }
 }
```

**VB.NET Example:**

```
' Assuming lv is an instance of the LicenseValidator class:

Dim dataSet As String
 Dim response As String
 Dim licenseInfo As QlmLicenseLib.ILicenseInfo

dataSet = String.Empty
 response = String.Empty

licenseInfo = lv.QlmLicenseObject.GetLicenseInfo(String.Empty, "BXH8060G00S3TUVW8Y9Z111EFF3TV8IAPMHZUFD", False, dataSet, response)

If (licenseInfo IsNot Nothing) Then

    ' access the licenseInfo structure

     Dim computerKey As String

computerKey = licenseInfo.ComputerKey;
 End If
```

**VC++Example:**

```
CComBSTR bstrDataset;
CComBSTR bstrResponse;
ILicenseInfoPtr li = m_lv->license->GetLicenseInfo(_bstr_t(""), _bstr_t(m_lv->activationKey), VARIANT_FALSE, &bstrDataset, &bstrResponse);
ELicenseModel licenseModel = li->LicenseModel;
```
