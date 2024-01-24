# RequestAuthorizationCodeForActivationHttp

### Description

Initiates the process of activating a license by authorization code.

If the server identifies a license key that corresponds to the user, an Authorization Code is generated and sent to the customer by email or SMS. The client application must then call [ActivateKeyByAuthorizationCodeHttp](doc:activatekeybyauthorizationcodehttp)

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/RequestAuthorizationCodeForActivationHttp?is_email=[email address]&is_pcid=[computer ID]&is_productid=[product id]&is_majorversion=[major version]&is_minorverson=[minor version]
```
{% endcode %}

### Arguments

| Argument         | Description                                                                                                                                                                                                                                               |
| ---------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_email        | email address of the customer associated to the license key.                                                                                                                                                                                              |
| is\_majorversion | the major version of the product                                                                                                                                                                                                                          |
| is\_minorversion | the minor version of the product                                                                                                                                                                                                                          |
| is\_pcid         | if the license has never been validated, you need to specify a computer identifier so that the returned computer key can be bound to this specific computer. A computer ID can be the name of the computer or any other unique identifier of your choice. |
| is\_productid    | ID of the product                                                                                                                                                                                                                                         |
| is\_pp           | Product Properties to set                                                                                                                                                                                                                                 |
