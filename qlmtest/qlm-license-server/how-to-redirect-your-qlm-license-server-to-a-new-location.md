# How to redirect your QLM License Server to a new location

If you need to relocate your QLM License Server to a new location, you can use the IIS HTTP Redirect feature to redirect all requests to a new server.&#x20;

For detailed instructions on how to enable and configure IIS HTTP Redirect, check this [article](http://www.iis.net/configreference/system.webserver/httpredirect).

In summary, you need to perform the following operations in IIS:&#x20;

* Locate your QLM virtual directory in IIS and click the HTTP Redirect button in the Features View
* Check the “Redirect requests to this destination” checkbox.
* In the destination field, enter the new URL to the QLM Web Service. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* In the “Redirect Behavior” panel, check “Redirect all requests to exact destination (instead of relative destination)
* Click Apply
* [httpredirect.png](https://support.soraco.co/hc/en-us/article\_attachments/202713743)9 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/202713743)
