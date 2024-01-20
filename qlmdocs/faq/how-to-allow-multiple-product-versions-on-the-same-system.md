# How to allow multiple product versions on the same system

By default, if a user upgrades to a new version of your application on the same computer where the previous version was installed, and if the user has an active maintenance plan, QLM will automatically reactivate the license and store the license information (same activation key and a new computer key) in the same location as the previous version, thus overwriting it.

\
If you need to allow a customer to install different versions of your product on the same system and activate each separately, you must do the following:

* When creating the new product version in the QLM Management Console / Define Products, do not check the "Use the same GUID as the base product". This will ensure that license information of the new version is stored in a different location than the previous version (see screenshot 1 below)
* Set the [Server Property](../qlm-license-server/server-properties.md) allowMultipleProductVersionsOnSameSystem to true (see screenshot 2 below)

&#x20;

Note that the dawback of this approach is that any time a user upgrades versions, the user will need to re-enter this Activation Key and activate his/her license.

![](https://support.soraco.co/hc/article\_attachments/360019644012/mceclip1.png)

![](https://support.soraco.co/hc/article\_attachments/360019644192/mceclip2.png)
