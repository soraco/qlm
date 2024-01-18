# How to get an Organization ID from an Organization Name

The code below returns the Organization ID given an Organization Name.

```
private long GetOrganizationID (string organizationName)
{
 long orgID = -1;
 string dataSet = string.Empty;
 string response = string.Empty;

 string filter = String.Format("OrganizationName='{0}'", organizationName);

 // Assuming lv is an instance of the QLM LicenseValidator class
 lv.QlmLicenseObject.GetOrganizations(string.Empty, filter, ref dataSet, out response);

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
                 orgID = (long) dr["OrganizationID"];
                 Console.WriteLine(orgID.ToString());
                 break;
             }
          }
       }
  }

 return orgID;
}
```
