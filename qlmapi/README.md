# Overview

### QLM API Categories

| API                                                                               | Description                                                                                                        |
| --------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| [Client-Side API](iqlmlicense/client-side-methods/)                               | API used in your application that performs local operations without contacting the License Server                  |
| [License Server Application API](iqlmlicense/license-server-application-methods/) | API used in your application that contacts the License Server to query or update information                       |
| [License Server Management API](iqlmlicense/license-server-management-methods/)   | API used outside the context of your application to integrate QLM with other 3rd party tools such as a CRM system. |
| [Analytics API](iqlmanalytics/)                                                   | API related to the QLM Analytics features in QLM Enterprise                                                        |
| [Cloud-based Floating License API](iqlmcloudfloatinglicensehelper/)               | API used in your application for operations related to Cloud-based floating licenses.                              |
| [On-premise Floating License API](iqlmfloatinglicensemgr/)                        | API used in your application for operations related to on-premise floating licenses.                               |
| [HTTP Methods](http-methods/)                                                     | API that can be invoked via a URL, typically used for integration with eCommerce providers.                        |

### QLM API Classes

| Class                                                            | Description                                                                             |
| ---------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| I[QlmLicense](iqlmlicense/)                                      | This is the main licensing class that provides access to the core functionality of QLM. |
| I[LicenseInfo](ilicenseinfo/)                                    | Hold license information                                                                |
| [QlmHardware](iqlmhardware/)                                     | Class to extract hardware information                                                   |
| [QlmCustomerInfo](iqlmcustomerinfo/)                             | Holds customer information                                                              |
| [QlmAnalytics](iqlmanalytics/)                                   | Exposes all methods related to the Analytics feature                                    |
| [QlmCloudFloatingLicenseHelper](iqlmcloudfloatinglicensehelper/) | Helper class for cloud-based floating licenses                                          |
| [QlmFloatingLicenseHelper](iqlmfloatinglicensehelper/)           | Helper class for on-premise floating licenses                                           |
| [QlmFloatingLicenseMgr](iqlmfloatinglicensemgr/)                 | Main class for on-premise floating licenses                                             |
| [QlmProductProperties](iqlmproductproperties/)                   | Manages a collection of Product Properties                                              |
| [QlmProductProperty](iqlmproductproperty/)                       | Main class for working with product properties                                          |
