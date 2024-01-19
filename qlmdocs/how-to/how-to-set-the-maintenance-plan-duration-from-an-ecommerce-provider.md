# How to set the maintenance plan duration from an ecommerce provider

When integrated with an eCommerce provider, you typically would use the HTTP methods GetActivationKey or GetActivationKeyWithExpiryDate to generate an Activation Key.

If you would like to enable the maintenance plan when a purchase is made, add the is\_maintenance\_plan argument.

Example:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is_productid=1&is_majorversion=1&is_minorversion=0&is_vendor=fastspring&is_maintenance_plan=1
```
{% endcode %}



The example above will enable the maintenance plan with a default duration of 1 year. The default can be changed from the QLM Management Console / Manage Keys / Sites / Server Properties / maintenancePlanPeriodInDays.

&#x20;You can also specify the duration of the maintenance plan as an argument to the URL with the is\_maintduration argument.

Example:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is_productid=1&is_majorversion=1&is_minorversion=0&is_vendor=fastspring&is_maintenance_plan=1&is_maintduration=60
```
{% endcode %}

The example above will enable the maintenance plan with a duration of 60 days.

If you are using Paypal, you can add the same arguments to the custom or item\_number IPN variables.

Example:

**item\_number** or **custom**: \&is\_productid=x\&is\_majorversion=y\&is\_minorversion=z\&is\_features=0:1;1:3\&is\_maintenance\_plan=1\&is\_maintduration=60
