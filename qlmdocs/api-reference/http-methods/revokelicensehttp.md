# RevokeLicenseHttp

### Description

Revokes a license key on the License Server. This API revokes a license key so that it can no longer be activated.

To call this function, you must set the enableRevokeLicense server property to true.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/RevokeLicenseHttp?is_avkey=<activationKey>&is_vendor=<eCommerce provider>
```
{% endcode %}

### Arguments

| Argument   | Description                                                                                                                                             |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_avkey  | activation key to revoke                                                                                                                                |
| is\_pwd    | password as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_user   | username as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_vendor | one of the supported vendors                                                                                                                            |
