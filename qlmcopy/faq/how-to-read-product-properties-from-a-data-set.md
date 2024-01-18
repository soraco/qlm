# How to read Product Properties from a data set

To retrieve product properties from the server, you should typically call [QlmLicense.GetProductProperties](https://support.soraco.co/hc/en-us/articles/115000809763-QlmLicense-GetProductProperties).

If you are already calling [QlmLicense.GetDataSet](https://support.soraco.co/hc/en-us/articles/207294096-QlmLicense-GetDataSet), you already have the product properties in the dataset. You can therefore read them as shown in the example below.

&#x20;

```
string dataSet = string.Empty;
string response;

lv.QlmLicenseObject.GetDataSet(string.Empty, "SubscriptionExpiryDate > '2019-08-20'", ref dataSet, out response);

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
               string pp = dr["Properties"].ToString();
               if (!String.IsNullOrEmpty(pp))
               {
                   IQlmProductProperties pps = new QlmProductProperties(pp);
                   IQlmProductProperty prop = pps.GetProperty("category1", "property1");
                   if (prop != null)
                   {
                       string val = prop.PropValue.ToString();
                       Console.WriteLine(val);
                   }
                }
             }
         }
     }
 }
```
