# UpdateLicenseHttp

### Description

Updates an existing license by modifying one or more of the following attributes:

* Features associated with a license
* The expiry date of the license
* Duration of the license
* Major and Minor versions of the product
* Product Properties
* Quantity
* UserData
* Affiliate ID
* Revocation state
* Max Release Count and Max Release Period

To call this function, you must set the enableUpgradeLicense server property to true.

Unlike the UpgradeLicense method which generates a new Activation Key, UpdateLicense simply updates an existing license without generating a new Activation Key.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateLicenseHttp?is_avkey=<activationKey>&is_productid=<productID>&is_majorversion=<majorVersion>&is_minorversion=<minorVersion>&is_vendor=<ecommerce-provider>&is_features=<features>&is_expduration=<duration>&is_expdate=<date>&is_pp=<product_properties>&is_userdata1=abc
```
{% endcode %}

### Arguments

| Parameter            | Description                                                                                                                                                                                                       |
| -------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_affiliateid      | ID of the affiliate to set                                                                                                                                                                                        |
| is\_avkey            | the current activation key                                                                                                                                                                                        |
| is\_expdate          | date at which the license will expire                                                                                                                                                                             |
| is\_expduration      | expiry duration of the license key                                                                                                                                                                                |
| is\_features         | semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled. |
| is\_licensemodel     | trial \| subscription \| permanent                                                                                                                                                                                |
| is\_productid        | ID of the product                                                                                                                                                                                                 |
| is\_majorversion     | new major version of the product                                                                                                                                                                                  |
| is\_maxreleasecount  | value of the Max Release Count property                                                                                                                                                                           |
| is\_maxreleaseperiod | value of the Max Release Period In Days property                                                                                                                                                                  |
| is\_minorversion     | new minor version of the product                                                                                                                                                                                  |
| is\_pp               | product properties to set                                                                                                                                                                                         |
| is\_pwd              | password as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers)                                                           |
| is\_quantity         | number of activations                                                                                                                                                                                             |
| is\_qlmversion       | QLM engine version                                                                                                                                                                                                |
| is\_revoke           | flag to revoke a license                                                                                                                                                                                          |
| is\_user             | username as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers)                                                           |
| is\_vendor           | One of the supported vendors                                                                                                                                                                                      |

### Remarks

The syntax for setting a product property is:

{% code overflow="wrap" %}
```xml
&is_pp=<category>.<name>::value::expiryDate||<category>.<name>::value::expiryDate||...
```
{% endcode %}

### Example

\[block:html] { "html": "https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/UpdateLicenseHttp?is\_vendor=fastspring\&is\_productid=2\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=23\&is\_features=0:7\&is\_pp=quality.module\_qa::abc::2017-12-31||quality.module\_control::true||quality.module\_validation::76" } \[/block]

The expiry date is optional and available for QLM Enterprise customers. The expected expiry date format is: "yyyy-MM-dd HH:mm:ss".

In addition, for product properties of type integer, you can increment or decrement an existing value by prefixing the value with the + or - sign.

For example, in the URL below, the quality.module\_validation will be decremented by 2.

\[block:html] { "html": "https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/UpdateLicenseHttp?is\_vendor=fastspring\&is\_productid=2\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=23\&is\_features=0:7\&is\_pp=quality.module\_validation::-2" } \[/block]

Note that due to URL encoding rules, the + sign should be replaced by %2B. For example, in the URL below, the quality.module\_validation will be incremented by 2.

\[block:html] { "html": "https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/UpdateLicenseHttp?is\_vendor=fastspring\&is\_productid=2\&is\_majorversion=1\&is\_minorversion=0\&is\_expduration=23\&is\_features=0:7\&is\_pp=quality.module\_validation::%2B2" } \[/block]
