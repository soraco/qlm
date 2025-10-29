# HTTP Methods

The HTTP Methods are methods that can be invoked via a URL.

Most of the HTTP methods are designed to be invoked from cross-platform apps (Java, Objective-C, Javascript, Qt, etc.) or 3rd party processes such as your eCommerce provider during the purchasing process.

There are several options you can use to restrict access to HTTP methods:

* Each HTTP method can be disabled by setting a server property (see the \*\*security \*\*section of server properties)
* You can require a [user/password ](../../how-to/how-to-define-the-user-password-associated-to-an-ecommerce-provider.md)to call an HTTP method.
* You can restrict access to some HTTP methods by IP address (v16.1+) by configuring the server properties httpAdminMethods and httpAdminMethodsAllowedIPAddresses.
* You can enforce [QLM strict authentication](../../how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication.md) for some HTTP methods by configuring the server property **strictAuthenticationHttpMethods**. By default, strict authentication is enabled for [RetrieveActivationKeyHttp](retrieveactivationkeyhttp.md).

The HTTP methods are not quite as extensive as the .NET API but cover essential functionality such as:

* Validating a license ([ValidateLicenseHttp](validatelicensehttp.md))
* Activating a license ([ValidateLicenseHttp](validatelicensehttp.md))
* Checking if a license was revoked ([ValidateLicenseHttp](validatelicensehttp.md))
* Deactivating a license ([ReleaseLicenseHttp](releaselicensehttp.md))
* Renewing a subscription ([RenewSubscriptionHttp](renewsubscriptionhttp.md)).
* Renewing a maintenance plan ([RenewMaintenancePlan](renewmaintenanceplan.md))
* Publishing Analytics ([AnalyticsAddInstallHttp](analyticsaddinstallhttp.md), AnalyticsRemoveInstallHttp, [AnalyticsUpdateInstallHttp](analyticsupdateinstallhttp.md), [AnalyticsUpdateLastAccessedDateHttp](analyticsupdatelastaccesseddatehttp.md))
* Getting the latest version ([GetLatestVersionHttp](getlatestversionhttp.md))
* etc.

Note that all other methods exposed by the QLM License Server cannot be called directly via SOAP. In order to communicate with the QLM License Server, you need to use the QLM .NET API methods that are exposed via the QLMLicenseLib.dll.
