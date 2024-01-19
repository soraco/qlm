# Overview

### QLM API Categories

| API                              | Description                                                                                                        |
| -------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| Client-Side API                  | API used in your application that performs local operations without contacting the License Server                  |
| License Server Application API   | API used in your application that contacts the License Server to query or update information                       |
| License Server Management API    | API used outside the context of your application to integrate QLM with other 3rd party tools such as a CRM system. |
| Analytics API                    | API related to the QLM Analytics features in QLM Enterprise                                                        |
| Cloud-based Floating License API | API used in your application for operations related to Cloud-based floating licenses.                              |
| On-premise Floating License API  | API used in your application for operations related to on-premise floating licenses.                               |
| [HTTP Methods](http-methods/)    | API that can be invoked via a URL, typically used for integration with eCommerce providers.                        |

### QLM API Classes

| Class                                                             | Description                                                                             |
| ----------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| [IQlmLicense](qlmlicense/)                                        | This is the main licensing class that provides access to the core functionality of QLM. |
| [ILicenseInfo](ilicenseinfo/)                                     | Hold license information                                                                |
| [IQlmHardware](iqlmhardware/)                                     | Class to extract hardware information                                                   |
| [IQlmCustomerInfo](iqlmcustomerinfo/)                             | Holds customer information                                                              |
| [IQlmAnalytics](iqlmanalytics/)                                   | Exposes all methods related to the Analytics feature                                    |
| [IQlmCloudFloatingLicenseHelper](iqlmcloudfloatinglicensehelper/) | Helper class for cloud-based floating licenses                                          |
| [IQlmFloatingLicenseHelper](iqlmfloatinglicensehelper/)           | Helper class for on-premise floating licenses                                           |
| [IQlmFloatingLicenseMgr](iqlmfloatinglicensemgr/)                 | Main class for on-premise floating licenses                                             |
| [IQlmProductProperties](iqlmproductproperties/)                   | Manages a collection of Product Properties                                              |
| [IQlmProductProperty](iqlmproductproperty/)                       | Main class for working with product properties                                          |
