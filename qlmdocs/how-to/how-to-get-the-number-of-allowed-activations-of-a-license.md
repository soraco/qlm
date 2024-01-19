# How to get the number of allowed activations of a license

There are several ways to get the number of allowed activations associated with a license.

\[Note that this article does not apply to floating licenses]

**1. Number of Activations Embedded in the license key**

The number of activations of a license key is embedded in the Activation Key. You can retrieve it by validating the activation key and then accessing the NumberOfLicenses property as shown in the example below.

{% code overflow="wrap" %}
```csharp
private int GetNumLicensesInKey ()
{
    int numLicenses = -1;
    string ak = string.Empty;
    string ck = string.Empty;
    string computerID = Environment.MachineName;
    bool needsActivation = false;
    string returnMessage = string.Empty;
    lv.QlmLicenseObject.ReadKeys(ref ak, ref ck);
    if (!String.IsNullOrEmpty (ak))
    {
    // Make sure you use the activation key and not the computerKey to check the number of activations             embedded in the key
    // The computerKey will always have a single license embedded in the key, except for floating licenses.
    if (lv.ValidateLicense (ak, string.Empty, computerID, ref needsActivation, ref returnMessage))
    {
        numLicenses = lv.QlmLicenseObject.NumberOfLicenses;
    }
    else if (needsActivation)
    {
        numLicenses = lv.QlmLicenseObject.NumberOfLicenses;
    }
    else
    {
        // the license is not valid
    }
}
return numLicenses;
}
```
{% endcode %}

&#x20;

**2. Number of activations in the database**

With QLM Pro and QLM Enterprise, an Administrator can edit an already created Activation Key and modify the number of allowed activations. When the number of activations is modified after the activation key is created, the value embedded in the activation key is not updated as this would require creating a new activation key and sending it to the customer. In this case, retrieving the number of activations from the license key itself will return the value embedded in the key rather than the value in the database which would be different. To retrieve the value stored in the database, use the code below.

{% code overflow="wrap" %}
```csharp
private int GetNumLicensesInDatabase()
{
    int numLicenses = -1;
    string ak = string.Empty;
    string ck = string.Empty;
    string dataSet = string.Empty;
    string response = string.Empty;
    lv.QlmLicenseObject.ReadKeys(ref ak, ref ck);
    if (!String.IsNullOrEmpty(ak))
    {
        ILicenseInfo li = lv.QlmLicenseObject.GetLicenseInfo(string.Empty, ak, false, out dataSet, out response);
        if (li != null)
        {
            DataRowCollection drc = ReadDataSet(dataSet);
            if (drc != null)
            {
                 numLicenses = (int) drc[0]["NumLicenses"];
             }
        }
    }
    return numLicenses;
}
 
public DataRowCollection ReadDataSet (string dataSet)
{
    DataRowCollection drc = null;
    DataSet ds = new DataSet("NewDataSet");
    XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);
    if (!String.IsNullOrEmpty(dataSet))
    {
        ds.ReadXml(reader);
        if (ds.Tables.Count > 0)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                drc = ds.Tables[0].Rows;
            }
        }
    }
    return drc;
}
```
{% endcode %}
