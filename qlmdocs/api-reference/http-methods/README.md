# HTTP Methods

The HTTP Methods are methods that can be invoked via a URL.

Most of the HTTP methods are designed to be invoked from cross-platform apps (Java, Objective-C, Javascript, Qt, etc.) or from 3rd party processes such as your eCommerce provider during the purchasing process.

There are a number of options you can use to restrict access to HTTP methods:

* Each HTTP method can be disabled by setting a server property (see the \*\*security \*\*section of server properties)
* You can require a [user/password ](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider)to call an HTTP method.
* You can restrict access to some HTTP methods by IP address (v16.1+) by configuring the server properties httpAdminMethods and httpAdminMethodsAllowedIPAddresses.

Some HTTP methods, such as [RetrieveActivationKeyHttp](ref:retrieveactivationkeyhttp), require the user of [QLM strict authentication](https://support.soraco.co/hc/en-us/articles/360045904672-How-to-invoke-a-QLM-HTTP-Method-that-requires-strict-authentication).

The HTTP methods are not quite as extensive as the .NET API but cover essential functionality such as:

* Validating a license ([ValidateLicenseHttp](https://soraco.readme.io/reference/validatelicensehttp))
* Activating a license ([ValidateLicenseHttp](https://soraco.readme.io/reference/validatelicensehttp))
* Checking if a license was revoked ([ValidateLicenseHttp](https://soraco.readme.io/reference/validatelicensehttp))
* Deactivating a license ([ReleaseLicenseHttp](https://soraco.readme.io/reference/releaselicensehttp))
* Publishing Analytics ([AnalyticsAddInstallHttp](https://soraco.readme.io/reference/analyticsaddinstallhttp), AnalyticsRemoveInstallHttp, [AnalyticsUpdateInstallHttp](https://soraco.readme.io/reference/analyticsupdateinstallhttp),

[AnalyticsUpdateLastAccessedDateHttp](https://soraco.readme.io/reference/analyticsupdatelastaccesseddatehttp))

* Getting the latest version ([GetLatestVersionHttp](https://soraco.readme.io/reference/getlatestversionhttp))

Note that all other methods exposed by the QLM License Server cannot be called directly via SOAP. In order to communicate with the QLM License Server, you need to use the QLM .NET API methods that are exposed via the QLMLicenseLib.dll.
