# GetFloatingLicenseLocation

### Description

Gets the location of the floating license database (or xml file). The location can be published to the License Server by calling the [PublishFloatingLicenseLocation ](https://soraco.readme.io/reference/publishfloatinglicenselocation)method.

In order to ensure that a user has not duplicated the floating license database, you can call [PublishFloatingLicenseLocation ](https://soraco.readme.io/reference/publishfloatinglicenselocation)to set the location of the floating license database when it is initially registered.

Subsequently, when your application starts up, you can call GetFloatingLicenseLocation and compare the registered location with the real location of the database.

Note: this functionality requires a connection to the License Server. You should call the QlmLicense.PingEx method before calling [PublishFloatingLicenseLocation ](https://soraco.readme.io/reference/publishfloatinglicenselocation)to verify if you can connect to the License Server.

```csharp
QlmActivationStatus GetFloatingLicenseLocation(string webServiceUrl,
                                               out string location,
                                               out string errorMessage)
```

### Parameters

| Parameter     |  Type  | Description                     |
| ------------- | :----: | ------------------------------- |
| webServiceUrl | string | URL to the QLM License Server.  |
| location      | string | Path of the floating license DB |
| errorMessage  | string | returned error message          |

### Return

| Type                                                                                        | Description                      |
| ------------------------------------------------------------------------------------------- | -------------------------------- |
| [QlmActivationStatus](https://dash.readme.com/project/soraco/v1.0/refs/qlmactivationstatus) | status of the license activation |
