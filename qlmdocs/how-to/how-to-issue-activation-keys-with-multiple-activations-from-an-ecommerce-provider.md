# How to issue activation keys with multiple activations from an eCommerce provider

When a customer purchases a license of your application via your eCommerce provider you typically use GetActivationKey or GetActivationKeyWithExpiryDate to issue a license.

By default, the number of activations allowed is equal to the quantity ordered. So if a customer purchases 3 licenses of your application, they will receive a single Activation Key that can be activated on 3 computers.

In some cases, you may want to allow the user to activate each purchased copy on more than a single computer.  You can do so by adding the following arguments to the GetActivationKey URL:

```
&is_usemultipleactivationskey=false&is_numberofactivationsperkey=2
```

So the full URL would look like:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is_productid=1&is_majorversion=1&is_minorversion=0&is_usemultipleactivationskey=false&is_numberofactivationsperkey=2&is_vendor=fastspring
```
{% endcode %}

In the example above, if a customer purchases 3 licenses, they will receive 3 activation keys and each activation key can be activated on 2 systems.

To send the customer a single activation key that can be activated on 6 systems, use:

```
&is_numberofactivationsperkey=2
```

Note that this functionality is available as of QLM 7.2.14324.5.&#x20;

To add a fixed number of activations to an order, use the is\_additionalactivations argument.&#x20;

```
&is_additionalactivations=3
```

Example:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is_productid=1&is_majorversion=1&is_minorversion=0&is_additionalactivations=2&is_vendor=fastspring
```
{% endcode %}

Note that if you are using WooCommerce, is\_additionalactivations, and is\_numberofactivationsperkey must be configured as **Custom Fields** in your product definition.
