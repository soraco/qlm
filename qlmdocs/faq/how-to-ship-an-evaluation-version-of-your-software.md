# How to ship an evaluation version of your software

There are 2 general approaches when issuing trial license keys to your customers. The first and recommended approach is to issue a different trial key for each customer. This enables you to track the customer and automate follow-ups with each customer that downloads your trial. For more details about this approach, check out this [article](../how-to/how-to-generate-a-trial-key-for-your-application.md).

&#x20;The alternative approach is to embed a trial key that does not require activation in your application. The same trial key would be used by all customers. The steps below describe how to create the trial key and embed it in your application.

&#x20;

**QLM v7 and older**

* Start QLM, and click on Generate Keys
* Check the "Evaluation License" Radio button
* Check the " Expires x days after installation"
* Click on the Generate Key button

**QLM v8+**

* Start QLM and go to Manage Keys
* Click Create Trial Key
* Check the "Evaluation License" Radio button
* Check the " Expires x days after installation"
* Click on the Generate Key button

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/11970772566804)

Embed the generated license key above in your application (hard coded or as a configuration setting). To embed a trial key in your application:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* &#x20;Click Next until you get to "Customize the Look & Feel..."
* In the QLM License Properties section, set the **QlmEvaluationLicenseKey** property to the trial key you created above.
* Complete the wizard and regenerate the XML file as well as the LicenseValidator class file.

Additionally, if you are using the QLM .NET control or QLM License Wizard, set the QlmEvaluationLicenseKey property to the same license key as above.

When your application starts, validate the license key using the same API used to validate non-evaluation license keys (ValidateLicenseAtStartup). \
Note that for duration-based trials, the user's evaluation period starts after the first call to ValidateLicense.\
\
At any point during the evaluation period, or after, the user should be able to enter a permanent license key or an activation key. Once they do, you should use the new permanent key and validate it when your application starts.\
\
The benefits of this method are:

* Does not require activation of the evaluation license.
* You do not have to send a license key to the customer, the key is embedded in your application.
* This means that there is no management required on your side to issue evaluation keys.
* The trial period begins the first time the user runs your application.

The drawbacks of this method are:

* You cannot track who is evaluating your product.
* It is less secure than using activation keys.
* You cannot revoke the license.
* You cannot extend the license expiry date without sending a new key.
