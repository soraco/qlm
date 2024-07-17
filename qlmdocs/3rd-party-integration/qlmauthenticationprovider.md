# QlmAuthenticationProvider

### Overview

The QlmAuthenticationProvider is a general Authentication Provider that is not associated with any specific vendor.&#x20;

It can be used in the context of HTTP methods to authenticate and validate the integrity of requests.

### Configuration

You can customize the settings of the QlmAuthenticationProvider from the QLM Management Console / Manager Keys / 3rd Party Extensions / QlmAuthenticationProvider.

You should configure the user and password required to invoke HTTP methods.

You can also configure an API Key to enable [QLM Strict Authentication](../how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication.md).

<figure><img src="../.gitbook/assets/image (32).png" alt=""><figcaption></figcaption></figure>

### Responses

When invoking an HTTP method using the QlmAuthenticationProvider, responses are formatted as XML fragments.

Example:

Request:

{% code overflow="wrap" %}
```url
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is_productid=1&is_majorversion=1&is_minorversion=0&is_vendor=QlmAuthenticationProvider&is_expduration=10&orderNumber=1234&subscriptionid=5678&is_licensemodel=subscription
```
{% endcode %}

Response:

<figure><img src="../.gitbook/assets/image (33).png" alt=""><figcaption></figcaption></figure>
