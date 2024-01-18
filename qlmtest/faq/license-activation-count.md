# License Activation Count

QLM v16 or earlier

***

The Activation Count is a counter that is incremented every time a user activates a license, be it on the same computer or on a different computer. It does not reflect the number of systems on which a license has been activated.

An Activation Count greater than 1 does not necessarily indicate that the user has activated the license on more than one system. It typically means that the user clicked the Activate button multiple times from the same system.

The Activation Count is used when enforcing the [server properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties) maxActivationsPerSystem and maxActivationsEnforcedOnVMsOnly properties in order to prevent a user from circumventing the license enforcement by cloning virtual machines.

Note that in QLM v16, activation from the QLM License Wizard do not increment the Activation Count.

QLM v17

***

As of QLM v17, the Activation Count field will be used to track the number of running instances of your application when using cloud-based floating licenses.&#x20;

Activations from the QLM License Wizard can now be configured to increment the Activation Count. A new property called QlmIncrementActivationCount controls the behavior of the QLM License Wizard when a license is activated from within the wizard. The recommended setting is "NonCloudLicenses". This value increments the activation count when the license key is not a cloud-based floating license.

![](https://support.soraco.co/hc/article\_attachments/14226671835284)
