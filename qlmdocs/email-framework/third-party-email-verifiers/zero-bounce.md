# Zero Bounce

To configure QLM to use Zero Bounce:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Set the following server properties:
  * customerSite/disposableEmailDetectorUrl : [https://api.zerobounce.net/v2/validate](https://api.zerobounce.net/v2/validate)
  * customerSite/disposableEmailDetectorApiKey: \<api key of your zero bounce account>
