# Shareit - How to integrate QLM with Shareit

If you are using ShareIt as an e-commerce provider, QLM can be used to issue license keys and save the order and customer information when a customer purchases your product using ShareIt's ordering system.   To have ShareIt invoke QLM at the time of purchase, do the following:

* Setup the QLM License Server on your server
* Optionally, configure authentication to connect to ShareIt. To configure authentication, click on Manage Keys / Tools / eCommerce Providers and specify the credentials for ShareIt.
* Create or edit your product in ShareIt's Control Panel
* Ask ShareIt personnel to set your product's **Key Generator URL** to the following URL:

> **http://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKey?\&is\_vendor=**ShareIt**\&is\_productid=**\<productid>**\&is\_majorversion=**\<majorversion>**\&is\_minorversion=**\<minorversion>**\&is\_qlmversion=**\<qlmversion>**\&is\_pwd=**\<pwd>**\&is\_user=**\<username>**\&is\_features=**\<features>
>
> Where:
>
> * is\_vendor = ShareIt
> * is\_productid = your product id as defined in QLM
> * is\_majorversion = your product's major version as defined in QLM
> * is minorversion = your product's minor version as defined in QLM
> * is\_qlmversion = 5.0.00
> * is\_features = semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:3;1:1. This means that in feature set 0, features 1 + 2 are enabled and in feature set 1, feature 1 is enabled.
> * is\_user = username defined in the QlmProviders.xml (optional)
> * is\_pwd = password defined in the QlmProviders.xml (optional)

&#x20;With the steps above completed, place a test order. When the order is placed, the following will occur:

* A new user will be automatically added to the QLM database based on the information collected during the ordering process.
* An activation key will be created in the QLM database and associated to the user.
* An email will be sent to the customer with the activation key.
