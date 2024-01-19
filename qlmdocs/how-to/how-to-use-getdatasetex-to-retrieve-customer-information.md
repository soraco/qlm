# How to use GetDataSetEx to retrieve customer information

You can use the [GetDataSetEx](../api-reference/qlmlicense/management-methods/getdatasetex.md) function to retrieve data from QLM tables.

The GetDataSetEx function allows you to specify a table and a filter to focus on the relevant data that you need to retrieve. To retrieve customer information, you should set the table argument to "qryCustomerInfo". The filter is similar to a SQL WHERE clause that uses any field in the Customer table.

In the example below, we demonstrate how to retrieve customers that were created after a specified date.

Note that GetDataSetEx is considered to be part of the [QLM Management API](../api-reference/qlmlicense/management-methods/) and should **never** be called from within your application.

```csharp
private void GetCustomerInfo()
{
string dataSet = string.Empty;
string response = string.Empty;
string filter = String.Format("CreationDate > '2023-03-01'");

lv.QlmLicenseObject.GetDataSetEx(string.Empty, "qryCustomerInfo", filter, ref dataSet, out response);

ILicenseInfo licenseInfo = new LicenseInfo();
string message = string.Empty;

if (lv.QlmLicenseObject.ParseResults (response, ref licenseInfo, ref message))
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
                    string email = dr["Email"].ToString();
                    Console.WriteLine(email);
                }
            }
        }
    }
}
}
```
