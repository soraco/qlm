# Protect calls to GetActivationKey

The [GetActivationKey ](../api-reference/qlmlicense/application-methods/getactivationkeyfromlegacykey.md)HTTP method is typically called from your server or eCommerce provider. This function should never be called from your application.

It is recommended to password-protect this call and enforce the use of SSL when calling GetActivationKey.

To protect calls to GetActivationKey:

1. Launch the QLM Console
2. Go to the Manage Keys tab
3. Click on 3rd Party Extensions (previously called eCommerce Providers)
4. For each eCommerce Provider, set the same user/password combination
5. Modify all your calls to GetActivationKey and pass the user/pwd as follows: \&is\_user=myuser\&is\_pwd=mypassword
