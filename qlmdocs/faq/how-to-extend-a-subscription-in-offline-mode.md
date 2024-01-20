# How to extend a subscription in offline mode

This article covers extending a subscription when the user does not have internet access (offline mode).

For more details about how to implement subscription licensing with QLM, check [this article.](how-to-implement-software-subscription.md)

To extend a subscription offline:

* In the QLM Management Console, go to the Manage Keys tab
* Locate the license you would like to extend and select it&#x20;
* Click the **Renew Subscription** button&#x20;
* Enter a new date for the subscription and click Ok
* In the data grid, locate the **ComputerKey** column and copy its contents
* Email the customer their new ComputerKey

At the customer end, the following procedure must be followed:

* In the QLM License Wizard or the QLM .NET Control, the user must:
  * Enter the **Activation Key** in the _Activation Key_ field
  * Click the _Manual Activation_ radio button
  * Enter the **Computer Key** in the _Computer key_ field
  * Click _Activate_
