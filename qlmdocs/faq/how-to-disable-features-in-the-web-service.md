# How to disable features in the web service

By default, the web service exposes the list of methods that are available in the web service. In fact, just typing the web service URL in the browser will display all the methods that are exposed.

You can hide this information by adding the remove Documentation section as shown below:

{% code overflow="wrap" %}
```xml
 <webServices>
      <protocols>
        <remove name="Documentation"/>
        <add name="HttpGet" />
        <add name="HttpPost" />
      </protocols>
      <soapExtensionTypes>
        <add type="QlmLicenseLib.QlmSoapHeaderExtension, QlmLicenseLib" priority="1" group="High" />
      </soapExtensionTypes>
    </webServices>
```
{% endcode %}



In addition, several web methods can be disabled from the web.config file. Here are some of the settings that control which method is enabled:

* enableCreateActivationKey
* enableUploadProducts
* enableCreateOrder
* enableGetActivationKey
* enableGetLatestVersionHttp
* enableUpgradeLicense
* enableUploadAffiliates
* enableUploadECommerceProviders

**Note that all these settings can now be configured from the QLM Management Console as described in this** [**article**](../qlm-license-server/server-properties.md)**.**
