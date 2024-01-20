# Offline activation of Cross Platform Apps with License Files

When protecting a cross-platform app with License Files, in the event a  client does not have an internet connection to activate a license online, you can perform an **offline activation** as described below.

**1. From the QLM Management Console**

* In the QLM application, under the Manage Keys tab, locate and select the license to activate.
* Click on the Activate button.
* Fill in the Computer ID field on the Activation tab along with other fields as required.
* Click on the **Advanced** tab.
* Select a location where you would like to store a license file on your system then click Ok.
* Send the generated license file to your customer and ask them to copy it to the folder where your application expects the license file to be located.

![](https://support.soraco.co/hc/article\_attachments/360010584071/mceclip2.png)

![](https://support.soraco.co/hc/article\_attachments/360010584091/mceclip3.png)

&#x20;

**2. From the QLM Portal**

* In the QLM Portal, under the Licenses tab, locate and select the license to activate.
* Click on the Activate button.
* Fill in the Computer ID field on the Activation tab along with other fields as required.
* Click on the **Advanced** tab.
* Click Download License File
* Click Ok
* A license file will be downloaded to the current computer
* Send the generated license file to your customer and ask them to copy it to the folder where your application expects the license file to be located.

![](https://support.soraco.co/hc/article\_attachments/360023278451/mceclip2.png)

**3. From the QLM Self Help**&#x20;

* From a computer that has internet access, your customer loads the web page where you are hosting the QLM Self Help

![](https://support.soraco.co/hc/article\_attachments/360010584031/mceclip0.png)

* Select "Activate a license"
* Enter the Activation Key and Computer ID
* Check "Generate a license file"
* Click Activate
* A license file will be automatically downloaded to the end user system
* The user should then copy this file to the system that is offline in a location specific to your application

![](https://support.soraco.co/hc/article\_attachments/360010584051/mceclip1.png)

&#x20;

&#x20;4**. From the QLM API**

You can also call the [ValidateLicenseHttp](../api-reference/http-methods/validatelicensehttp.md) method to download the QLM License file.
