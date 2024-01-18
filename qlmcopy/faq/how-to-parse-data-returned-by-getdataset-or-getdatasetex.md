# How to parse data returned by GetDataSet or GetDataSetEx

The dataSet returned by GetDataSet or GetDataSetEx can be parsed as follows:

```csharp
string dataSet = string.Empty;            
string response = string.Empty;

// retrieve data for a specific activation key
string filter = "ActivationKey='" + activationKey + "'";

license.GetDataSetEx(webServiceUrl, "qryLicenseInfo", filter,
                    ref dataSet, out response);
                    
DataSet ds = new DataSet("NewDataSet");            
XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);
if (!String.IsNullOrEmpty (dataSet))            
{                
    ds.ReadXml(reader);
    if ((ds.Tables.Count > 0) && (ds.Tables[0].Rows.Count > 0))                
    {                    
        DataRowCollection drc = ds.Tables[0].Rows;
        if (drc != null)                    
        {                        
            foreach (DataRow dr in drc)                        
            {                            
                string computerKey = dr["computerkey"].ToString();
            }          
        }                
    }            
}
```
