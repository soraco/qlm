# WriteInstallID

### Description

Writes the installID into a QLM cookie on the end user system. To read keys, use the [ReadInstallID ](https://soraco.readme.io/reference/readinstallid)API.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```csharp
 bool WriteInstallID(string installID, out string errorMessage)
```

### Parameters

| Parameter    |  Type  | Description                                                              |
| ------------ | :----: | ------------------------------------------------------------------------ |
| installID    | string | unique identifier of this installation, returned by a call to AddInstall |
| errorMessage | string | returned error message containing details about the failure, if any.     |

### Return

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |

## Example

This example publishes Analytics to the License Server. The QlmAnalytics object is first initialized using a QlmLicense object. We then check if there's an InstallID already registered on the system. If no InstallID is found, we add this computer as a new installation. Otherwise, we simply update the data of the existing installation.

```csharp
// license  is an instance of a QlmLicense object. When using the LicenseValidator class, 
// you should use licenseValidator.QlmLicenseObject.

try
{
  QlmAnalytics analytics = new QlmAnalytics(license);

  string errorMessage;

  string installID = analytics.ReadInstallID(out errorMessage);

  AssemblyName assemblyName = Assembly.GetEntryAssembly().GetName();
  string version = assemblyName.Version.ToString();

  if (String.IsNullOrEmpty(installID))
  {
    bool ret = analytics.AddInstallEx(version, analytics.GetOperatingSystem(),
                                      Environment.MachineName, computerID,
                                      activationKey, this.computerKey, license.IsEvaluation(),
                                      license.ProductName, license.MajorVersion, license.MinorVersion,
                                      customData1, customData2, customData3,
                                      ref installID);

    if (ret == true)
    {
      analytics.WriteInstallID(installID, out errorMessage);
    }
  }
  else
  {
    analytics.UpdateInstallEx(installID,
                              version, analytics.GetOperatingSystem(),
                              Environment.MachineName, computerID,
                              activationKey, this.computerKey, license.IsEvaluation(),
                              license.ProductName, license.MajorVersion, license.MinorVersion,
                              customData1, customData2, customData3
                             );
  }
}
catch (Exception ex)
{
  Console.WriteLine(ex.Message);
}

```
