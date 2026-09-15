# GetLicensesHttp

## Description

{% code overflow="wrap" %}
```
Retrieves the list of licenses from the License Server. The result set can be filtered and paginated, and returned in either XML or JSON format.

To call this function, you must set the `enableGetLicensesHttp` server property to `true`.

You should never call this function from within the application. GetLicensesHttp should be called from systems that cannot be intercepted by your client such as your website, your own server, or your back-office systems. This function **requires** user/password authentication and cannot be called without password protection. Depending on your server configuration (`getLicensesHttpRequiresStrictAuthentication`), a valid authentication token may also be required.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

Example: https://yourserver/Qlm/QlmLicenseServerNetCore/api/v1/QlmApi/GetLicensesHttp?is_user=[user]&is_pwd=[password]&is_vendor=[vendor]&is_format=[xml|json]

```
{% endcode %}

### Parameters

<table><thead><tr><th>Argument</th><th>Description</th></tr></thead><tbody><tr><td>is_user</td><td><p></p><pre data-overflow="wrap"><code>username defined in Manage Keys / 3rd Party Extensions. Required for authentication.
</code></pre></td></tr><tr><td>is_pwd</td><td><p></p><pre data-overflow="wrap"><code>password defined in Manage Keys / 3rd Party Extensions. Required for authentication. 
</code></pre></td></tr><tr><td>is_vendor</td><td><p></p><pre data-overflow="wrap"><code>one of the supported vendors. If omitted, the default commerce provider configured on the server is used. 
</code></pre></td></tr><tr><td>is_format</td><td><p></p><pre data-overflow="wrap"><code>the format of the response. Can be one of: `xml` \| `json`. If not specified, the server default format is used. Example: \&#x26;is\_format=json     
</code></pre></td></tr><tr><td>is_filter</td><td><p></p><pre data-overflow="wrap"><code> a filter expression used to restrict the licenses returned. The filter is applied against the `qryLicenseInfo` view. Example: \&#x26;is\_filter=ProductID=1      
</code></pre></td></tr><tr><td>is_batchsize</td><td><p></p><pre data-overflow="wrap"><code>the maximum number of records to return in a single request. Works together with `is_offset` to paginate results. When omitted, no batch limit is applied (-1). Example: \&#x26;is\_batchsize=100    
</code></pre></td></tr><tr><td>is_offset</td><td><p></p><pre data-overflow="wrap"><code>the zero-based record offset from which to start returning results. Works together with `is_batchsize` to paginate results. Defaults to 0. Example: \&#x26;is\_offset=200   
</code></pre></td></tr><tr><td>is_writetocontext</td><td><p></p><pre data-overflow="wrap"><code>hen set to `true`, the response is written directly to the HTTP response stream. When set to `false` or omitted, the response is returned to the caller. Example: \&#x26;is\_writetocontext=false            
</code></pre></td></tr></tbody></table>

### Response

{% code overflow="wrap" %}
```
On success, the method returns the list of licenses in the requested format (`xml` or `json`).

On failure, the method returns an error response in the requested format:

- XML errors are returned with content type `text/xml`.
- JSON errors are returned with content type `application/json`.
```
{% endcode %}

### Remarks

{% code overflow="wrap" %}
```
The `enableGetLicensesHttp` server property must be set to `true`, otherwise the request is rejected.
The request must be authenticated with a valid `is_user` / `is_pwd`. Calling this method without password protection results in an authentication error.
If `getLicensesHttpRequiresStrictAuthentication` is enabled (or strict authentication is enforced for `GetLicensesHttp`), a valid authentication token must also be supplied.
Use `is_batchsize` and `is_offset` together to page through large result sets.
```
{% endcode %}
