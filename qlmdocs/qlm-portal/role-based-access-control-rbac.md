# Role Based Access Control (RBAC)

The QLM Portal provides a web interface for managing license keys.

To access the portal, you need to create a user account. User Accounts are created from the QLM Management Console under Manage Keys / User Accounts. Your QLM Portal license entitles you to create a single-user account. If you would like to create additional accounts for internal use or for your affiliates, you need to purchase QLM Portal User Licenses from our website. Each User Account is associated with a User Group. User Groups determine what users can view, create, or modify via the QLM Portal. A User Account associated with the built-in User Group "None" can perform any action and view all data. This is equivalent to an Administrator account

You can configure the following restrictions for User Profiles:

#### Limits and Defaults

| **Setting**                                     | **Description**                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ----------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Maximum total keys**                          | Total number of keys, trial or permanent, that a user can create.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| **Maximum activations per key**                 | <p><em>This property is obsolete in QLM v8.</em></p><p>Maximum number of times a user can activate a given license key.</p>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| **Maximum number of trial keys per system**     | <p><em>This property is obsolete in QLM v8. It has been superseded by the Server Property NumberOfTrialLicensesAllowedPerClient</em></p><p>This property controls the maximum number of trial license keys that can be issued for a single system (ComputerID). For example, setting this value to 2 will ensure that a user cannot activate more than 2 trial keys on the same computer.</p><p>Setting this value to 0 will prevent a user from creating trial keys.</p><p>Note that since this setting is per system, it is only enforced when a license is activated, either by the end-user from the application or by the QLM Administrator via the QLM Management Console or QLM Portal.</p> |
| **Maximum number of permanent keys per system** | <p><em>This property is obsolete in QLM v8.</em></p><p>This property controls the maximum number of permanent license keys that can be issued for a single system (ComputerID). For example, setting this value to 2 will ensure that a user cannot activate more than 2 permanent keys on the same computer. </p><p>Setting this value to 0 will prevent a user from creating permanent keys.</p><p>Note that since this setting is per system, it is only enforced when a license is activated, either by the end-user from the application or by the QLM Administrator via the QLM Management Console or QLM Portal.</p>                                                                        |

&#x20;

#### Operations

You can configure which operations members of a user group can perform.&#x20;

| **Setting**              | **Description**                                                                                             |
| ------------------------ | ----------------------------------------------------------------------------------------------------------- |
| **Create Keys**          | Enable creating license keys                                                                                |
| **Activate Keys**        | Enables activating a license key                                                                            |
| **Release Keys**         | Enables releasing (deactivating) a license key                                                              |
| **Delete Keys**          | Enables deleting a key                                                                                      |
| **Revoke Keys**          | Enables revoking a key                                                                                      |
| **Edit Keys**            | Enables editing all editable information in a license key                                                   |
| **Create customers**     | Enables the creation of customers                                                                           |
| **Delete customers**     | Enables the deletion of customers                                                                           |
| **Export Keys**          | Enables exporting keys to many supported formats                                                            |
| **Set Expiry Duration**  | Enables setting the duration of a trial license                                                             |
| **Set Expiry Date**      | Enables setting the expiry date of a license                                                                |
| **Set Maintenance Plan** | Enables setting the Maintenance Plan period                                                                 |
| **Set Generic License**  | Enables the option to configure a license key as Generic                                                    |
| **View All Keys**        | Enables a user group to see all license keys, even ones generated by other users in a different user group. |

#### &#x20;Products

You can configure which products members of a user group can create license keys for.

#### Email Templates

&#x20;You can configure which email templates are available to members of a user group.

#### Searches

&#x20;You can configure which searches appear in the Portal for members of a user group.
