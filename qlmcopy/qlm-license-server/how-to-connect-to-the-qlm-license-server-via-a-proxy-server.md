# How to connect to the QLM License Server via a proxy server

### Overview <a href="#h_01hd6dqv6t8t3wmmzfntpvw0er" id="h_01hd6dqv6t8t3wmmzfntpvw0er"></a>

If a client computer connects to the internet via a Proxy Server that requires authentication, you must configure QLM to use the proxy server.

Note that nowadays, proxy servers have become less common. For the few cases where proxy servers are used by your customers, you may elect to perform an [offline](https://support.soraco.co/hc/en-us/articles/200754044) activation instead.

### QLM License Wizard <a href="#h_01hd6drv2qrrv4tq9k5g98mmrn" id="h_01hd6drv2qrrv4tq9k5g98mmrn"></a>

The QLM License Wizard allows your customer to configure their proxy settings as shown in the screenshot below. Once configured, the wizard stores the proxy settings on the system.&#x20;

If you are not using the QLM License Wizard, you must create a user interface that allows the customer to enter their proxy settings. You must then store them for subsequent use.

![](https://support.soraco.co/hc/article\_attachments/20196071499540)

### Code Level changes <a href="#id-01hd6dsmdybs2fc4rcybn8hmqs" id="id-01hd6dsmdybs2fc4rcybn8hmqs"></a>

If you are using the QLM License Wizard, no code changes are required. The QLM License Wizard stores the proxy settings in a location that the QlmLicense object can access and hence use to connect to the License Server.

If you are not using the QLM License Wizard, you must manage the proxy settings by storing them and reading them yourself.

When calling an API that communicates with the QLM License Server, you must set the following proxy settings properties: UseProxy, ProxyUser, ProxyDomain, ProxyPassword, ProxyHost, ProxyPort&#x20;

After these properties are set, you can call any API that communicates with the QLM License Server.

To detect that the customer requires authentication through a proxy server, you need to catch the exception that is thrown when the QLM API fails.

```
try
{  
   license.ActivateLicense(...);
}
catch (System.Net.WebException wex)
{   
   if (wex.Message.IndexOf("407") != -1)
   {
      // Customer user proxy server that requires authentication.
      // Configure the proxy settings - it is not recommended to put all this code in the catch clause - this is just to show you what APIs to call

      license.UseProxy = true;
      license.ProxyUser = "xxx";
      license.ProxyPassword= "***";
      license.ProxyDomain = "yyy";

      license.ProxyHost= "zzz";
      license.ProxyPort= 8080;
      license.ActivateLicense (...);
   }
   else
   {
      // error
      return;
   }
}
catch (Exception ex)
{
   // error
   return;
}
```
