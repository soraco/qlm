# UpgradeLicense

### Description

Upgrades a license by issuing a new license key and replacing the old one. You can upgrade the following data associated to a license:

* Features associated with a license
* The expiry date of the license
* Duration of the license
* Major and Minor version of the product

To call this function, you must set the enableUpgradeLicense server property to true.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpgradeLicense?is_avkey=<activationKey>&is_productid=<productID>&is_majorversion=<majorVersion>&is_minorversion=<minorVersion>&is_vendor=digibuy&is_features=<features>&is_expduration=<duration>&is_expdate=<date>
```

### Arguments

| Parameter        | Description                                                                                                                                                                                                       |
| ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_avkey        | the current activation key                                                                                                                                                                                        |
| is\_expdate      | date at which the license will expire                                                                                                                                                                             |
| is\_expduration  | expiry duration of the license key                                                                                                                                                                                |
| is\_features     | semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled. |
| is\_productid    | ID of the product                                                                                                                                                                                                 |
| is\_majorversion | new major version of the product                                                                                                                                                                                  |
| is\_minorversion | new minor version of the product                                                                                                                                                                                  |
| is\_pwd          | password as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers)                                                           |
| is\_qlmversion   | QLM engine version                                                                                                                                                                                                |
| is\_user         | username as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers)                                                           |
| is\_vendor       | One of the supported vendors                                                                                                                                                                                      |
