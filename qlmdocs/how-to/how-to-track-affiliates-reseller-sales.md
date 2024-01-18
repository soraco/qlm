# How to track Affiliates/Reseller sales

QLM Pro allows you to track sales made by Affiliates/Resellers or any custom grouping of your choice.

The first step in tracking sales is to define User Groups. A User Group can represent an affiliate, a reseller, a group of sales people within your organization or any other grouping of your choice.

**To add a User Group:**

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click User Groups.&#x20;
* Click Add and enter the name of your User Group in the User Group ID field.For example: Microsoft
* If you would like members of a user group to manage their own customers and license keys, you can define the privileges of each user group. User Groups can manage their own license keys through the [QLM Portal.](https://support.soraco.co/hc/en-us/articles/204440894-What-is-the-QLM-Portal-)
* Click Ok

Now that the User Group is defined, you can associate a customer and/or a license key to the User Group.

**To associate a customer to an User Group from the QLM Management Console**

* Launch the QLM Management Console
* Go to the Manage Customers tab
* Click Add to add a new customer or edit an existing customer
* Set the User Group drop down to: Microsoft
* Click Ok

**To associate a license to a User Group from the QLM Management Console**

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Add to add a new license or edit an existing license
* Set the User Group drop down to: Microsoft
* Click Ok

**To associate a license to a User Group from an eCommerce Provider**

* When invoking [GetActivationKey](https://support.soraco.co/hc/en-us/articles/207606673-GetActivationKey) or [GetActivationKeyWithExpiryDate](https://support.soraco.co/hc/en-us/articles/207606653-GetActivationKeyWithExpiryDate) from an eCommerce provider, you can associate the license to a User Group by setting the is\_affiliateid argument to the name of the affiliate.

**To view all licenses associated to a User Group:**

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click the **search** dropdown button and select **Edit Searches**
* Click **Add**
* Set the Name field to: Microsoft
* In the SQL field, enter: AffiliateID='Microsoft'
* Click Ok
* In the right hand panel where the searches are listed, locate your new search and click it.
