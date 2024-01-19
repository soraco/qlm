# UpdateInstallEx

### Description

Updates information of a registered installation on the server.

Note that to call this function, you must initialize the QlmAnalytics object with the following properties:

* WebServiceUrl
* CommunicationEncryptionKey
* GUID (persistence key)

```csharp
bool UpdateInstallEx(string installID, string softwareVersion, 
                   string osVersion, string computerName, 
                   string computerID, string activationKey, 
                   string computerKey, bool trial, 
                   string productName, 
                   int majorVersion, int minorVersion,
                   string customData1, string customData2, string customData3)
```

### Parameters

| Parameter       |  Type  | Description                                                              |
| --------------- | :----: | ------------------------------------------------------------------------ |
| installID       | string | unique identifier of this installation, returned by a call to AddInstall |
| softwareVersion | string | version of your software                                                 |
| osVersion       | string | version of the operating system                                          |
| computerName    | string | name of the computer.                                                    |
| computerID      | string | unique computer identifier                                               |
| activationKey   | string | activation key on the system                                             |
| computerKey     | string | computer key associated with the system                                  |
| trial           |  bool  | flag indicating if the license is a trial                                |
| productName     | string | name of your product                                                     |
| majorVersion    |   int  | major version of your product                                            |
| minorVersion    |   int  | minor version of your product                                            |
| customData1     | string | your own custom data                                                     |
| customData2     | string | your own custom data                                                     |
| customData3     | string | your own custom data                                                     |

### Return

| Type    | Description                                             |
| ------- | ------------------------------------------------------- |
| Boolean | true if the operation was successful; otherwise, false. |

### Remarks

To instruct the server to not update the value of a custom data field, set the value to null.

### Example

```csharp
// license  is an instance of a QlmLicense object. When using the LicenseValidator class, 
// you should use licenseValidator.QlmLicenseObject.

try
{
  QlmAnalytics analytics = new QlmAnalytics(license);

  string errorMessage;

  string installID = analytics.ReadInstallID(out errorMessage);

  analytics.UpdateInstallEx(installID,
                              version, analytics.GetOperatingSystem(),
                              Environment.MachineName, computerID,
                              activationKey, this.computerKey, license.IsEvaluation(),
                              license.ProductName, license.MajorVersion, license.MinorVersion,
                              "My Custom Data1", null, null
                             );
}
catch (Exception ex)
{
  Console.WriteLine(ex.Message);
}
```
