# Deactivation Verification Code for Offline Deactivation

### Overview

When a client computer is online, an end user can deactivate a license from the QLM License Wizard or via the QLM API. Since the user is online, the deactivation process is able to communicate with the license server and validate that the customer did indeed deactivate the license on the client side.

On the other hand, when a client computer is offline, since we cannot communicate with the License Server, we are not able to validate that the customer did indeed deactivate the license on the client side.

### Deactivation Verification Code

The Deactivation Verification Code (DVC) resolves this issue by generating a unique code when a customer deactivates a license and requesting that code during the offline deactivation procedure. The workflow for offline deactivation with a DVC goes like this:

* An end-user clicks the Deactivate license button in the QLM License Wizard (or your application calls the corresponding QLM API).
* The QLM License Wizard detects that the computer is offline and offers to perform a deactivation via a QR Code.
* If the user selects the QR Code option, deactivation is completed by scanning the QR code with a smartphone.
* If the user rejects the QR Code option, a Deactivation Verification window is displayed with a Verification Code. The customer then needs to access the QLM Self Help page to deactivate the license.

Note that the QLM's Deactivation Verification Code feature is optional. You can enable it by setting the [Server Property](https://support.soraco.co/hc/en-us/articles/207920563) customerSite/showDeactivationVerificationCode to true. If you disable the DVC, customers can deactivate a license without the DVC.&#x20;

The DVC can be used in 3 different contexts:

* When deactivating a key from the QLM Management Console / Manage Keys / Deactivate
* When deactivating a key from the QLM Portal / Release
* When deactivating a key from the QLM Self Help. To enable the DVC in the QLM Self Help, you must set the [Server Property](https://support.soraco.co/hc/en-us/articles/207920563) customerSite/showDeactivationVerificationCode to true.

### Workflow Screenshots

&#x20;1\. When the wizard detects an offline computer, it prompts the user to deactivate with a QR Code via a smartphone.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4402242707860/mceclip0.png)

2\. A QR Code is then displayed. The user must scan the QR Code with a smartphone.

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/4402235045268/mceclip3.png)

3\. If the user scans the QR code with a smartphone, the deactivation is performed by the smartphone and the process is completed.

![mceclip5.png](https://support.soraco.co/hc/article\_attachments/4402242711700/mceclip5.png)

&#x20;4\. If the user elects to not use the QR Code, a verification code is created and displayed. T

![mceclip6.png](https://support.soraco.co/hc/article\_attachments/4402235047444/mceclip6.png)

5\. The user can then perform an offline deactivation from the QLM Self Help by providing the DVC.

![mceclip8.png](https://support.soraco.co/hc/article\_attachments/4402242773524/mceclip8.png)
