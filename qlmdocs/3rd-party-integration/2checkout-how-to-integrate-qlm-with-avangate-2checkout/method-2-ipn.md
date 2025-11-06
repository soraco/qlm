# Method 2: IPN

## IPN Configuration

* Login in to your 2checkout  system
* Expand the Integrations node and select Webhooks & API
* Go to the IPN Settings tab
* Click "Add IPN URL"
* Set the URL to:&#x20;
* > [https://qlm4.net/qlmdemo/qlmlicenseserver/qlmservice.asmx/QlmWebHookHandler?is\_vendor=avangate\&is\_user=tom\&is\_pwd=xyz  > ](https://qlm4.net/qlmdemo/qlmlicenseserver/qlmservice.asmx/QlmWebHookHandler?is_vendor=avangate\&is_user=tom\&is_pwd=xyz)
* You should update the URL above to point to your server and update the user/password to match the user/password that you specified when you enabled the 2checkout/Avangate extension in the QLM Management Console.
* On the IPN Settings tab,:
  * Take not of the Secret Key. You will need it later on.
  * In the Triggers section, make sure that the following option is selected: Authorized and approved orders (sent after electronic delivery)
  * In the Response Tags section, make sure the following fields are selected:

<figure><img src="../../.gitbook/assets/image.png" alt=""><figcaption></figcaption></figure>

## 2Checkout product configuration

* Create your product in 2Checkout

#### Mapping your 2Checkout product to the QLM product

To map your 2Checkout product to a QLM product, you must identify your 2Checkout Product ID and then create a QLM Custom Server Property.&#x20;

#### Identify your 2Checkout Product ID

* Login to your 2Checkout account
* Go to the Setup/Products section
* The ID of the product is typically the first column  of the table listing your products
* Note your Product ID as you will use it in the next step

#### Create a QLM Server Property

Next, you will create a QLM Custom Server property that maps your 2Checkout product to a QLM product.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Click the + sign on the right-hand side to add a new custom server property
* Set the property name to: pid\_<2Checkout Product ID>. For example, if your 2Checkout Product ID is 8019770900775, set the name to: pid\_8019770900775
* Set the value of the property to (modify the values to correspond to your own product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_productname=MyProduct\&is\_emailtemplate=1. New Order\&is\_licensemodel=subscription
* For more information about the supported arguments, refer to this[ article](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate).
* Click Ok
