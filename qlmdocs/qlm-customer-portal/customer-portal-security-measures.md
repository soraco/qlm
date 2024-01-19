# QLM Customer Portal Security Measures

The QLM Customer Portal allows your customers to manage their users and license keys. It relies on customer email addresses and organization membership to determine which license key is visible to a user.

It is therefore critical that your organization and the association of a user to an organization are properly configured before you enable the QLM Customer Portal.

This is especially critical for customers with non-corporate email addresses such as gmail.com, outlook.com, hotmail.com, etc..

Here are some key elements to verify before enabling the QLM Customer Portal:

* For each organization in your system:
  * Verify that the **Domains** field does not contain a non-corporate email address.
  * Verify that the Primary and Secondary contacts are associated with the organization.
* For each customer in your system:
  * Verify that the organization associated with the customer, if any, is correct.
