# How does QLM protect against users requesting additional activations because a computer died

When a customer requests a license transfer from a dead computer to another computer, you must deactivate the license from the dead computer to allow the customer to activate the license on a new computer. The dead computer may not be really dead and you have no way of verifying the claim unless the computer is online.

When the "dead" computer goes online, QLM can detect this illegal computer and log relevant information in the database. An illegal computer is defined as a computer that has a valid Computer Key but whose Computer Key is not in the database.&#x20;

There are three ways to enable illegal computers detection in your application:

* The recommended approach as of QLM v11 is to enable the **QlmValidateLicenseOnServer** property in the Protect Your Application wizard and regenerate the XML settings file as well as the LicenseValidator class. You can also specify the maximum number of days a user can work offline by setting the **MaxOffline** property. Note that QlmValidateLicenseOnServer also detects licenses that have been revoked or deleted from the License Server. See the screenshot below.
* The QLM API (in QlmLicenseLib.dll) includes the following methods that you can call from your application:
  * [IsIllegalComputer](../api-reference/qlmlicense/application-methods/isillegalcomputer.md) to detect illegal computers.&#x20;
  * [IsLicenseKeyRevoked](../api-reference/qlmlicense/application-methods/islicensekeyrevoked.md) to detect if the license was revoked on the server
* If you simply want to report the status of a license, the QlmCustomerSite portal provides a web page that your application can connect to by invoking a URL. For example:&#x20;

{% code overflow="wrap" %}
```http
http://yourserver/QlmCustomerSite/qlmlicenseinfo.aspx/?is_avkey=AGGI0U0Q00NSSUYY8EH31U1TZ4&is_cpkey=UAJD0M0600PBIUU28NKH1A12JM&is_cpid=MYPC&is_cpname=MYPC&is_qlmversion=5.0.00
```
{% endcode %}

where:

* is\_avkey specifies the user's activation key
* is\_cpkey specifies the user's computer-bound key
* is\_cpid specifies the unique computer identifier
* is\_cpname specifies the computer name
* is\_qlmversion specifies the version of the QLM engine\
  \


When your application is launched, connect to the page above to display license information to your end user. In addition to providing licensing information to the user, this page will detect illegal computers and log them in the database. The QlmCustomerSite portal can be found in the DeployToServer folder. The deployment procedure for this portal is identical to the one for the QLM web service. If you have installed the QLM web service using the setup program qlmwebsvcsetup.exe, then the QlmCustomerSite is already deployed on your server.

To view illegal computers in the QLM Management Console, click on the Manage Keys tab then select the Illegal Computers button.

Note that QLM does not prevent users from running your application if an illegal computer is detected. Once you call the IsIllegalComputer function and determine that the computer is not authorized, you can take whatever action you deem appropriate in your application, such as exiting your application.

&#x20;

![](https://support.soraco.co/hc/article\_attachments/360020807251/mceclip0.png)
