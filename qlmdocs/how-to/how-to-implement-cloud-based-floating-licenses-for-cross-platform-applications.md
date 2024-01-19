# How to implement cloud-based floating licenses for cross-platform applications

### Overview

If you are developing a cross-platform application and are using the QLM REST API to protect your non-Windows application, you can implement a cloud-based floating license mechanism by following the approach outlined in this article.

&#x20;

### First-run workflow&#x20;

When your application is launched for the first time from a system, follow the same approach as you would do for a normal node-locked license. Prompt the user for an Activation Key and use the [ValidateLicenseHttp ](../api-reference/http-methods/validatelicensehttp.md)API to activate the license. If the activation is successful, a digitally signed license file is returned and stored on the end-user system (you must store the file).&#x20;

Additionally, you must store the Activation Key so that you can retrieve it later.&#x20;

When your application exits, you must do the following:

* Call [Releaselicensehttp](../api-reference/http-methods/releaselicensehttp.md) to deactivate the license from the server.
* Delete the license file stored in the previous step.

### Subsequent runs

When your application is subsequently launched on the same system, you must do the following:

* Retrieve the Activation Key stored in the previous step.
* Call [ValidateLicenseHttp ](../api-reference/http-methods/validatelicensehttp.md)API to activate the license with the Activation Key retrieved in the previous step. There should be no need to prompt the user.
