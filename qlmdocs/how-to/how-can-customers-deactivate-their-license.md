# How can customers deactivate their license?

If you would like to allow your customers to deactivate a license in order to activate it on another computer, QLM provides several solutions as described below.&#x20;

### 1. Online Computer

If the computer on which the license is currently activated is functional and online, a customer can deactivate a license in one of the following ways:

* Using the QLM License Wizard / Deactivate option.
* Using the QLM API as described [here.](https://support.soraco.co/hc/en-us/articles/203269960-How-to-clear-license-keys-from-an-end-user-system)

### 2. Offline Computer

If the computer on which the license is currently activated is functional but offline, a customer can deactivate a license in one of the following ways:

* Using the QLM License Wizard / Offline Deactivate option as described in the Offline Deactivation Code of [this article](https://support.soraco.co/hc/en-us/articles/200754044-How-does-offline-activation-work-).
* Using a combination of the QLM API [CreateDeactivationCode](https://support.soraco.co/hc/en-us/articles/360031442411-QlmLicense-CreateDeactivationCode) with the [QLM Self Help](https://support.soraco.co/hc/en-us/articles/218069643-How-to-configure-the-QLM-Self-Help-web-page) portal / Deactivate option.
* Using the [QLM Customer Portal](https://support.soraco.co/hc/en-us/articles/360046229232-QLM-Customer-Portal)

### 3. Damaged Computer

If the computer on which the license is currently activated is not functional, the customer cannot generate a deactivation verification code and use the QLM Self Help Portal to deactivate his license. Your options are:

* Remove the requirement for a deactivation verification code by setting the [Server Property](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties)  showDeactivationVerificationCode to false. This will allow the user to deactivate the license from the QLM Self Help portal even if the computer is no longer functional.
* Perform the deactivation on behalf of the customer from the QLM Management Console.

QLM also provides a mechanism for preventing users from cheating by claiming that their computer is dead. This mechanism is only effective when the "dead" computer goes back online. More information about this topic can be found [here](https://support.soraco.co/hc/en-us/articles/200270759-How-does-QLM-protect-against-users-requesting-additional-activations-because-a-computer-died-).
