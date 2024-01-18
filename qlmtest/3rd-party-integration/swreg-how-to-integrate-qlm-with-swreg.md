# SWREG - How to integrate QLM with SWREG

If you are using SWREG as an ecommerce provider, QLM integrates seamlessly with SWREG's ordering system.

To have SWREG invoke QLM during an order, do the following in the SWREG Control Panel:

* Click on Create/Edit Products
* Select a Product and click on Edit.
* Click on the **Edit Delivery Method**.
* Click on **Edit Email.**
* Locate the **Keycode generator URL**field and enter the following URL:

[http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKey](http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKey)

When invoking the SWREG order form from your web site, add the following argument to the SWREG URL:

\&t=pid%3d_\<productID>_%26mj%3d_\<majorVersion>_%26mn%3d_\<minorVersion>_%26vn%3d_SWREG_%26fe%3d_\<features> %26ur%3d\<user> %26pw%3d\<password> \&x=1_

where,

* vn = SWREG
* productID = your product id as defined in QLM
* majorVersion = your product's major version as defined in QLM
* minorVersion = your product's minor version as defined in QLM
* features = semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled.
* user = username defined in the QlmProviders.xml (optional)
* password = password defined in the QlmProviders.xml (optional)

Note: Due to limitations in the maximum number of characters in SWREG's user\_text field, the name of the arguments above have been abbreviated.

For example:

[https://usd.swreg.org/cgi-bin/s.cgi?s=46994\&p=46994TESTPROD\&v=0\&d=0\&q=1\&t=pid%3d4%26mj%3d4%26mn%3d0%26vn%3dSWREG\&x=1](https://usd.swreg.org/cgi-bin/s.cgi?s=45794\&p=45794QLM3\&v=0\&d=0\&q=1\&t=pid%3d9%26mj%3d4%26mn%3d0%26vn%3dSWREG\&x=1)

With the steps above completed, place a test order. When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated to the user.
* An email will be sent to the customer with the activation key.
