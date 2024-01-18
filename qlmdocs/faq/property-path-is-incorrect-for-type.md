# Property path is incorrect for type

In the QLM Portal, you may get the following error:

**Property path \<FieldName> is incorrect for type 'QlmPortal.Database.qryLicenseInfo' because member 'QlmPortal.Database.qryLicenseInfo.\<FieldName>' does not exist.**

This error occurs when the current search uses a field name with the wrong character casing.

For example, if you create a search such as: affiliateid = 'reseller1', the error above will occur because the QLM Portal is case sensitive when it processes these searches.

To fix the error above, update the search to use the correct casing for the affiliate id field: AffiliateID= ' reseller1'.

To update the search:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Search / Edit Searches
* Locate the culprit search
* Update the SQL clause
* Click Ok
* Click Sites
* Click Upload your products to the license server
