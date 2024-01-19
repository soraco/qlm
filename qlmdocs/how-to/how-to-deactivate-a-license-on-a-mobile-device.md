# How to deactivate a license on a mobile device

To deactivate (release) a license on a mobile device (Android, iOS, Java), you need to perform the following two actions:

1. Delete the license locally
2. Release the license from the server

To delete the license locally, simply delete the license XML (QlmLicense.xml) file that was generated as part of the activation process.

To release the file on the server, call the [ReleaseLicenseHttp ](../api-reference/http-methods/releaselicensehttp.md)method.

**ReleaseLicenseHttp**

Releases a license key over HTTP. This API releases a license key so that it can be activated on another computer.

To invoke this method via a URL:

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/ReleaseLicenseHttp?is_avkey=<activationKey>&is_pcid=<computer ID>
where
```
{% endcode %}

* is\_avkey= Activation key to validate. If the key has never been activated, the key will be activated and a computer key will be returned.
* is\_pcid = If the license has never been validated, you need to specify a computer identifier so that the returned computer key can be bound to this specific computer. A computer ID can be the name of the computer or any other unique identifier of your choice.
