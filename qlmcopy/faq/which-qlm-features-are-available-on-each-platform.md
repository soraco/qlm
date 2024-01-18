# Which QLM features are available on each platform?

QLM supports Windows and non-Windows platforms.

On Windows, QLM uses a .NET based API to protect your application. We currently support .NET Framework, .NET Standard and .NET Core. Note that the .NET based API can be used from most programming languages such as VC++, C++ Builder, Office Apps, Delphi, etc.

On non-Windows platforms, QLM uses a combination of a REST API and a platform / language specific client side library (source code included) to protect your application. Some of the features available on Windows are not currently supported on non-Windows platforms. The section below lists **some** of these features (this is not an exhaustive list):

* On premise floating / concurrent licensing.
* QLM License Wizard: the license wizard is a Windows executable that is only supported on Windows. A cross platform version of the wizard is in progress. It will be based on .NET Core.
* The [Application API](https://support.soraco.co/hc/en-us/sections/201730736-License-Server-Application-API) and [Management API, ](https://support.soraco.co/hc/en-us/sections/201720373-License-Server-Management-API)which are .NET based, are not supported on non-Windows platforms. Instead, you can use [the REST like API](https://support.soraco.co/hc/en-us/sections/201730676-HTTP-Methods) to communicate with the License Server for operations such as activating a license key, validating a license key or deactivating a license key.
* MaxDaysOffline: the ability to specify the maximum number of days a user can go without contacting the license server.
* Predefined License Binding, i.e. only UserDefined license binding is supported.

In short, the operations that can be performed, out-of-the-box, from a non-Windows application are:

* Activating a license key
* Validating a license key
* Deactivating a license key
