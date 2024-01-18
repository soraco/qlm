# Regnow - How to integrate QLM with Regnow

If you are using Regnow as an ecommerce provider, QLM integrates seamlessly with Regnow's ordering system.   To have Regnow invoke QLM during an order, do the following in Regnow Control Panel: &#x20;

* Click on Products
* Select a Product and click on Edit.
* Click on the **Manage Delivery Options** tab.
* Locate the **Method** field and select **Post.**
* Locate the **http://** field and enter the following URL:

[http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKey?is\_productid=_\<productID>_\&is\_majorversion=_\<majorVersion>_\&is\_minorversion=_\<minorVersion>_\&is\_vendor=_regnow_\&is\_features=_\<features_](http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKey?is\_productid=%3CproductID%3E\&is\_majorversion=%3CmajorVersion%3E\&is\_minorversion=%3CminorVersion%3E\&vendor=regnow\&is\_features=%3Cfeatures)>

where

* is\_vendor = regnow
* is\_productid = your product id as defined in QLM
* is\_majorversion = your product's major version as defined in QLM
* is minorversion = your product's minor version as defined in QLM
* is\_qlmversion = 5.0.00
* is\_features = semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled.
* is\_user = username defined in the QlmProviders.xml (optional)
* is\_pwd = password defined in the QlmProviders.xml (optional)

&#x20;

With the steps above completed, place a test order. When the order is placed, the following will occur:

&#x20;

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated to the user.
* An email will be sent to the customer with the activation key.
