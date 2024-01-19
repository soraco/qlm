# How can customers deactivate their license?

If you would like to allow your customers to deactivate a license in order to activate it on another computer, QLM provides several solutions as described below.&#x20;

### 1. Online Computer

If the computer on which the license is currently activated is functional and online, a customer can deactivate a license in one of the following ways:

* Using the QLM License Wizard / Deactivate option.
* Using the QLM API as described [here.](how-to-clear-license-keys-from-an-end-user-system.md)

### 2. Offline Computer

If the computer on which the license is currently activated is functional but offline, a customer can deactivate a license in one of the following ways:

* Using the QLM License Wizard / Offline Deactivate option as described in the Offline Deactivation Code of [this article](how-does-offline-activation-work.md).
* Using a combination of the QLM API [CreateDeactivationCode](../api-reference/qlmlicense/client-side-methods/createdeactivationcode.md) with the [QLM Self Help](how-to-configure-the-qlm-self-help-web-page.md) portal / Deactivate option.
* Using the [QLM Customer Portal](../qlm-customer-portal/)

### 3. Damaged Computer

If the computer on which the license is currently activated is not functional, the customer cannot generate a deactivation verification code and use the QLM Self Help Portal to deactivate his license. Your options are:

* Remove the requirement for a deactivation verification code by setting the [Server Property](../qlm-license-server/server-properties.md)  showDeactivationVerificationCode to false. This will allow the user to deactivate the license from the QLM Self Help portal even if the computer is no longer functional.
* Perform the deactivation on behalf of the customer from the QLM Management Console.

QLM also provides a mechanism for preventing users from cheating by claiming that their computer is dead. This mechanism is only effective when the "dead" computer goes back online. More information about this topic can be found [here](../faq/how-does-qlm-protect-against-users-requesting-additional-activations-because-a-computer-died.md).
