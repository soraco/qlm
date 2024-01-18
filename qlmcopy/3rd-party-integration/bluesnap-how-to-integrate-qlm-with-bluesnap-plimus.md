# BlueSnap - How to integrate QLM with Bluesnap (Plimus)

If you are using Bluesnap as an eCommerce provider, QLM integrates seamlessly with Bluesnap's ordering system. To have Bluesnap invoke QLM during an order, do the following in the Bluesnap Control Panel: &#x20;

* Click on My Account
* Locate your Product and click on Setup.
* Locate a contract and click on Setup.
* Click on the **License Keys** link.
* In the License Group/Method field, select: **Custom HTPP request**.
* In the Call Method field, select: **One call per Order**.
*   In the URL for HTTP request, enter the following:

    > https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_vendor=plimus\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_features=0\&order\_id=\<INVOICE\_ID>\&email=\<CUSTOMER\_EMAIL>\&name=\<CUSTOMER\_NAME>\&company=\<COMPANY\_NAME>\&addr1=\<CUSTOMER\_ADDRESS1>\&addr2=\<CUSTOMER\_ADDRESS2>\&city=\<CUSTOMER\_CITY>\&state=\<CUSTOMER\_STATE>\&zip=\<CUSTOMER\_ZIPCODE>\&country=\<CUSTOMER\_COUNTRY>\&phone=\<CUSTOMER\_PHONE>\&quantity=\<QUANTITY>

where

* is\_vendor = plimus (_plimus is the old name of Bluesnap)_
* is\_productid = your product id as defined in QLM
* is\_majorversion = your product's major version as defined in QLM
* is minorversion = your product's minor version as defined in QLM
* is\_qlmversion = 5.0.00
* is\_features = semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled.
* is\_user = username defined in the QlmProviders.xml (optional)
* is\_pwd = password defined in the QlmProviders.xml (optional)

With the steps above completed, place a test order. When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated to the user.
*   If you would like to customize the email that is sent to the customer with the activation key, in the Plimus control panel, click on the **Order Email** link and add the following line to the body of the email:

    > Your Activation Key: \<LICENSE\_KEYS>
