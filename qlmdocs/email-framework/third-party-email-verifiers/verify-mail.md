# Verify Mail

To configure QLM to use Verify Mail:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Set the following server properties:
  * customerSite/disposableEmailDetectorUrl : [https://verifymail.io/api](https://verifymail.io/api)
  * customerSite/disposableEmailDetectorApiKey: \<api key of your zero bounce account>
