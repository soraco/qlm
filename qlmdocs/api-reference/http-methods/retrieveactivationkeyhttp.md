# RetrieveActivationKeyHttp

### Description

Retrieves an activation key given an Order ID or User Data.

To call this function, you must set the enableRetrieveActivationKeyHttp server property to true.

RetrieveActivationKeyHttp requires QLM's [strict authentication ](https://docs.soraco.co/docs/how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication#h\_01he1frdn4av3gjgxjtrr3e8qk)and should only be used when the communication with the server is over https.

Additionally, for security reasons, you should not call this API from within your application. It should only be called from a system that the end-user does not have access to, such as your server.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/RetrieveActivationKeyHttp?is_vendor=[vendor]>&is_userdata1=[userData]&is_orderid=[orderID]&is_user=[user]&is_pwd=[pwd]&is_format=[json|xml]
```
{% endcode %}

### Arguments

| Argument      | Description                                                                                                                                             |
| ------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_format    | specify the format of the returned data. The possible options are: json or xml.                                                                         |
| is\_orderID   | Order ID associated with the license and used to retrieve the Activation Key                                                                            |
| is\_pwd       | password as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_user      | username as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_userdata1 | User Data associated with the license and used to retrieve the Activation Key                                                                           |
| is\_vendor    | one of the supported vendors                                                                                                                            |

### Remarks

To retrieve an activation key, you must specify an order ID, a UserData value or both. If both are specified, both conditions must be met.
