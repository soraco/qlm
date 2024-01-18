# How to define the user / password associated to an eCommerce provider

When you integrate QLM with an eCommerce provider or if you want to invoke QLM's direct [HTTP methods](https://support.soraco.co/hc/en-us/sections/201730676-HTTP-Methods), it is highly recommended to protect access to these methods with a user/password.

The first step is to define the user/password for the eCommerce provider that you will be using:

* Launch the QLM Management Application
* Go to the "Manage Keys" tab
* Click the "3rd Party Extensions" menu item (previously "eCommerce Providers" menu item)
* Locate the Commerce Provider of your choice
* Set the User and Password of that provider
* It is also highly recommended that you disable all eCommerce providers that you are not using by unchecking the "Enabled" checkbox.

When invoking the URL to connect to the QLM License Server, set the is\_user and is\_pwd URL arguments to match the user/password you configured.

Example: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_vendor=regnow\&is\_user=myuser\&is\_pwd=mypassword

**QLM 7 and later**

Finally, it is also recommended that you modify the **defaultCommerceProvider** setting of the Server Properties to be the vendor that you will be using. For example, if you are using FastSpring, update this setting to: FastSpring.

Even if you are not using an eCommerce provider to sell your software, it is recommended that you configure a default eCommerce provider if you plan on using some of the [HTTP methods](https://support.soraco.co/hc/en-us/sections/201730676-HTTP-Methods) to communicate with the License Server. Once you select an eCommerce provider, you can configure the security settings of the eCommerce provider to restrict access to the HTTP methods with a user/password combination.&#x20;

**QLM 6 and  earlier**

Finally, it is also recommended that you modify the **defaultVendor** setting in the web.config file of the QLM web service to be the vendor that you will be using. For example, if you are using FastSpring, update the web.config file on the server as follows:

\<setting name="defaultVendor" serializeAs="String">\
\<value>fastspring\</value>\
\</setting>
