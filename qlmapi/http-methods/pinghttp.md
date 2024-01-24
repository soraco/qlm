# PingHttp

### Description

Pings the server and returns version and date information.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/PingHttp
```

### Return

{% code overflow="wrap" %}
```xml
<?xml version="1.0" encoding="UTF-8"?>
<QuickLicenseManager>
<result>Successfully connected to License Server at 2015-08-05T15:53:16Z UTC. QLM Version: 8.1.16047.1</result>
<serverDate>2015-08-05T15:53:16Z</serverDate>
<serverVersion>8.1.16047.1</serverVersion>
<serverDate date = "2015-08-05T15:53:16Z" />  <!-- this is obsolete but is returned for backward compatibility -->
</QuickLicenseManager>
```
{% endcode %}
