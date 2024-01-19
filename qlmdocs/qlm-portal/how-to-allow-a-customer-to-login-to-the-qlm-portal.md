# How to allow a customer to login to the QLM Portal

As of QLM v12.0.19071.2, you can allow customers to login to the QLM Portal to view and manage keys associated to their account. Note that you do not require a QLM Portal User License to allow customers login. You simply require a QLM Portal license.

As this feature is currently experimental, it is turned off by default. To enable this feature, you must update the QLM Portal's web.config file by setting the enableCustomerLogin property to true.

## Create a user account

For each customer that you would like to provide access to the QLM Portal, you must create a user account as follows:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* In the Portal ribbon, click User Account
* Click Add and enter the required information about the user
* Click Ok
* Set the User Type to "Customer"
* Click Ok

## Make the user a primary or secondary Organization Contact

In order for a user to be able to login to the Portal and manage license keys, the user must be the primary or secondary contact of his organization.&#x20;

You must first add the customer to the Customers tabe as follows:

* Launch the QLM Management Console
* Go to the Manage Customers tab (you can also do this from the QLM Portal)
* Click Add to add the customer
* Enter the customer's information. Note that the email of the customer must match the email specified when creating the user account in the previous step.
* Associate the customer to an Organization
* Click Ok

You must then configure this customer as the primary / secondary contact of the organization as follows:

* Launch the QLM Management Console
* Go to the Manage Customers tab (you can also do this from the QLM Portal)
* Click Organizations
* Select the customer's organization
* Set this specifc customer as a Primary or Secondary contact

The user created in step 1 should now be able to login to the QLM Portal.

When a customer logs in to the Portal, the user can only view license keys associated to his/her organization. Additionally, the following features are automatically disabled when a customer logs in:

* Creation of keys
* Deletion of keys
* Revocation of keys
* Editing of keys
* Renewing a subscription
* Viewing all keys
