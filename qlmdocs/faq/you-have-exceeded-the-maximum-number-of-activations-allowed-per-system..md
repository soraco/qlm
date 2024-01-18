# You have exceeded the maximum number of activations allowed per system.

QLM can limit the number of activations on a given system. This is enforced with the following [Server Properties](https://support.soraco.co/hc/en-us/articles/207920563-Server-Properties):

* maxActivationsPerSystem
* maxActivationsEnforcedOnVMsOnly

The message "You have exceeded the maximum number of activations allowed per system" indicates that the limit configured in maxActivationsPerSystem was reached.

Once maxActivationsPerSystem  has been reached, you have 2 options to allow a specific client to activate:

1. Increase the value of the server property **maxActivationsPerSystem**. Note that this is a global setting that affects all customers.
2. Decrease the **ActivationCount** of the specific customer.

#### How to decrease the Activation Count

**Single Activation Licenses**

For single-activation licenses (Number of Licenses = 1), the Activation Count can be decreased as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Locate and select the license that needs to be updated
* Click Edit
* Decrement the Activation Count field
* Click Ok

**Multiple Activation Licenses**

For multiple-activation licenses (Number of Licenses > 1), the Activation Count can be decreased as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Locate and select the license that needs to be updated
* Click the + button to expand the license and view all activated licenses
* Locate and select the computer that needs to be updated
* Click Edit
* Decrement the Activation Count field
* Click Ok
