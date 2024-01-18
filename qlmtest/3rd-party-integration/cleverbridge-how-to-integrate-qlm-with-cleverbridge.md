# Cleverbridge - How to integrate QLM with Cleverbridge

If you use Cleverbridge as your eCommerce provider, QLM integrates seamlessly with Cleverbridge's ordering system.&#x20;

After completing the steps below, when a customer purchases your product from Cleverbridge, Cleverbridge will automatically get a license key from the QLM web service and then update the QLM database with the license and customer information. To integrate Cleverbridge with QLM, perform the following in the Cleverbridge Control Panel:

### Cleverbridge Setup for Protecting your product

* In the Cleverbridge Commerce Assistant, go to Products and Delivery then select Key Generators
* Click "Add Key Generator / Web Key Generator"
* In the Name field, type: QLM Key Generator
* In the Path field, type: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is\_vendor=cleverbridge\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is\_vendor=cleverbridge\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00)
* You should update the URL above to point to your server and specify your product ID, major and minor version.
* Leave the "Authenticate" checkbox unchecked. Note that you can add a user/pwd to the URL above. See the QLM help for more details.
* In the Interface field, select "Type 1"
* In the Character Encoding field, select "Unicode (UTF-8)"
* Check "Use Romanized contact values
* Uncheck "Call once per purchase"
* Check "Use XML client notification"
* In the XML Schema field, select "Use Current Version"
* Uncheck "Client handles errors"
* Click Save
* In the Products section, locate your product and double click it.
* In the Delivery Details section, set the "Delivery type" to "company delivers key"
* In the Web Key Generator field, select "QLM Key Generator"

With the steps above completed, place a test order as follows:

* Click "Tools / Link Generator"
* Set the Destination field to "Checkout process"
* In the Cart Content section, select your product and click on the "Down" key"
* Click Open and select a browser
* Fill in all the required fields and place a test order.
* When the order is completed, a license key will be generated and an email will be sent to the customer with the license key. Additionally, customer information will be transferred to the QLM database.
