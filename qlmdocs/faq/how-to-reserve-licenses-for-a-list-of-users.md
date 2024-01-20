# How to reserve licenses for a list of users

A customer that has purchased multiple node-locked seats of your application may want to reserve some licenses for specific users.

To reserve licenses for specific users in an organization, an administrator (your customer's administrator) must pre-activate licenses for these users. To pre-activate licenses for specific users, the administrator must:

* Determine the Computer ID of each user, depending on the selected licensing binding method.
* Activate the license for that Computer ID

For example, assuming that you have configured the [QlmLicense.LicenseBinding](../api-reference/qlmlicense/enums/elicensebinding.md) to ComputerName, the administrator would need to:

* Get the Computer Name of each system.
* Activate the license for that computer either from the [QlmCustomerSite (QLM Self Help)](../qlm-license-server/qlmcustomersite-qlm-self-help.md) or from the [QLM Customer Portal.](../qlm-customer-portal/)

Once licenses are assigned, the Administrator could re-assign these licenses by deactivating a license for a specific user and activating it for another. Deactivating a license can be performed from the [QlmCustomerSite (QLM Self Help)](../qlm-license-server/qlmcustomersite-qlm-self-help.md) or from the [QLM Customer Portal](../qlm-customer-portal/)

When allowing deactivations from the QLM Self Help or the QLM Customer Portal, it is recommended that you implement:

* [Server-side license validation](server-side-license-validation.md)
* Require a connection to the server by setting the [MaxDaysOffline property.](maxdaysoffline.md)

This will ensure that a deactivated computer is not able to run your application once its license has been reassigned.
