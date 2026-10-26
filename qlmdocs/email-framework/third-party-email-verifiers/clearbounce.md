---
description: Available as of QLM 20.0.26299.1
---

# Clearbounce

To configure QLM to use Verify Mail:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your site
* Go to the Server Properties tab
* Set the following server properties:
  * customerSite/disposableEmailDetectorUrl : [https://api.clearbounce.net/api/v1/verify](https://api.clearbounce.net/api/v1/verify)
  * customerSite/disposableEmailDetectorApiKey: \<api key of your clearbounce account>
