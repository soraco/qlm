# How does offline activation work?

If you are using QLM Pro or Enterprise, your customers are typically activating their license online.

However, some customers may not have internet access. For these customers, you can perform a manual activation of their license.

There are 4 ways to perform offline activation:

* Manually from the QLM Management Console
* Manually from the QLM Portal
* Automatically from the QLM Self Help page (QLM v9+)
* Automatically from the QLM License Wizard / QR Code Scan (QLM v10)

### QLM Management Console

To perform a manual activation from the QLM Management Console, follows the steps below:

* &#x20;Request from your customer the unique computer identifier that you are using for binding license keys. If you are using the QLM License Wizard, the computer identifier will be displayed in the Offline Activation step.
* Start the QLM Application, go to the Manage Keys tab and locate the customer’s license.
* Select their license and click on the Activate button.
* In the Activation dialog, set the **Computer Identifier** field to the Computer ID that your customer sent you.
* Optionally, set the **Computer Name** and other fields on this dialog.
* Click Ok and record the generated **Computer Key**.
* Send your customer the **Computer Key**
* In the QLM License Wizard or the QLM .NET Control, the user must:
  * Enter the **Activation Key** in the _Activation Key_ field
  * If you are using the QLM Activation Control, click the _Manual Activation_ radio button
  * If you are using the QLM Wizard control, select "Activate my license offline"&#x20;
  * Enter the **Computer Key** in the _Computer key_ field
  * Click _Activate_

### QLM Portal

To perform a manual activation from the QLM Portal follows the steps below:

* Request from your customer the unique computer identifier that you are using for binding license keys.
* Login to the QLM Portal and locate the customer’s license.
* Select their license and click on the Activate button.
* In the Activation dialog, set the **Computer ID** field to the Computer ID that your customer sent you.
* Optionally, set the **Computer Name** and other fields on this dialog.
* Click Ok&#x20;
* An Information dialog displays the generated **Computer Key**
* Using your mouse, select the **Computer Key** and copy it to the clipboard
* Send your customer the **Computer Key**
* In the QLM License Wizard or the QLM .NET Control, the user must:
  * Enter the **Activation Key** in the _Activation Key_ field
  * Click the _Manual Activation_ radio button
  * Enter the **Computer Key** in the _Computer key_ field
  * Click _Activate_

### QLM Self Help

The QLM Self Help page allows your customer to access a page on your web site and perform an offline activation without contacting you. For more details, check out the [QLM Self Help documentation](how-to-configure-the-qlm-self-help-web-page.md) or the [QlmCustomerSite documentation.](../qlm-license-server/qlmcustomersite-qlm-self-help.md)

### QLM License Wizard

In QLM v10, the License Wizard Offline Activation option allows the user to perform an Offline Activation by scanning a QR code from a mobile device that is connected to the internet. When the QR code is scanned, the Computer Key is displayed on the mobile device. The user must then enter this key in the QLM License Wizard.

### Offline Deactivation Code

As of QLM 12.0.19096.1, the QLM License Wizard can generate a Deactivation Verification Code (DVC) when the user deactivates a license **offline**. The DVC allows you to ensure that the customer has indeed deactivated the license. Additionally, once a ComputerKey has been deactivated, it can no longer be used.&#x20;

The DVC can be used in 3 different contexts:

* When deactivating a key from the QLM Management Console / Manage Keys / Deactivate
* When deactivating a key from the QLM Portal / Release
* When deactivating a key from the QLM Self Help. To enable the DVC in the QLM Self Help, you must set the [Server Property](../qlm-license-server/server-properties.md) customerSite/showDeactivationVerificationCode to true.
