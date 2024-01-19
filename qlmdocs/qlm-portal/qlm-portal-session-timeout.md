# QLM Portal session timeout

By default, a user's session in the QLM Portal will expire after 20 minutes of inactivity.

You can modify the session timeout by adding the following setting in the web.config file of the QLM Portal. The setting should be located within the \<system.web> section.

```xml
<system.web>
<!-- Set the session timeout to 60 minutes -->
<sessionState timeout="60" />
```

