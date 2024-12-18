# How to redirect your QLM License Server to a new location

If you need to relocate your QLM License Server to a new location, you can use the IIS HTTP Redirect feature to redirect all requests to a new server.&#x20;

Note that IIS HTTP Redirect cannot handle URL arguments. Therefore, if you are using the QLM HTTP Methods or you are using one of the QLM 3rd party extensions (ecommerce), you cannot use IIS HTTP Redirect to redirect to a new location. You must use the [URLRewrite ](how-to-redirect-the-qlm-license-server-using-url-rewrite.md)approach.

For detailed instructions on how to enable and configure IIS HTTP Redirect, check this [article](http://www.iis.net/configreference/system.webserver/httpredirect).

In summary, you need to perform the following operations in IIS:&#x20;

QLM License Server

* Locate the QlmLicense Server virtual directory in IIS and click the HTTP Redirect button in the Features View
* Check the “Redirect requests to this destination” checkbox.
* In the destination field, enter the new URL to the QLM Web Service. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* In the “Redirect Behavior” panel, uncheck “Redirect all requests to exact destination (instead of relative destination)
* Set the Status Code to: Permanent (301)
* Click Apply

<figure><img src="../.gitbook/assets/image (47).png" alt=""><figcaption></figcaption></figure>

QLM Customer Site

* Locate the QlmCustomerSite virtual directory in IIS and click the HTTP Redirect button in the Features View
* Check the “Redirect requests to this destination” checkbox.
* In the destination field, enter the new URL to the QLM Web Service. Example: [https://qlm3.net/qlmdemo/QlmCustomerSite](https://qlm3.net/qlmdemo/QlmCustomerSite)
* In the “Redirect Behavior” panel, uncheck “Redirect all requests to exact destination (instead of relative destination)
* Set the Status Code to: Permanent (301)
* Click Apply

QLM Portal

* Locate the QlmPortal virtual directory in IIS and click the HTTP Redirect button in the Features View
* Check the “Redirect requests to this destination” checkbox.
* In the destination field, enter the new URL to the QLM Web Service. Example: [https://qlm4.net/qlmdemo/QlmPortal/QlmPortal.aspx](https://qlm4.net/qlmdemo/QlmPortal/QlmPortal.aspx)
* In the “Redirect Behavior” panel, check “Redirect all requests to exact destination (instead of relative destination)
* Set the Status Code to: Permanent (301)
* Click Apply
