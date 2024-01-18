# UltraCart - How to integrate QLM with UltraCart

Quick License Manager integrate with UltraCart's ordering system to generate activation codes automatically.\
To have UltraCart invoke QLM during an order, do the following:\
\
**From within your UltraCart account:**

\
**From Item Management -> Items**

* Locate your Product and open the Item Editor for this product
* In the Item Editor, select the **Digital Delivery** tab
* In the **Activation Codes** section of the Digital Delivery tab:
* Select **Retrieve Real-time**
*   Enter the following **URL** (change the 'yourserver' name to your own)

    > **http://yourserver/qlm/qlmservice.asmx/GetActivationKey?is\_vendor=ultracart\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_features=0**

    Where

    * is\_vendor = ultracart
    * is\_productid = your product id as defined in QLM
    * is\_majorversion = your product's major version as defined in QLM
    * is\_minorversion = your product's minor version as defined in QLM
    * is\_qlmversion = 5.0.00
    * is\_features = semicolon separated list of feature sets and ther corresponding values. Example: is\_features=0:3;1:0
* Enter a value in the **Shared Secret** field. Remember this value as it needs to be set in QLM as well.

**Next configure QLM to include the UltraCart provider as follows:**\
**From Manage Keys-> License Management tab**

* Select **Tools ->** **eCommerce Providers**
* Locate the UltraCart item and enter the following values:\

  * Enabled: \[X]
  * Password: _**Shared Secret** entered in UltraCart Activation Code section_

**Edit your QLM server's Web.config file and set the following setting:**

> \<setting name="defaultVendor" serializeAs="String">\
> \<value>UltraCart\</value>\
> \</setting>

&#x20;

With the above steps completed, place a test order. When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated to the user.

To configure a test payment method:

* Click  CONFIGURATION / Checkout
* Click Payments
* Check "Credit Cards"
* Click Save
* In the Methods panel, click "Credit Card"
* In the "Test Credit Cards" section, edit the first credit card by clicking "edit"
* Check "Skip payment gateway, consider payment processed, then complete order to prevent shipment."
* Check "Skip affiliate transaction processing"
* Check " Skip fraud filter"
* Check " Skip conversion pixels"
* Click Save

To place a test order:

* Go to OPERATIONS / Order Management
* Click "Manually enter an order"
* Fill in all the contact information
* In the "Items" section, enter your product in the Item ID field, set the quantity to 1 then click Add.
* Click "Credit Card"
* Enter: 4444333322221111 (if you modified the default credit card #, enter the value you specified)
* Set the Expiration Date to a date in the future
* Set the Verification Number to: 123
* Check "No real-time change"
* Check "Skip Processing"
* Check "Skip Fraud Score"
* Click Process Order.
