# How to limit the activation of a node to a time period

This article discusses a very specific use-case requested by a customer. It is not a common scenario and should only be used in the context of the specific requirements outlined below. The approach described here is not the typical way QLM handles expiry dates and floating licenses.

This article was published merely to illustrate the extent of the QLM API.

### Requirements

A customer purchases _n_ licenses of your product. You want to allow the customer to install as many copies of your product as needed on his systems. In order to run your application, **user A** needs to activate a license. Once activated, 1 / _n_ licenses is consumed. The license that is allocated to **user A** is allocated for a specific period of time, say 1 week.  After 1 week, **user A** is no longer able to use your application without requesting an extension. If no extension is requested, the license is then available for **user B** to consume.

If **user A** requests an extension, **user A** can continue using your application for another period of time.

### Implementation

The implementation of this model relies on the usage of the **UserData** field that is associated to each license in the QLM database.

When implementing this solution, you need to consider 2 types of licenses. Single activation license keys and multiple activation license keys. This is required because QLM stores information about licenses differently for single activation keys v/s multiple activation keys. To determine if a license is a multiple activation key, you need to check the value of [QlmLicense.NumberOfLicenses](https://support.soraco.co/hc/en-us/articles/207611683-QlmLicense-NumberOfLicenses). If the value is 1, the license is a single activation license. If the value is greater than 1, the license is a multiple activation license. Note that you must call QlmLicense.ValidateLicense with the activation key before calling [QlmLicense.NumberOfLicenses](https://support.soraco.co/hc/en-us/articles/207611683-QlmLicense-NumberOfLicenses).

#### Single Activation License Keys

* Whenever a license is activated, the application will write the following information to the QLM UserData field by calling [SetUserData](https://support.soraco.co/hc/en-us/articles/207609833-QlmLicense-SetUserData). Note that if you are using the UserData field for other purposes, you should always call [GetUserData ](https://support.soraco.co/hc/en-us/articles/207609893-QlmLicense-GetUserData)first  and then update it as needed.

```
<userdata>
<expiry_date>2020-02-28</expiry_date>
</userdata>
```

&#x20;

* Additionally, the application will write the expiry date to the end user system by calling [StoreCookie.](https://support.soraco.co/hc/en-us/articles/115002736646-QlmLicense-StoreCookie)
* Every time the application starts up, the application will call [ReadCookie](https://support.soraco.co/hc/en-us/articles/115002709343-QlmLicense-ReadCookie) to retrieve the expiry date of the license. If the license has expired, the application will exit.
* If a user tries to activate a license and it fails because no more licenses are available, it will attempt to deactivate the previous license if it has expired. To do so, the application will:
  * Call [GetUserData](https://support.soraco.co/hc/en-us/articles/207609893-QlmLicense-GetUserData) to retrieve the expiry date
  * Determine if the license has expired.
  * If it has, call [SetUserData ](https://support.soraco.co/hc/en-us/articles/207609833-QlmLicense-SetUserData)to clear the expiry date.
  * Call [ReleaseLicense](https://support.soraco.co/hc/en-us/articles/207609843-QlmLicense-ReleaseLicense) (url, activationKey, computerID, ...) to deactivate the previous node.

To request an extension to a license, you would:

* Call [SetUserData ](https://support.soraco.co/hc/en-us/articles/207609833-QlmLicense-SetUserData)with a new expiry date
* Call [StoreCookie](https://support.soraco.co/hc/en-us/articles/115002736646-QlmLicense-StoreCookie) with the new expiry date.&#x20;

#### Multiple Activation License Keys

* Whenever a license is activated, the application will write the following information to the QLM UserData field by calling [SetUserDataInActivationLog](https://support.soraco.co/hc/en-us/articles/207609823-QlmLicense-SetUserDataInActivationLog). Note that if you are using the UserData field for other purposes, you should always call [GetUserDataFromActivationLog](https://support.soraco.co/hc/en-us/articles/207295126-QlmLicense-GetUserDataFromActivationLog) first  and then update it as needed.

```
<userdata>
<expiry_date>2020-02-28</expiry_date>
</userdata>
```

* Additionally, the application will write the expiry date to the end user system by calling [StoreCookie.](https://support.soraco.co/hc/en-us/articles/115002736646-QlmLicense-StoreCookie)
* Every time the application starts up, the application will call [ReadCookie](https://support.soraco.co/hc/en-us/articles/115002709343-QlmLicense-ReadCookie) to retrieve the expiry date of the license. If the license has expired, the application will exit.
* If an application tries to activate a license and it fails because no more licenses are available, it will attempt to deactivate all licenses that have expired. To do so, the application will:
  * Call GetActivationLog to retrieve the list of all activated nodes.
  * Loop through the list of activated nodes and determine which licenses have expired.
  * Remove the expired nodes from the list by calling [ReleaseLicense](https://support.soraco.co/hc/en-us/articles/207609843-QlmLicense-ReleaseLicense) (url, activationKey, computerID, ...) for each node that has expired.

To request an extension to a license, you would:

* Call [SetUserDataInActivationLog ](https://support.soraco.co/hc/en-us/articles/207609823-QlmLicense-SetUserDataInActivationLog)with a new expiry date
* Call [StoreCookie](https://support.soraco.co/hc/en-us/articles/115002736646-QlmLicense-StoreCookie) with the new expiry date.
