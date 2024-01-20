# When is the LastAccessedDate field updated

Each QLM License record contains a field called LastAccessedDate (LAD).&#x20;

Despite its name, this field is not updated whenever a record is accessed. A more appropriate name for this field would have been LastModifiedDate. The  LAD is updated in the following cases:

* When the license is initially created.
* When the license is activated.
* When the license is released (deactivated).
* When the license is updated/upgraded.
* When the license is revoked.

As of QLM v15, any change to license information by editing a license in the QLM Management Console, in the QLM Portal or by calling the [UpdateLicenseInfo](../api-reference/qlmlicense/management-methods/updatelicenseinfo.md) API will update the LastAccessedDate. Additionally, extending the expiry date of a license automatically updates the Computer Key of the activated licenses and hence updates the LAD.

If you are interested in tracking when a customer last accessed your application, you should check out QLM Enterprise Analytics feature set.
