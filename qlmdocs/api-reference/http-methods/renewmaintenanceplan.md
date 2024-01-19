# RenewMaintenancePlan

### Description

Renews a maintenance plan for a given activation key. By default, the maintenance plan is renewed with the period specified in the QLM Management Console / Manage Keys / Sites / Server Properties / maintenancePlanPeriodInDays.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/RenewMaintenancePlan?is_avkey=[activationKey]&is_vendor=[eCommerce provider]&is_productid=[product id]
```
{% endcode %}

### Required Arguments

| Argument   | Description                  |
| ---------- | ---------------------------- |
| is\_avkey  | activation key               |
| is\_vendor | One of the supported vendors |

### Optional Arguments

| Argument          | Description                                                     |
| ----------------- | --------------------------------------------------------------- |
| is\_maintdate     | maintenance plan expiry date to set (optional)                  |
| is\_maintduration | duration in days of the maintenance plan (optional)             |
| is\_majorversion  | your product's major version as defined in QLM                  |
| is\_minorversion  | your product's minor version as defined in QLM                  |
| is\_productid     | your product id as defined in QLM                               |
| is\_pwd           | password defined for the selected eCommerce provider (optional) |
| is\_user          | username defined for the selected eCommerce provider (optional) |
