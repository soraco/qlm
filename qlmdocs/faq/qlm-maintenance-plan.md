# Maintenance Plan

#### Overview

QLM provides a complete framework for implementing a maintenance plan for your software.

A maintenance plan is typically associated with a perpetual license and allows customers who have an active maintenance plan to upgrade to newer versions of your application without the need to issue a new license key. The maintenance plan framework is also used for subscription licenses to allow active subscribers to upgrade to the latest version of your application.

When a customer activates a license key, the QLM License Server validates that the license key corresponds to the version that the customer is running. For example, if a customer is running version 6.0 of your software but has an Activation key for version 5.0, the QLM License Server will fail to activate the license.

However, if a customer purchases a maintenance plan for your software, the QLM License Server will allow activation of a recent version of your software with an activation key for a previous version. For example, if a customer is running version 6.0 of your software but has an Activation key for version 5.0, the QLM License Server will successfully activate the license if the maintenance plan is active and the **MaintenancePlanRenewal** date is greater than the **Release Date** of the new version of your product. The Release Date of your product can be defined on the Define Product page in the QLM Console.

The QLM database stores maintenance plan information in the MaintenanceRenewalDate field. If the maintenance plan is not enabled, this field will be empty. If the maintenance plan is enabled, the field will be set to the expiry date of the maintenance plan.

The MaintenanceRenewalDate can be set during the order process or manually via the QLM Management console.

#### Creating Versions in QLM

The first step in enabling the maintenance plan feature is to define a QLM version for each version of your product. Assuming that you already have a product defined for the first version of your product (say Product XYZ 1.0), you would then need to define the 2nd version of your product in QLM as follows:

* Launch the QLM Management Console
* Go to the Define Products tab
* Click New
* Select "Create a new version of an existing product"
* Locate the Product XYZ
* Click Ok
* Update your product information as needed.
* Make sure to update the Release Date of the new version.

**Note:**  If you just want to control which customer is entitled to upgrade to a **major** version of your product, you only need to create **major** versions of your product in QLM. You do not need to create **minor** version in QLM.

&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4415007282324/mceclip0.png)

#### To set the maintenance plan during the ordering process

To enable the maintenance plan during the ordering process, you can invoke the following URL:

http://yourserver/qlm/qlmservice.asmx/EnableMaintenancePlan?is\_vendor=\<vendor>\&is\_user=\<user>\&is\_pwd=\<pwd>\
where:

\<vendor> is the name of your vendor (see list of supported eCommerce providers)\
\<user> is a user to use for authentication (as defined in the Manage Keys / 3rd Party Extensions)\
\<pwd> is a password to use for authentication (as defined in Manage Keys / 3rd Party Extensions)\
The maintenance plan date is set to 365 days after the Order Date. You can control this setting from the web.config file of the QLM License Server.

&#x20;

#### To set the maintenance plan using the QLM Management Console

For a new activation key, click on Manage Keys / Licenses / Create and check the Maintenance Plan check box.d

For an existing activation key, click on Manage Keys / Licenses / Edit then specify a date for the Maintenance Plan.

#### Maintenance Plan Email Notification

To remind customers to renew the maintenance plan, you can schedule a task that will send your customers a reminder email prior to the expiry of the maintenance plan. For more details, check this [article](../email-framework/email-notifications/how-to-automatically-email-customers-when-the-subscription-is-about-to-expire-using-scheduled-tasks.md).

#### Place an order to renew a maintenance plan

When a maintenance plan expires, you can renew the maintenance plan from your eCommerce provider's ordering system by invoking the following URL:\
http://yourserver/qlm/qlmservice.asmx/RenewMaintenancePlan?\&is\_avkey=\<activationKey>\&is\_vendor=\<vendor>\
where:

\<activationKey> is the activation key of the customer\
\<vendor> is the name of your vendor (see list of supported eCommerce providers)
