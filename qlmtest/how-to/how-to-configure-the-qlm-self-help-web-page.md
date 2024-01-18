# How to configure the QLM Self Help web page

The [QLM Self Help page](https://soraco.co/quick-license-manager/selfhelp/) is a web form that you can include on your web site to provide your customers with self help for managing their license keys. The QLM Self Help page allows your users to:

* Activate a license on behalf of a computer that is not connected to the internet
* Deactivate a license
* Get information about a license such as which computers have currently activated the license
* Send a registered customer their license keys by email

&#x20;The QLM Self Help page is found in the QlmCustomerSite (formerly QlmAspLicenseSite) web application. For details about the QlmCustomerSite web application and installation instructions, refer to this [article](https://support.soraco.co/hc/en-us/articles/202932304-QlmAspLicenseSite).

The article below focuses on customizing the Self Help page. To customize the Self Help page, edit the default.aspx file located in the QlmCustomerSite folder in the editor of your choice.

&#x20;

**License Activation**&#x20;

To customize the "License Activation" button, simply update the "Activate a License" URL to point to your own server.

**License Deactivation**&#x20;

To customize the "License Activation" button, simply update the "Deactivate a License" URL to point to your own server.

**License Information**

To customize the "License Activation" button, simply update the "Get License Information" URL to point to your own server.

**Email License Keys**

To customize the "Email License Keys" button, simply update the "Get License Information" URL to point to your own server. If you want to be cc'ed or bcc'ed, add the is\_ccemail or is\_bccemail arguments.

&#x20;

**Sample Screenshots**

&#x20;

<figure><img src="https://support.soraco.co/hc/article_attachments/360001152306/mceclip0.png" alt=""><figcaption></figcaption></figure>

&#x20;

**Activate a license**&#x20;

<figure><img src="https://support.soraco.co/hc/article_attachments/360001152803/mceclip1.png" alt=""><figcaption></figcaption></figure>

**Deactivate a license**

<figure><img src="https://support.soraco.co/hc/article_attachments/360001152326/mceclip2.png" alt=""><figcaption></figcaption></figure>

**Get License Information**

<figure><img src="https://support.soraco.co/hc/article_attachments/360001152943/mceclip3.png" alt=""><figcaption></figcaption></figure>

**Email License Keys**

<figure><img src="https://support.soraco.co/hc/article_attachments/360001152366/mceclip4.png" alt=""><figcaption></figcaption></figure>
