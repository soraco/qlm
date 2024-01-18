# How to configure the QLM License Server to handle large requests

When using the QLM built-in backup and restore functionality, the data sent to the server could be quite large.

If you see errors such as "Request Entity Too Large", you will need to update the QLM License Server's web.config file to enable larger loads.

1\. requestLimits setting

```
<system.webserver>
   <security>
     <requestFiltering>
        <requestLimits maxAllowedContentLength="334217728" />
     </requestFiltering>
   </security>
</system.webserver>
```

2\. maxRequestLength setting

```
<system.web>
<httpRuntime maxRequestLength="2097151" executionTimeout="1800" />
</system.web>
```
