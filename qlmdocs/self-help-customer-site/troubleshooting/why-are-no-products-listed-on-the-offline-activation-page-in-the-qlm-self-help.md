# Why are no products listed on the offline activation page in the QLM Self Help?

#### Common Reasons

There are many reasons why your products might not be listed in the QLM Offline Activation web page (QlmWebActivation.aspx). Below are a few of the most common reasons:

* For each product that you define, you must specify whether the product should be displayed on the Offline Activation web page. To do so:
  * Go to the "Define Products" tab in the QLM Management Console
  * Select your product
  * Go to the Advanced tab
  * Check the option "Include On Customer Site"
* The web.config file of the QlmCustomerSite might be misconfigured. The typical settings in the web.config file that could cause this issue are:
  * communicationEncryptionKey and adminEncryptionKey
  * webServiceUrl
  * connectionStrings

#### Troubleshooting

To troubleshoot this issue, we recommend the following steps:

* Set the customerSiteLoggingLevel to 15 as follows:
  * Go to the Manage Keys tab in the QLM Management Console
  * Click Sites
  * Go to the Server Properties tab
  * Locate the property customerSite/customerSiteLoggingLevel and set it to 15.
* Reproduce the issue&#x20;
* Get the QLM event log from the QLM Management Console / Manage Keys tab / Event Log
* Review the logs for clues or email them to our support team.

If none of the above helps and if you are not running the latest version of QLM, we recommend that you upgrade to the latest version and verify that the issue still occurs in the latest version.
