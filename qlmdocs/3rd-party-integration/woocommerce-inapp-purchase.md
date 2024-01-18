# WooCommerce - InApp Purchase

You can configure the QLM License Wizard to perform an InApp purchase with WooCommerce.

The InApp purchase is processed via an embedded browser in the QLM License Wizard. At the end of the purchase process, the Activation key is automatically created and displayed in the wizard for the user to activate.

To configure the InApp purchase process:

* Launch the QLM Management Console
* Go to the Protect Your Application wizard
* Click Next
* Select a product and the License Server then click Next
* Select the programming language of your application then click Next
* In the "Customize Look & Feel" page, set the following properties:
  * QlmBuyNowInApp: true
  * QlmBuyNowInAppRetrieveActivationKey: true
  * QlmBuyNowUrl (update the vendor/product ids as required): [https://yoursite.com/cart/?add-to-cart=15038\&is\_userdata1=](https://yoursite.com/cart/?add-to-cart=15038\&is\_userdata1=)
* Click Next then Save
* Deploy the generated XML Settings file with your application and use it to launch the QLM License Wizard

Note that this process works reliably only if a single product is added to the order.

The process from an end-user perspective looks like this:

* The user clicks the Buy Now button in the QLM License Wizard
* An embedded browser displays the shopping cart with the product already added
* The user fills in the required purchase information and places the order
* Once the order is processed, the user clicks the Next button
* The License Wizard resumes and displays the Activation Key generated following the purchase
* The user clicks Activate to complete the operation.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/12174297628436)

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/12174301885844)

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/12174338560148)

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/12174344082964)

![mceclip4.png](https://support.soraco.co/hc/article\_attachments/12174397457556)
