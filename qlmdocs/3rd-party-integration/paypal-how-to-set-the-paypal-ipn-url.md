# PayPal - How to set the Paypal IPN URL

When integrating QLM with Paypal, you must configure the Paypal IPN to connect to the QLM License Server. The IPN can either be configured globally and apply to all transactions or it can be configured per button.

#### Global IPN Configuration

To configure the Paypal IPN to point to the QLM License Server.

* Log in to your PayPal account
* In the Settings menu, select **Account Settings**
* In the **Notifications** section, locate the **Instant payment notifications** section
* Click **Update**
* Click **Choose IPN Settings**
* In the **Notification URL** field, enter (update the URL to point to your QLM License Server): [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Check the option Receive IPN messages (Enabled)
* Click Save

#### Per Button IPN Configuration

* Log in to your PayPal account
* In the Settings menu, select **Account Settings**
* In the **Website payments** section, locate the **PayPal button** section
* Click **Update**
* Click **Buy Now**&#x20;
* Configure the **Buy Now** options as needed
* Expand **Step3: Customize advanced features**
* Check the **Add advanced variables** checkbox (see the screenshot below)
* Add the following in the advanced section (update the URL to point to your QLM License Server) and enter a new line containing the following&#x20;
  * address\_override=1&#x20;
  * notify\_url=[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmpaypalipn.aspx)
* Click **Create Button**

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360081074911/mceclip1.png)
