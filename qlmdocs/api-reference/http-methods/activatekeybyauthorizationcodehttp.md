# ActivateKeyByAuthorizationCodeHttp

### Description

Activates a license key over HTTP using an authorization code instead of an Activation Key.

When you call ActivateKeyByAuthorizationCodeHttp, you must provide the authorization code and the computer identifier (is\_pcid). The server does the following:

* Validates the license
* Verifies if the license has not been previously activated
* Activates the license
* Returns the computer key and the set of features that are enabled.

On subsequent calls to ActivateKeyByAuthorizationCodeHttp, in addition to the previous arguments, you should set the computer key argument using the value returned from the first call. In this instance, the server does the following:

* Validates the license
* Verifies if the license has not been revoked
* Returns the status of the license and the set of features that are enabled.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/ActivateKeyByAuthorizationCodeHttp?is_authcode=[authorization code]&is_pckey=[computer key]&is_pcid=[computer ID]&is_computer_name=[computer name]&is_qlmversion=[QLM Engine version]&is_email=[email of the customer associated to the key]&is_userdata1=[user data to associate to the key]&is_affiliateid=[affiliate to associate to the key]
```
{% endcode %}

### Arguments

| Argument           | Description                                                                                                                                                                                                                                               |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_authcode       | Authorization Code genered by calling [RequestAuthorizationCodeForActivationHttp](requestauthorizationcodeforactivationhttp.md)                                                                                                                           |
| is\_majorversion   | The major version of the product being activated                                                                                                                                                                                                          |
| is\_minorversion   | The minor version of the product being activated                                                                                                                                                                                                          |
| is\_pckey          | If the key has been previously activated, the ValidateLicense method returns a computer key. This computer key should then be used in subsequent calls to ValidateLicense in the is\_pckey argument                                                       |
| is\_pcid           | If the license has never been validated, you need to specify a computer identifier so that the returned computer key can be bound to this specific computer. A computer ID can be the name of the computer or any other unique identifier of your choice. |
| is\_productid      | The ID of the product being activated                                                                                                                                                                                                                     |
| is\_computer\_name | Name of the computer (optional). This argument is not required. It is used to easily identify a computer, in case the computer ID is a serial number such as the hard disk serial number.                                                                 |
| is\_qlmversion     | 5.0.00 or earlier versions (optional)                                                                                                                                                                                                                     |
| is\_email          | Email address of the customer associated with this key (optional)                                                                                                                                                                                         |
| is\_userdata1      | User data to associate with the key (optional)                                                                                                                                                                                                            |
| is\_affiliateid    | Affiliate to associate with the key (optional)                                                                                                                                                                                                            |
