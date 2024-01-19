# HTTP Methods

The HTTP Methods are methods that can be invoked via a URL.

Most of the HTTP methods are designed to be invoked from cross-platform apps (Java, Objective-C, Javascript, Qt, etc.) or 3rd party processes such as your eCommerce provider during the purchasing process.

There are several options you can use to restrict access to HTTP methods:

* Each HTTP method can be disabled by setting a server property (see the \*\*security \*\*section of server properties)
* You can require a [user/password ](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider)to call an HTTP method.
* You can restrict access to some HTTP methods by IP address (v16.1+) by configuring the server properties httpAdminMethods and httpAdminMethodsAllowedIPAddresses.

Some HTTP methods, such as [RetrieveActivationKeyHttp](retrieveactivationkeyhttp.md), require the user of [QLM strict authentication](https://support.soraco.co/hc/en-us/articles/360045904672-How-to-invoke-a-QLM-HTTP-Method-that-requires-strict-authentication).

The HTTP methods are not quite as extensive as the .NET API but cover essential functionality such as:

* Validating a license ([ValidateLicenseHttp](validatelicensehttp.md))
* Activating a license ([ValidateLicenseHttp](validatelicensehttp.md))
* Checking if a license was revoked ([ValidateLicenseHttp](validatelicensehttp.md))
* Deactivating a license ([ReleaseLicenseHttp](releaselicensehttp.md))
* Publishing Analytics ([AnalyticsAddInstallHttp](analyticsaddinstallhttp.md), AnalyticsRemoveInstallHttp, [AnalyticsUpdateInstallHttp](analyticsupdateinstallhttp.md), [AnalyticsUpdateLastAccessedDateHttp](analyticsupdatelastaccesseddatehttp.md))
* Getting the latest version ([GetLatestVersionHttp](getlatestversionhttp.md))

Note that all other methods exposed by the QLM License Server cannot be called directly via SOAP. In order to communicate with the QLM License Server, you need to use the QLM .NET API methods that are exposed via the QLMLicenseLib.dll.
