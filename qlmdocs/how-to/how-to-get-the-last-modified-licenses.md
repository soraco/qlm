# How to get the last modified licenses

To retrieve the list of licenses modified since a specific date, you must first enable the server property "options/updateLastAccessedDateAfterAnyEdit".

QLM stores the last modified date in a field called "LastAccessedDate". To understand when the LastAccessedDate is modified, check this [article](https://docs.soraco.co/docs/faq/when-is-the-lastaccesseddate-field-updated).

<mark style="color:orange;">Important: This article uses the QLM Management API which should never be called from within your application.</mark>

{% code overflow="wrap" %}
```csharp
private void GetLastModifiedLicenses (DateTime lastDate)
{
    //Make sure that the AdminEncryptionKey is set before calling GetDataSet
    //This code should never be called from within your application
    lv.QlmLicenseObject.AdminEncryptionKey = "{B6163D99-F46A-4580-BB42-BF276A507A14}";

    //Create a filter to retrieve the last modified records since the specified date
    string filter = String.Format("LastAccessedDate >= '{0}'", lastDate.ToString(QlmLicense.DATE_FORMAT));

    string dataSet = string.Empty;
    string response;
    lv.QlmLicenseObject.GetDataSet(string.Empty, filter, ref dataSet, out response);

    string errorMessage;

    // load the data into a list of ILicenseInfo objects
    List<ILicenseInfo> licenseInfoList = LicenseInfo.LoadLicenseInfoListFromDataset(dataSet, out errorMessage);

    if (licenseInfoList != null)
    {
        Console.WriteLine(String.Format("{0} licenses were modified since {1}", licenseInfoList.Count, lastDate.ToString(QlmLicense.DATE_FORMAT)));
        foreach (ILicenseInfo licenseInfo in licenseInfoList)
        {
            Console.WriteLine(licenseInfo.ActivationKey);
        }
    }
}
```
{% endcode %}

###
