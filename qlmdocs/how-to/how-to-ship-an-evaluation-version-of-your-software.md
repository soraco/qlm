# How to ship an evaluation version of your software?

This article applies to QLM Express users. For QLM Pro and Enterprise users, check this [article](how-to-generate-a-trial-key-for-your-application.md).

The recommended approach to provide an evaluation version of your software to your customers is the following:

* Start QLM, and click on Generate Keys
* Check the "Evaluation License" Radio button

\
Embed the generated license key above in your application (hard coded or as a configuration setting). If you are using the QLM LicenseValidator class, hard code the license key in the ValidateLicenseAtStartup function, right before calling ValidateLicense:

{% code overflow="wrap" %}
```csharp
if (String.IsNullOrEmpty(activationKey) && String.IsNullOrEmpty(computerKey))
{
    activationKey= "AAAAA-BBBB-CCCC-DDDD-EEEE"; // replace this with your own license key
}
```
{% endcode %}

Additionally, if you are using the QLM .NET control, set the QlmEvaluationLicenseKey property to the same license key as above.

When your application starts, validate the license key using the same API used to validate non-evaluation license keys (ValidateLicenseAtStartup). \
Note that for duration-based trials, the user's evaluation period starts after the first call to ValidateLicense.\
\
At any point during the evaluation period, or after, the user should be able to enter a permanent license key or an activation key. \
Once they do, you should use the new permanent key and validate it when your application starts.\
\
\
The benefits of this method are:\
\
\- Does not require activation of the evaluation license. \
\- You do not have to send a license key to the customer, the key is embedded in your application. This means that there is no management required on your side to issue evaluation keys.\
\- The trial period begins the first time the user runs your application.

&#x20;

If you wish to issue a trial license key to each customer and enforce activation for trial keys as well, then you should generate the license key from the Manage Keys tab  / Create.
