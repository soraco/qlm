# How to redirect the QLM License Server using URL Rewrite

[URL Rewrite](https://www.iis.net/downloads/microsoft/url-rewrite) can be used to redirect a QLM License Server from one server to another.

You should start by installing URL Rewrite on the server where the source QLM License Server is located.

## Redirect the QLM License Server

* In IIS, locate the QLM License Server vitrual directory
* Select the virtual directory and click the URL Rewrite tool
* Click Add Rules
* Add a Blank Rule
* Give the rule a name such as: QLM License Server Redirect
* Set Requested URL to: Matches the Pattern
* Set Using to: Regular Expressions
* Set Pattern to: (.\*)
* Check "Ignore case"
* Add a new condition as follows:
  * Expand the Conditions section
  * Click Add
  * Set the Condition input to {PATH\_INFO}
  * Set the Check if input string: Matches the Pattern
  * Set the Pattern to: ^/xyz . Replace xyz as needed.
    * For example, if you are using the default QLM configuration where the files are installed in the qlm folder such as:
      * qlm/QlmLicenseServer
      * qlm/QlmCustomerSite
      * qlm/QlmPortal
    * You would set the Pattern to: ^/qlm
  * Check "Ignore case"
  * Click Ok
* Set the Action type to: Redirect
* In the Action Properties section:
  * Set the Redirect URL to: [http://yournewserver.com{C:0}/{R:0}](http://your/)
  * Check "Append query string"
  * Set the Redirect type to: Temporary (307)&#x20;
