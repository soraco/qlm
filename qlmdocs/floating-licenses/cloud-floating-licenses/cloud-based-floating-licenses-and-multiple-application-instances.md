# Cloud-based floating licenses and multiple application instances

When implementing cloud-based floating licenses, it's important to consider the case where you allow multiple instances of your application to run on the same device.

If you bind the license to a non-instanced unique identifier, such as a Computer Name, a user could do the following:

* Start instance 1 of your app - this will check out 1 license.
* Start instance 2 of your app - this will not check out an additional license.
* Exit instance 1 of your app - this will check in the license.
* At this point, the customer has instance 2 running without a license.

To prevent this abuse, we recommend one of the following:&#x20;

* Use a computer identifier that is instance-based. We suggest using a combination of a traditional computer identifier such as a Computer Name suffixed with a Process ID. For more details about using a user-defined computer identifier, refer to this [article](../../faq/how-to-bind-a-license-to-your-own-unique-identifier.md). Note that this approach will result in each instance consuming a floating seat.
* Use the QLM Activation Count feature that keeps track of running instances and checks in a license only when all instances have been closed. This approach is implemented in the sample located in the following folder: %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense.&#x20;

When you check out a floating license multiple times from the same computer, QLM increments an activation count that keeps track of the number of running instances.\
&#x20;\
When a license is checked in, QLM decrements the activation count until it reaches 0. When it reaches 0, QLM deactivates the license from the server so that it can be activated on another computer.

Activation Count value for single activation Keys:

![](https://support.soraco.co/attachments/token/mBWSgxfHlThiurNUMefRRJc6T/?name=image.png)

Activation Count value for multiple activations keys:

![](https://support.soraco.co/attachments/token/Ew5rATvcPnVaQ4hvTNWFr9xOT/?name=image.png)

API to use the Activation Count feature:

![](https://support.soraco.co/attachments/token/oE0r2fVjO9IO0plHFcoFV2Zlz/?name=image.png)
