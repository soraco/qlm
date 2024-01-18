# How to publish your products to the License Server

When you create products in the QLM Management console, the products are stored locally. Once you are ready to start creating keys for your product, you must publish your products to the QLM License Server.

If you do not publish your products to the server, you will typically get the following error when you try to create a license key:

**Could not find product: x y.z**

If you just navigate to the Manage Keys tab, QLM should automatically detect that your local products are out of sync with the server and prompt you to publish them.

If for some reason you do not get prompted to upload your products to the license server, do the following:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Click **Upload your products to the license server**

![](https://support.soraco.co/hc/article\_attachments/360000499523/mceclip0.png)

&#x20;

If the above steps do not resolve the issue, try the troubleshooting steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Go to the Files and Folders tab
* Highlight the Products File path and copy it to the clipboard (see screenshot below)

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360060718492/mceclip0.png)

* Click Cancel to close the dialog
* In the QLM Management Console, click the Settings icon on top left hand corner![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360060883931/mceclip1.png)
* Select Options
* On the General tab, locate the Products file path and paste the data in the clipboard

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/360060718652/mceclip2.png)

* Click Ok
