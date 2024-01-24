# ReleaseLicenseHttp

### Description

Deactivates a license so that it can be activated on another computer.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/ReleaseLicenseHttp?is_avkey=[activationKey]&is_pcid=[computer ID]&is_vendor=[eCommerce provider]
```
{% endcode %}

### Arguments

| Argument              | Description                                                                                                                                                                                                   |
| --------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_avkey             | activation key                                                                                                                                                                                                |
| is\_deacivation\_code | deactivation code generated when deactivating offline                                                                                                                                                         |
| is\_logRelease        | flag that determines whether the release will be logged in the history table. If you are using cloud based floating licenses, you should set this argument to false to prevent bloating of the history table. |
| is\_pcid              | Unique identifier of the computer                                                                                                                                                                             |
| is\_pwd               | password defined for the selected eCommerce provider (optional)                                                                                                                                               |
| is\_user              | username defined for the selected eCommerce provider (optional)                                                                                                                                               |
| is\_vendor            | One of the supported vendors                                                                                                                                                                                  |

### Related Server Properties

* **enableReleaseKeyHttp**: Allows users to release (de-activate) a license via an http call.
* **releaseLicenseRequiresAuthentication**: By default, releasing (de-activating) a license via the ReleaseLicenseHttp method requires the user to authenticate. This property allows you to relax this requirement and invoke ReleaseLicenseHttp without authentication.
* **releaseLicenseRequiresVerificationCode**: Specify whether a deactivation verification code is required when calling ReleaseLicenseHttp. The deactivation verification code is required if you enable the Server Property options / releaseLicenseRequiresVerificationCode. The deactivation code is the MD5 hash value of the following concatenated strings: Activation Key (without dashes)|ComputerID|CommunicationEncryptionKey|Current date (yyyy-MM-dd)
