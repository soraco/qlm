# Cloud-based floating licenses - Check-out for offline usage

Edition: QLM Pro

Version: 16.0.22281.2

***

When using cloud-based floating licenses, a user can check out a license for offline usage for a period of time. To check out a license for offline usage, a client must be online.

When a license is checked-out for offline usage, the client must specify the duration of the offline usage. Based on the specified duration, an Offline Expiry Date (OED) is calculated and associated with the license on the server side.

Attempts to deactivate the license on the server before the expiry of the OED will be rejected.

When the OED is reached, the client will attempt to reach the server and go back online. If the client is able to reach the server, it will revert to online mode and will verify if its license is still registered on the server. If the license is no longer registered on the server and no more licenses are available, the QLM API will fire a violation event. The application can then take the required action to gracefully shut down the application. If the license is still registered on the server, the client resumes successfully.

If the client is not able to reach the server, the QLM API will fire a violation event that the application can intercept. The application can then take the required action to gracefully shut down the application.

Any date tampering on the client side is automatically detected and a violation event is fired.

If a customer goes offline without checking out a license, the license remains checked out until the client goes back online and checks the license back in. This situation may lead to abuse whereby an Administrator could deactivate the license while the customer is offline. To prevent against this abuse, you may elect to always set an Offline Expiry Date when checking out a license.

Additionally, when a customer is online, the QLM timer contacts the server at regular intervals to ensure that the license is still activated. If the license is no longer activated on the server, an attempt is made to reactivate the license. If the attempt fails, a violation event is fired.

Additional References:

[How to implement cloud-based floating licenses](../how-to/how-to-implement-cloud-based-floating-licenses.md)

[IQlmCloudFloatingLicenseHelper](../api-reference/iqlmcloudfloatinglicensehelper/)
