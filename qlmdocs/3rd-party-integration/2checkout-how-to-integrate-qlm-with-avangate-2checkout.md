# 2Checkout - How to integrate QLM with Avangate / 2checkout

### Overview

If you are using Avangate / 2checkout as an eCommerce provider, QLM integrates seamlessly with the 2Checkout ordering system. After completing the steps below, when a customer purchases your product from 2checkout, 2checkout will automatically get a license key from the QLM License Server and then update the QLM database with the license and customer information.&#x20;

### Configuration

To configure 2checkout to invoke QLM during an order, perform the following in the 2checkout Control Panel:

* Click on the Setup menu item.
* Click Fulfillment
* Go to the Electronic Delivery tab
* In the "Add New Code List" panel, enter a List Name, set the List type to "Dynamic" and click on "Add List".
* Click the "Set URL..." button next to the URL field.
*   In the Debug Url field enter the following value

    > https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_vendor=avangate\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_licensemodel=permanent
* You should update the URL above to point to your server and specify your product ID, major and minor versions.
* Select a product from the list.
* Click on the "Step 4. Debug" button.
* When you get the "Success" message, click the "Step 5. Save URL" button.
* Close the dialog.
* Click on the "Update " button&#x20;

Finally, in the Assigned Products section, add the required product to the "Assigned Products" list.

### Security

To prevent unauthorized access to the QLM service, you can also specify a username/password in the URL above by adding the is\_user and is\_pwd arguments. \
\
For example:&#x20;

https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_vendor=avangate\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_licensemodel=permanent\&is\_user=john\&is\_pwd=12345\
\
The same user/password combination must be specified in the QLM Application under Manage Keys / Commerce Providers for the Avangate entry.

Additionally, as of QLM v18.0.24200.1, you can enable SHA2 integrity validation. To enable SHA2 validation:

* In the 2Checkout control panel, go to Integrations / Webhooks & API
* On the Webooks & API tab, copy the Secret Key to your clipboard
* Go to the QLM Management Console / Manage Keys / 3rd Party Extensions / 2checkout/Avangate
* Paste the Secret Key in the "Shared Key" field then click OK

\
\
Now that the Electronic delivery list is created, you need to associate it with your product. To do so:

* Click on the Products menu item then select your product.
* Click on the Fulfillment tab.
* Select "Fulfillment made through 2Checkout delivery (binary keys, activation codes, Backup Media, product file, DIS)"
* In the Content & methods section, select "Electronic code/key / binary file"
* In the "Activation codes settings" section, select the Code list you created earlier.
* In the "Additional fulfillment information - by email", customize the email template.

To place a test order:

* Click on the Products menu item then select your product.
* Click on the Information tab.
* Click on "Get buy links for this product"
* Scroll down the page and click on "Place a test order"
* In the "Activation codes settings" section, select the Code list you created earlier.
* In the "Additional fulfillment information - by email", customize the email template.

Tips: Credit Card: 4111111111111111, CVV2: 123

Name: John Doe

[https://knowledgecenter.2checkout.com/Documentation/09Test\_ordering\_system/01Test\_payment\_methods](https://knowledgecenter.2checkout.com/Documentation/09Test\_ordering\_system/01Test\_payment\_methods)

&#x20;

**Maintenance Plan**

To add a maintenance plan option to your product, follow the steps below:

**Create a Maintenance Plan product**

* Click Add Product to create a new product
* Set the Product Name to Yearly Maintenance Plan, or any name of your choice
* Set the Product Type to "Regular"
* Set the price
* Set the billing cycle to 12 months, or any period of your choice
* Save your product

**Create a product bundle**

* Click Add product
* Set the Product Name to Product Bundle, or any name of your choice
* Set the Product Type to "Bundle"
* From the Available Products list, select your product and the Yearly MaintenancePlan and add them to the "Bundled Products" list
* Save your product bundle

**Add a fulfillment to renew the maintenance plan**

* Click on the Setup menu item.
* Click Fulfillment
* Go to the Electronic Delivery tab
* In the "Add New Code List" panel, enter a List Name such as RenewMaintenancePlan, set the List type to "Dynamic" and click on "Add List".
* Click on the "Debug ..." button next to the URL field.
*   In the Debug Url field enter the following value:&#x20;

    > https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=avangate
* You should update the URL above to point to your server
* Add the Yearly Maintenance product to the "Selected products" list
* Click on the "Step 3. Debug" button.
* When you get the "Success" message, click on the "Step 4. Save URL" button.
* Close the dialog.
* Click on the "Update" button&#x20;
