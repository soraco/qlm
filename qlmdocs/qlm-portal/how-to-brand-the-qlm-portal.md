# How to brand the QLM Portal

You can brand the QLM Portal by modifying the title of the portal as well as the logo.

In QLM v12 and higher, you can brand the logo and title of the QLM Portal from the [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties).

In earlier versions of QLM, you need to update the Portal's web.config file.

To do so, edit the web.config file located in the QLM Portal folder and locate the following settings:

```xml
<add key="loginLogo" value="qlmportal.png" />
<add key="loginTitle" value="QLM PORTAL" />
<add key="logo" value="qlmportal.png" />
<add key="title" value="QLM PORTAL" />
```

The first pair of settings control the logo and title that are displayed on the logon page.

The second pair of settings control the logo and title that are displayed after the user logs on.

To modify the title simply change the text in the web.config file.

To modify the logo, upload your image to the QLMPortal folder and update the web.config file to reference your image.

The logo size should be <= 50x64 px and have a transparent background.
