# HTTP API examples

### Overview

This article provides some typical examples of how to use the QLM HTTP API to:

* Create license keys
* Check if a license key exists
* Renew the subscription of a license key

When using the QLM HTTP API, you must secure your calls with basic authentication (user/password). This is done by configuring an extension in the QLM Management Console / Manage Keys / 3rd Party extensions. If you're not using the HTTP API in the context of a specific e-commerce provider, we recommend using the QlmAuthenticationProvider extension.

For additional security, you can enable [QLM Strict Authentication ](https://docs.soraco.co/docs/how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication)for each method as needed.

<figure><img src="../.gitbook/assets/image (29).png" alt=""><figcaption></figcaption></figure>

### Examples

#### Create a license key

To create a license key,  you must use the [GetActivationKeyWithExpiryDate ](../api-reference/http-methods/getactivationkeywithexpirydate.md)method.

Example:

{% code overflow="wrap" %}
```http
http://localhost/QlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is_productid=1&is_majorversion=1&is_minorversion=0&is_vendor=QlmAuthenticationProvider&is_expduration=10&is_user=qlmdemo&is_pwd=xxx&orderNumber=1234&subscriptionid=5678&is_licensemodel=subscription
```
{% endcode %}

#### Check if a license exists, given  an order ID

To create a license key,  you must use the [ ](../api-reference/http-methods/getactivationkeywithexpirydate.md)[RetrieveActivationKeyHttp](../api-reference/http-methods/retrieveactivationkeyhttp.md) method.

Example:

{% code overflow="wrap" %}
```http
http://localhost/QlmLicenseServer/qlmservice.asmx/RetrieveActivationKeyHttp?&is_vendor=QlmAuthenticationProvider&is_user=qlmdemo&is_pwd=xxx&is_orderid=1234
```
{% endcode %}

#### Renew a subscription

To renew the subscription of a license key,  you must use the [ ](../api-reference/http-methods/getactivationkeywithexpirydate.md)[RenewSubscriptionHttp](../api-reference/http-methods/renewsubscriptionhttp.md) method.

Example:

{% code overflow="wrap" %}
```http
http://localhost/QlmLicenseServer/qlmservice.asmx/RenewSubscriptionHttp?is_vendor=QlmAuthenticationProvider&is_user=qlmdemo&is_pwd=xxx&subscriptionid=5678
```
{% endcode %}
