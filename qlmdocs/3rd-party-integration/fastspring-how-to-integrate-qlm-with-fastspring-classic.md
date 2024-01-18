# FastSpring - How to integrate QLM with FastSpring (Classic)

If you are using FastSpring as an eCommerce provider, QLM integrates seamlessly with FastSpring's ordering system.\
\
After completing the steps below, when a customer purchases your product from FastSpring, FastSpring will automatically get a license key from the QLM web service and then update the QLM database with the license and customer information.

To integrate FastSpring with QLM, perform the following in the FastSpring Control Panel:

### FastSpring Setup for a Basic Product

* Select your product in the FastSpring Control Panel
* Add a Fulfillment Action:
* On the Licenses tab, select "Remote" and click on Next
* Set the URL to: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKey?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00
* You should update the URL above to point to your server and specify your product ID, major and minor version.
* Method: HTTP POST
* POST Encoding: UTF-8
* License Name Type: Person Full Name + Email Address
* Output Format: Plain Text, Single-Line License
* Click on Create
* Click on Save
* In the Fulfilment Actions section, click on Add
* Select Email / Web Notification and click Next
* Reuse Options: Reusable On Multiple Products
* Subject : #{orderItem.display} - Order #{order.reference}
* Email Text Contents :              You can download #{orderItem.display} from:              Soraco Technologies
* &#x20;You can customize the Email Html and Web tabs as well.
* &#x20;           Sincerely,
* &#x20;           Should you have any questions please contact us at: [sales@soraco.co](mailto:sales@soraco.co)
* &#x20;           [http://soraco.co/products/qlm/qlmsetup5.exe](http://soraco.co/products/qlm/qlmsetup5.exe)
* &#x20;           Your Activation Key is: #{orderItem.fulfillment.license.outcome.licenses.list}
* &#x20;           Thank you for your purchase of #{orderItem.display}.\
  &#x20;           Dear #{order.customer.fullName},

### FastSpring Setup for Updating Contact Information

&#x20;To transfer the contact information from FastSpring to QLM, follow the steps below:

* From the FastSpring Control Panel Home page, click on the "Notify" icon in the top toolbar.
* Click on Add Notification Rule.
* Format: HTTP Remote Server Call.
* Type: Order Notification.
* Remote Server URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/UpdateUserInformation
* Click on Next
* In the HTTP Parameters section, click on Add Parameter.
* Name: is\_avkey
* Value: #{orderItem.fulfillment.license.outcome.licenses.list}
* Click on Add Parameter again.
* Name: is\_vendor
* Value: fastspring
* Optionally, add an is\_user and is\_pwd parameters to enforce authentication. The user and password can be specified from the QLM Application, under Manager Keys / Commerce Providers.

With the steps above completed, place a test order by clicking on the FastSpring Control Panel Home page, then Store Testing. Once your test order is completed, an activation key will be created in the QLM database along with the corresponding customer and order information.\
\


### FastSpring Setup for Maintenance Plan

If you sell a yearly maintenance plan to your customer, you can configure FastSpring to automatically update the maintenance plan expiry date in QLM.

* Click on Products and Pages
* Click on Create Subscription Product
* Name:  Yearly Maintenance Plan
* Regular Period Length: 1 year
* USD: xx
* Click on Create
* &#x20;In the Fulfillment section, click on Add
* Click on the License tab, select Remote and click Next
* URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewMaintenancePlan?is\_vendor=fastspring\&is\_user=john\&is\_pwd=fast123
* License Name Type: Person Full Name + Email
* Click on Create
* Click on Save
* Click on the Home button
* Click on Custom Fields
* Click on Create Customer Field Configuration
* Name: custom\_referrer (THIS NAME IS FIXED, IT CANNOT BE CHANGED)
* Click on Next
* Display: Activation Key
* Click on Add Form Field
* Input Type: Textbox
* Required: Yes
* Name: custom\_referrer
* Question Text: Activation Key
* Question Description: Enter your current activation key (starts with the letter A)
* Click on Add
* Click on Save
* Click on Save
* In the Conditions section, click on Edit
* Select Order Environment Condition and click Next
* Environment Tag Exists: is\_maintenance\_plan
* Click on Create
* Click on Save
* Click on the Home page
* To test the maintenance plan configuration:

### FastSpring Setup for Purchasing an Upgrade

If you sell upgrades to a specific version of your software, you can integrate FastSpring with QLM’s license upgrade feature.

* Create a Product in a way similar to the first section
* Click on Create Product
* Name: Upgrade
* USD: xx
* Click on Create
* In the Fulfillment section, click on Add
* Click on the License tab, select Remote and click Next
* URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/UpgradeLicense?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=2\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_user=john\&is\_pwd=fast123
* License Name Type: Person Full Name + Email
* Click on Create
* Click on Save
* Create an Email Fulfillment similar to the main Product
* Click on the Home button
* Click on Custom Fields
* Click on “custom\_referrer”
* In the Conditions section, click on Edit
* In the Active Conditions section, click Edit
* Environment Tag Exists: is\_maintenance\_plan, is\_ugprade
* Click on Save
* Click on the Home page
* To test the Product Upgrade configuration:

### FastSpring Setup for a Subscription Product

If you sell a subscription based product, you can integrate FastSpring with QLM’s subscription renewal feature.

* Create a Subscription-based Product in FastSpring
* Click on Create Subscription Product
* Name: Your Product
* USD: xx
* Click on Create
* In the Fulfillment section, click on Add
* Click on the License tab, select Remote and click Next
* URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/GetActivationKeyWithExpiryDate?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_user=john\&is\_pwd=fast123\&is\_expduration=365
* Method: HTTP POST
* POST Encoding: UTF-8
* Output Format: Single-Line License
* Go to the Advanced tab
* Set the Fulfillment Applicability to: Applies to Non-Rebills / First Orders Only
* Go back to the Fulfillment section and click on Add
* Click on the License tab, select Remote and click Next
* URL: https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx/RenewSubscriptionHttp?is\_vendor=fastspring\&is\_user=john\&is\_pwd=fast123\&is\_expduration=365
* Method: HTTP POST
* POST Encoding: UTF-8
* Output Format: Single-Line License
* Go to the Advanced tab
* Set the Fulfillment Applicability to: Applies Rebills Only
* Create an Email Fulfillment similar to the main Product (details as described in the previous sections).
* Click on Save
* To test the Product Upgrade configuration:
