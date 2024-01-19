# AnalyticsUpdateLastAccessedDateHttp

### Description

Updates the Last Accessed Date associated with a registered installation on the server.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/AnalyticsUpdateLastAccessedDateHttp?is_installid=[Install ID]
```
{% endcode %}

### Arguments

| Parameter     | Description                                                            |
| ------------- | ---------------------------------------------------------------------- |
| is\_installid | ID of the installation returned by the call to AnalyticsAddInstallHttp |
