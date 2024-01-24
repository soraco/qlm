# License Activation Count

QLM v17

***

As of QLM v17, the Activation Count field is used to track the number of running instances of your application when using cloud floating licenses.&#x20;

When a user starts the application and checks out a floating license, the license is activated on the device and the activation count is incremented (ActivationCount = 1). If the user starts another instance of the application, the ActivationCount is incremented again (ActivationCount=2). When the user exits the first instance of the application, the ActivationCount is decremented (ActivationCount=1). When the user exits the second instance of the application, the ActivationCount is decremented (ActivationCount=0). When the ActivationCount reaches 0, the license is deactivated from the server and can then be consumed by another user.

If an application crashes before the license is checked in, the Activation Count is not decremented which results in an "orphaned" license. To address this use case, you should call the [ProcessOrphanedInstances ](../api-reference/iqlmcloudfloatinglicensehelper/methods/processorphanedinstances.md)API from within your application to synchronize the number of running instances of your application with the value of the ActivationCount stored on the server.

Activations from the QLM License Wizard can now be configured to increment the Activation Count. A new property called QlmIncrementActivationCount controls the behavior of the QLM License Wizard when a license is activated from within the wizard. The recommended setting is "NonCloudLicenses". This value increments the activation count when the license key is not a cloud-based floating license.

![](https://support.soraco.co/hc/article\_attachments/14226671835284)

QLM v16 or earlier

***

The Activation Count is a counter that is incremented every time a user activates a license, be it on the same computer or on a different computer. It does not reflect the number of systems on which a license has been activated.

An Activation Count greater than 1 does not necessarily indicate that the user has activated the license on more than one system. It typically means that the user clicked the Activate button multiple times from the same system.

The Activation Count is used when enforcing the [server properties](../qlm-license-server/server-properties.md) maxActivationsPerSystem and maxActivationsEnforcedOnVMsOnly properties in order to prevent a user from circumventing the license enforcement by cloning virtual machines.

Note that in QLM v16, activation from the QLM License Wizard do not increment the Activation Count.
