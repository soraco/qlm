# How to disable features in the web service

By default, the web service exposes the list of methods that are available in the web service. In fact, just typing the web service URL in the browser will display all the methods that are exposed.

You can hide this information by adding the remove Documentation section as shown below:

&#x20;\<webServices>

&#x20;     \<protocols>

&#x20;       \<remove name="Documentation"/>

&#x20;       \<add name="HttpGet" />

&#x20;       \<add name="HttpPost" />

&#x20;     \</protocols>

&#x20;     \<soapExtensionTypes>

&#x20;       \<add type="QlmLicenseLib.QlmSoapHeaderExtension, QlmLicenseLib" priority="1" group="High" />

&#x20;     \</soapExtensionTypes>

&#x20;   \</webServices>

In addition, there are several web methods that can be disabled from the web.config file. Here are some of the settings that control which method is enabled:

* enableCreateActivationKey
* enableUploadProducts
* enableCreateOrder
* enableGetActivationKey
* enableGetLatestVersionHttp
* enableUpgradeLicense
* enableUploadAffiliates
* enableUploadECommerceProviders

**Note that all these settings can now be configured from the QLM Management Console as described in this** [**article**](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties)**.**
