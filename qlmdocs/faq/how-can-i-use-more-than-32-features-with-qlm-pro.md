# How can I use more than 32 features with QLM Pro?

QLM Express and QLM Pro can embed up to 32 features in the license key.\
This allows you to enable specific features in your code based on the license key.

If you require more than 32 features, or if you require to associate any other data to your license, you can do so with QLM Pro with the UserData field or with QLM's [Product Properties](../fundamental-concepts/product-properties/) available with QLM v10+. This article focuses on the User Data approach.

The QLM Pro database contains a field called UserData that you can use to write any data relevant to your application, such as features.

The UserData field can be set using the UpdateLicenseInfo method. To retrieve the value in that field, call the GetUserData method.

&#x20;

**How do I integrate the UserData to the Activation process?**

First, the UserData field must be set. You have 3  options to set the UserData field:

1. If you are creating activation keys from the QLM Console, you can specify the UserData field when creating the Activation Key.
2. If you have integrated QLM with your eCommerce provider, the UserData can be set as an argument to the GetActivationKey URL (\&is\_userdata1)
3. You can use the UpdateLicenseInfo method available in QlmLicenseLib.dll

&#x20;

For example, let us assume we want to use the UserData to limit the number of records a user can create in a database. In this case, a flexible approach consists of setting the UserData to the following:

\<UserData> \<MaxRecords>100\</MaxRecords>\</UserData>

As described above, it is a good idea to use XML to store your UserData so that you can easily extend it in the future with additional fields as you see fit.

When the user activates his license, and upon successful activation, you retrieve the UserData via the GetUserData API. You can then store the UserData on the end user's system (ideally encrypted) and use it subsequently without connecting to the server.
