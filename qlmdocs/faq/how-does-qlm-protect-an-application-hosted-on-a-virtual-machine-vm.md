# How does QLM protect an application hosted on a Virtual Machine (VM)?

There are two cases to consider when your application is hosted on a virtual machine.&#x20;

### Trial Licenses

When you generate a trial license, you can either generate a license key that expires after a given duration or a key that expires on a given date.&#x20;

If a key expires on a specific date, the key will expire on a given date on any VM, even if it is cloned. This case is therefore properly handled.

If a key expires after a given duration, QLM records on the server the first time the license was activated and stores the expiry date of the license on the server in the SubscriptionExpiryDate field (you must enable the useDurationToSetExpiryDateWhenActivation property).

If the same key is reused from another cloned VM with the intent of starting over the trial, QLM will use the SubscriptionExpiryDate property on the server during the activation process and will issue a key based on that value.

Alternatively, you may want to prevent users from installing a trial on a VM. You can use the QlmHardware.RunningOnVM to detect if your application is running on a VM. If it is and the key is a trial key, you can exit your application.

### Permanent Licenses

For permanent licenses, you can limit the number of times a license can be activated on a given system. Note that this applies to trial/subscription licenses as well.

Whenever a license is activated on a given system, the ActivationCount value is increment by one. To limit the number of times a license can be activated on a given system, you set a Server Property called maxActivationPerSystem to the value of your choice.

For example, if you set the maxActivationPerSystem to 1 and the user tries to activate the same license on a cloned VM, the 2nd activation will fail.

You can select to enforce this property on VMs only. To do so, set the Server Property maxActivationsEnforcedOnVMsOnly to true.

In some cases, you may want to allow the user, on a case by case, to re-activate the license on the same system. To do so, you simply decrement the ActivationCount value by one.

To decrement the Activation Count, locate the license in the QLM Management Console, click Edit and update the value of the ActivationCount.

#### License Binding

Selecting the proper license binding is essential for protecting your application on a virtual machine. Many of the traditional unique computer identifiers are not well suited for virtual machines. For example, a hard disk serial number could remain the same when a virtual machine is cloned.

QLM includes 2 [license bindings](../api-reference/qlmlicense/enums/elicensebinding.md) that are well suited for virtual machines:

* SystemManagementBiosUuid: unique identifier of a virtual machine (UUID)
* QlmUniqueSystemIdentifier1: QLM smart identifier (available as of QLM v11.1). This new license binding type automatically detects if the client system is a virtual machine and uses the UUID as a hardware identifier.

#### Server-Side Validation

Finally, it is recommended to enable server-side validation of the license. When you enable server-side validation, every time your application starts up, it connects to the license server and performs server-side validation of the license.&#x20;
