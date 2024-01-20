# How to get the activated computers for a given activation key

To get the activated computers for a given activation key, there are 2 cases to consider: (a) the activation key is a single activation key and (b) the activation key is a multiple activations key.

In both cases, you need to use the GetDataSetEx API. For single activation keys, the "table" argument of GetDataSetEx must be set to "qryLicenseInfo". For multiple activation keys, the "table" argument of GetDataSetEx must be set to "qryActivationLog" (or "ActivationLog" for QLM v8 and earlier).

_Note that in order to call the GetDataSetEx method, you must set the license.AdminEncryptionKey property. It is not recommended to call this method from your application. The GetDataSetEx method belongs to the_ [_QLM Management API group_](https://support.soraco.co/hc/en-us/sections/201720373-License-Server-Management-API) _which should never be called from the application. It should be called from your server._

**Single Activation Key Example**

{% code overflow="wrap" %}
```csharp
// make sure to strip out dashes from the activationKey 
string activationKey = "AMTP0R0K00GHJ3K38N3Q1S17TX552TTFV3W8R8";
string dataSet = string.Empty;
string response = string.Empty;

license.GetDataSetEx(string.Empty, "qryLicenseInfo", "ActivationKey='" + activationKey + "'", ref dataSet, out response);

DataSet ds = new DataSet("NewDataSet");
XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);
if (!String.IsNullOrEmpty(dataSet))
{
    ds.ReadXml(reader);
    if (ds.Tables[0].Rows.Count > 0)
    {
        DataRowCollection drc = ds.Tables[0].Rows;
        if (drc != null)
        {
            foreach (DataRow dr in drc)
            {
                string computerKey = dr["computerkey"].ToString();
                string computerName = dr["computerName"].ToString();
                string computerID = dr["computerID"].ToString();
            }
        }
    }
}
```
{% endcode %}

**Multiple Activations Key Example**

{% code overflow="wrap" %}
```csharp
// make sure to strip out dashes from the activationKey 
string activationKey = "AMTP0R0K00GHJ3K38N3Q1S17TX552TTFV3W8R8"; 
string dataSet = string.Empty;
string response = string.Empty;

license.GetDataSetEx(string.Empty, "qryActivationLog", "ActivationKey='" + activationKey + "'", ref dataSet, out response);

DataSet ds = new DataSet("NewDataSet");
XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);
if (!String.IsNullOrEmpty(dataSet))
{
    ds.ReadXml(reader);
    if (ds.Tables[0].Rows.Count > 0)
    {
        DataRowCollection drc = ds.Tables[0].Rows;
        if (drc != null)
        {
            foreach (DataRow dr in drc)
            {
                string computerKey = dr["computerkey"].ToString();
                string computerName = dr["computerName"].ToString();
                string computerID = dr["computerID"].ToString();
            }
        }
    }
}
```
{% endcode %}
