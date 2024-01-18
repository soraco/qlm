# Which organizations are displayed in the QLM Portal?

The QLM Portal displays organizations based on the permissions of the logged in user.

If the logged in user is an Administrator (belongs to the User Group _None_), then all organizations are displayed.

If the logged in user is not an Administrator but the User Group permission "CanSeeAllOrganizations" is set to true, then all organizations are displayed.

If the logged in user is not an Administrator and the User Group permission "CanSeeAllOrganizations" is set to false (default), then organizations are displayed if the following criteria are met:

* The Organization belongs to the same User Group as the logged in user.
* The Organization does not have an assigned User Group.

Note that if the logged in user is of type "Customer", only the organization of the logged in user is displayed.
