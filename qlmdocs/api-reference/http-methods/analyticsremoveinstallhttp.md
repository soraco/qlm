# AnalyticsRemoveInstallHttp

### Description

Unregisters an application with the server. You should call this function when the user uninstalls your application.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/AnalyticsRemoveInstallHttp?is_installid=[InstallID]
```

### Arguments

| Parameter     | Description                                                            |
| ------------- | ---------------------------------------------------------------------- |
| is\_installid | ID of the installation returned by the call to AnalyticsAddInstallHttp |
