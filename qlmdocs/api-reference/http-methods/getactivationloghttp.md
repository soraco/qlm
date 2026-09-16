# GetActivationLogHttp

## Description

Retrieves a list of activated licenses from the License Server. The result set can be filtered and paginated, and returned in either XML or JSON format.

To call this function, you must set the `enableGetLicensesHttp` server property to `true`.



To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

Example: https://yourserver/Qlm/QlmLicenseServerNetCore/api/v1/QlmApi/GetActivationLogHttp?is\_avkey=ABCD-DEFG-HIJK-LMNOP\&is\_user=\[user]\&is\_pwd=\[password]\&is\_vendor=\[vendor]\&is\_format=\[xml|json]

### Parameters

| Argument           | Description                                                                                                                                                                                   |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_avkey          | the activation key - this argument is required.                                                                                                                                               |
| is\_user           | username defined in Manage Keys / 3rd Party Extensions. Required for authentication.                                                                                                          |
| is\_pwd            | password defined in Manage Keys / 3rd Party Extensions. Required for authentication.                                                                                                          |
| is\_vendor         | one of the supported vendors. If omitted, the default commerce provider configured on the server is used.                                                                                     |
| is\_format         | the format of the response. Can be one of: `xml` \| `json`. If not specified, the server default format is used. Example: \&is\_format=json                                                   |
| is\_writetocontext | when set to `true`, the response is written directly to the HTTP response stream. When set to `false` or omitted, the response is returned to the caller. Example: \&is\_writetocontext=false |

### Response

On success, the method returns the list of activations in the requested format (`xml` or `json`).

On failure, the method returns an error response in the requested format:

* XML errors are returned with content type `text/xml`.
* JSON errors are returned with content type `application/json`.

### Remarks

The `enableGetActivationLogHttp` server property must be set to `true`, otherwise the request is rejected.&#x20;

If [strict authentication ](../../how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication.md)is enforced for `GetActivationLogHttp`, a valid authentication token must also be supplied.&#x20;
