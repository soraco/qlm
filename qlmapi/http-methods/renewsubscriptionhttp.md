# RenewSubscriptionHttp

### Description

Renews a subscription. When a subscription is renewed, each activated license is automatically reactivated on the server and a new computer bound key is generated with a new expiry date. When customers reactivate their license, they receive the new computer bound key with the new expiry date, thus extending their subscription period.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/RenewSubscriptionHttp?is_avkey=[activationKey]&is_vendor=[vendor name]&is_expdate=[date]&is_user=[user]&is_pwd=[pwd]
```
{% endcode %}

### Arguments

| Argument        | Description                                                                                                                                                                                                   |
| --------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_avkey       | activation key                                                                                                                                                                                                |
| is\_expdate     | date at which the license will expire. You must specify either is\_expdate or is\_expduration                                                                                                                 |
| is\_expduration | duration in days after which the license will expire. You must specify either is\_expdate or is\_expduration                                                                                                  |
| is\_logRelease  | flag that determines whether the release will be logged in the history table. If you are using cloud based floating licenses, you should set this argument to false to prevent bloating of the history table. |
| is\_pp          | Product Properties to set                                                                                                                                                                                     |
| is\_pwd         | password defined for the selected eCommerce provider (optional)                                                                                                                                               |
| is\_user        | username defined for the selected eCommerce provider (optional)                                                                                                                                               |
| is\_vendor      | One of the supported vendors                                                                                                                                                                                  |

### Remarks

The syntax for setting a product property is:

```
&is_pp=<category>.<name>::value::expiryDate||<category>.<name>::value::expiryDate
```

Example:

[https://quicklicensemanager.com/qlmdemo/QlmLicenseServer/qlmservice.asmx/RenewSubscriptionHttp?is\_vendor=fastspring\&is\_expduration=23\&is\_pp=quality.module\_qa::2017-12-31||quality.module\_control::true](https://quicklicensemanager.com/qlmdemo/QlmLicenseServer/qlmservice.asmx/RenewSubscriptionHttp?is\_vendor=fastspring\&is\_expduration=23\&is\_pp=quality.module\_qa::abc::2017-12-31||quality.module\_control::true)
