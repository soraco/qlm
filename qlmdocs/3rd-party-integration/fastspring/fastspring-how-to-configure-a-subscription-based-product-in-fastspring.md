# FastSpring - How to configure a subscription based product in FastSpring?

To  configure a subscription-based product in FastSpring:

* Create a subscription-based product in FastSpring
* Add a FastSpring Fulfillment Action as follows:
  * Fulfillment Applicability: Applies to non-rebills / First Orders Only
  * Fulfillment Action: Generate license / Remote Server Request
  * URL:[https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)/GetActivationKeyWithExpiryDate?is\_vendor=fastspring\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_qlmversion=5.0.00\&is\_expduration=365
  * Method: HTTP Post
  * POST Encoding: UTF-8
  * Output Format: Single Line License
  * In the Advanced options of this fulfillment action, set:
* Add another FastSpring Fulfillment Action as follows:
  * Fulfillment Applicability: Applies to Rebills Only
  * Fulfillment Action: Generate license / Remote Server Request
  * URL: [https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://qlm3.net/qlmdemo/qlmLicenseServer/qlmservice.asmx)/RenewSubscriptionHttp?is\_vendor=fastspring\&is\_expduration=365
  * Method: HTTP Post
  * POST Encoding: UTF-8
  * Output Format: Single Line License
  * In the Advanced options of this fulfillment action, set:
