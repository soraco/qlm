# Magento - How to integrate QLM with Magento

If you are using Magento as an eCommerce provider, QLM integrates seamlessly with Magento's ordering system.&#x20;

When an order is placed via Magento, Magento communicates with the QLM License Server and sends the order information.

The QLM License Server populates its database with the order information, creates the required license keys and sends them back to Magento.

Magento then stores the License Key within the order and includes the license key in the email that is sent to the customer.

The QLM Magento extension supports regular (non-subscription) products.

To have Magento invoke QLM during an order, follow the steps below:

&#x20;

**Install the QLM Magento Extension**

* Locate the QLM extension in the Magento Store
* Download it and install it

**Configure the connection to the License Server**

* Go to System Configuration
* Locate the QLM panel on the left-hand side
* Go to the QLM / General section
* Set the License Server Url to the URL of your QLM License Server. Example: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)
* Click Save Config

**Configure your product**

* Go to Catalog / Manage Products
* Add a new product of type Downloadable
* In the General section, locate the QLM Settings property
* Set the value as follows (replace the values to match your product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_licensemodel=permanent\&is\_features=0:3
* Click Save

where

* is\_productid = your product id as defined in QLM
* is\_majorversion = your product's major version as defined in QLM
* is minorversion = your product's minor version as defined in QLM
* is\_qlmversion = 5.0.00
* is\_features = semi comma-separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled.
* is\_user = As defined in Manage Keys / 3rd Party Extensions
* is\_pwd = As defined in Manage Keys / 3rd Party Extensions

&#x20;

With the steps above completed, place a test order. When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated with the user.
* A License Key will be added to the Magento Order
* The License Key is included in the email sent to the user with the order information
