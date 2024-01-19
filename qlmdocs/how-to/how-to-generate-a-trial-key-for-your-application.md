# How to generate a trial key for your application

There are several approaches to issuing a trial key for your application. The first decision you need to make is whether you want the trial keys to require activation (Method 1) or not (Method 2).

**Method 1 (recommended)**

If you want to track every potential customer that downloads your application, you need to generate an Activation Key for each potential customer. There are several ways to generate trial activation keys:

* Directly from your website by integrating to your website our ready-made [license registration form](how-to-generate-a-trial-key-for-your-application.md). You can see a sample of the QLM Trial License Registration Web Form [here](https://soraco.co/quick-license-manager/qlm-screenshots/). This is the recommended approach.
* From the [QLM License Wizard](creating-trial-keys-from-the-qlm-license-wizard.md).
* From your application, using the [CreateComputerBoundTrialKey](../api-reference/qlmlicense/application-methods/createcomputerboundtrialkey.md)
* Manually, from the QLM Management Console / Manage Keys / Create or from the QLM Portal.
* By using our [MailChimp integration](../3rd-party-integration/mailchimp-quick-license-manager-integration-with-mailchimp.md).

**Method 2:**

A trial key that does not require activation can be used by all your customers. You do not need to issue a new key for each customer. For more details about this approach, check this [article](../faq/how-to-ship-an-evaluation-version-of-your-software.md).
