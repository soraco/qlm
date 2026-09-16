# GetLicensesHttp

## Description

Retrieves a list of licenses from the License Server. The result set can be filtered and paginated, and returned in either XML or JSON format.

To call this function, you must set the `enableGetLicensesHttp` server property to `true`.

You should never call this function from within the application. GetLicensesHttp should be called from systems that cannot be intercepted by your client such as your website, your own server, or your back-office systems. This function **requires** user/password authentication and cannot be called without password protection. Depending on your server configuration (`getLicensesHttpRequiresStrictAuthentication`), a valid authentication token may also be required.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

Example: https://yourserver/Qlm/QlmLicenseServerNetCore/api/v1/QlmApi/GetLicensesHttp?is\_user=\[user]\&is\_pwd=\[password]\&is\_vendor=\[vendor]\&is\_format=\[xml|json]

### Parameters

| Argument           | Description                                                                                                                                                                                   |
| ------------------ | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_user           | username defined in Manage Keys / 3rd Party Extensions. Required for authentication.                                                                                                          |
| is\_pwd            | password defined in Manage Keys / 3rd Party Extensions. Required for authentication.                                                                                                          |
| is\_vendor         | one of the supported vendors. If omitted, the default commerce provider configured on the server is used.                                                                                     |
| is\_format         | the format of the response. Can be one of: `xml` \| `json`. If not specified, the server default format is used. Example: \&is\_format=json                                                   |
| is\_filter         | a filter expression used to restrict the licenses returned. The filter is applied against the `qryLicenseInfo` view. Example: \&is\_filter=ProductID=1                                        |
| is\_batchsize      | the maximum number of records to return in a single request. Works together with `is_offset` to paginate results. When omitted, no batch limit is applied (-1). Example: \&is\_batchsize=100  |
| is\_offset         | the zero-based record offset from which to start returning results. Works together with `is_batchsize` to paginate results. Defaults to 0. Example: \&is\_offset=200                          |
| is\_writetocontext | when set to `true`, the response is written directly to the HTTP response stream. When set to `false` or omitted, the response is returned to the caller. Example: \&is\_writetocontext=false |

### Response

On success, the method returns the list of licenses in the requested format (`xml` or `json`).

On failure, the method returns an error response in the requested format:

* XML errors are returned with content type `text/xml`.
* JSON errors are returned with content type `application/json`.

### Remarks

The `enableGetLicensesHttp` server property must be set to `true`, otherwise the request is rejected.&#x20;

The request must be authenticated with a valid `is_user` / `is_pwd`. Calling this method without password protection results in an authentication error.&#x20;

If [strict authentication](../../how-to/how-to-invoke-a-qlm-http-method-that-requires-strict-authentication.md) is enforced for `GetLicensesHttp`, a valid authentication token must also be supplied.&#x20;

Use `is_batchsize` and `is_offset` together to page through large result sets.
