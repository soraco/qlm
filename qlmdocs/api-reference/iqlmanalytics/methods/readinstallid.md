# ReadInstallID

### Description

Reads the installID stored in a cookie by the WriteInstallID API.

Use the FavorMachineLevelLicenseKey to control which key takes precedence if the\
keys are stored at the user and machine level.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```csharp
 string ReadInstallID(out string errorMessage)
```

### Parameters

| Parameter    |  Type  | Description                    |
| ------------ | :----: | ------------------------------ |
| errorMessage | string | retuned error message, if any. |

### Return

| Type   | Description   |
| ------ | ------------- |
| string | the installID |

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
