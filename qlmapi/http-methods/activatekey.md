# ActivateKey

### Description

Activates a license key with License Server.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/ActivateKey?is_avkey=[activationkey]&is_pcid=[computer identifier]&is_productid=[productID]&is_majorversion=[majorVersion]&is_minorversion=[minorVersion]&is_vendor=[vendorname]
```
{% endcode %}

### Arguments

| Argument           | Description                                                                                                              |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------ |
| is\_affiliateid    | Affiliate to associate with the key (optional)                                                                           |
| is\_avkey          | Activation Key                                                                                                           |
| is\_computer\_name | Name of the computer (optional)                                                                                          |
| is\_email          | Email address of the customer associated with this key (optional)                                                        |
| is\_majorversion   | your product's major version as defined in QLM                                                                           |
| is\_minorversion   | your product's minor version as defined in QLM                                                                           |
| is\_pcid           | Unique identifier of the computer                                                                                        |
| is\_productid      | your product id as defined in QLM                                                                                        |
| is\_pwd            | password defined for the selected eCommerce provider (optional)                                                          |
| is\_qlmversion     | 5.0.00 or earlier versions (optional)                                                                                    |
| is\_user           | username defined for the selected eCommerce provider (optional)                                                          |
| is\_userdata1      | User data to associate with the key (optional)                                                                           |
| is\_vendor         | One of the supported [vendors](https://support.soraco.co/hc/en-us/articles/360048854711-Integrated-eCommerce-Providers). |

#### Example

[https://qlm3.net/qlmdemo/qlmlicenseserver/qlmservice.asmx/ActivateKey?is\_avkey=ABCD-EFGH-IJKL\&is\_pcid=123456\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_vendor=regnow](https://qlm3.net/qlmdemo/qlmlicenseserver/qlmservice.asmx/ActivateKey?is\_avkey=ABCD-EFGH-IJKL\&is\_pcid=123456\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_vendor=regnow)
