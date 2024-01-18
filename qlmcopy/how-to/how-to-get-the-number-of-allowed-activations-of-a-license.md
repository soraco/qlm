# How to get the number of allowed activations of a license

There are several ways to get the number of allowed activations associated to a license.

\[Note that this article does not apply to floating licenses]

&#x20;

**1. Number of Activations Embedded in the license key**

The number of activations of a license key is embedded in the Activation Key. You can retrieve it by validating the activation key and then accessing the NumberOfLicenses property as shown in the example below.

&#x20;

private int GetNumLicensesInKey ()\
{\
&#x20;   int numLicenses = -1;

&#x20;   string ak = string.Empty;\
&#x20;   string ck = string.Empty;\
&#x20;   string computerID = Environment.MachineName;\
&#x20;   bool needsActivation = false;\
&#x20;   string returnMessage = string.Empty;

&#x20;   lv.QlmLicenseObject.ReadKeys(ref ak, ref ck);

&#x20;   if (!String.IsNullOrEmpty (ak))\
&#x20;   {\
&#x20;   // Make sure you use the activation key and not the computerKey to check the number of activations             embedded in the key\
&#x20;   // The computerKey will always have a single license embedded in the key, except for floating licenses.\
&#x20;   if (lv.ValidateLicense (ak, string.Empty, computerID, ref needsActivation, ref returnMessage))\
&#x20;   {\
&#x20;       numLicenses = lv.QlmLicenseObject.NumberOfLicenses;\
&#x20;   }\
&#x20;   else if (needsActivation)\
&#x20;   {\
&#x20;       numLicenses = lv.QlmLicenseObject.NumberOfLicenses;\
&#x20;   }\
&#x20;   else\
&#x20;   {\
&#x20;       // the license is not valid\
&#x20;   }\
}

return numLicenses;\
}

&#x20;

**2. Number of activations in the database**

With QLM Pro and QLM Enterprise, an Administrator can edit an already created Activation Key and modify the number of allowed activations. When the number of activations is modified after the activation key is created, the value embedded in the activation key is not updated as this would require creating a new activation key and sending it to the customer. In this case, retrieving the number of activations from the license key itself will return the value embedded in the key rather than the value in the database which would be different. To retrieve the value stored in the database, use the code below.

private int GetNumLicensesInDatabase()\
{\
&#x20;   int numLicenses = -1;

&#x20;   string ak = string.Empty;\
&#x20;   string ck = string.Empty;\
&#x20;   string dataSet = string.Empty;\
&#x20;   string response = string.Empty;

&#x20;   lv.QlmLicenseObject.ReadKeys(ref ak, ref ck);

&#x20;   if (!String.IsNullOrEmpty(ak))\
&#x20;   {\
&#x20;       ILicenseInfo li = lv.QlmLicenseObject.GetLicenseInfo(string.Empty, ak, false, out dataSet, out response);

&#x20;       if (li != null)\
&#x20;       {\
&#x20;           DataRowCollection drc = ReadDataSet(dataSet);

&#x20;           if (drc != null)

&#x20;           {

&#x20;                numLicenses = (int) drc\[0]\["NumLicenses"];

&#x20;            }\
&#x20;       }\
&#x20;   }

&#x20;   return numLicenses;\
}

&#x20;

public DataRowCollection ReadDataSet (string dataSet)\
{\
&#x20;   DataRowCollection drc = null;\
&#x20;   DataSet ds = new DataSet("NewDataSet");\
&#x20;   XmlReader reader = new XmlTextReader(dataSet, XmlNodeType.Document, null);

&#x20;   if (!String.IsNullOrEmpty(dataSet))\
&#x20;   {\
&#x20;       ds.ReadXml(reader);

&#x20;       if (ds.Tables.Count > 0)\
&#x20;       {\
&#x20;           if (ds.Tables\[0].Rows.Count > 0)\
&#x20;           {\
&#x20;               drc = ds.Tables\[0].Rows;\
&#x20;           }\
&#x20;       }\
&#x20;   }\
&#x20;   return drc;\
}
