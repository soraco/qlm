# GetActivationKeyWithExpiryDate

### Description

Creates an activation key on the License Server.

To call this function, you must set the enableGetActivationKey server property to true.

You should never call this function from within the application. GetActivationKey should be called from systems that cannot be intercepted by your client such as your website, your server, or your ecommerce provider. It is also highly recommended to enforce the user/pwd authentication when calling this function as described [here](../../how-to/how-to-define-the-user-password-associated-to-an-ecommerce-provider.md).

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/GetActivationKeyWithExpiryDate?is_productid=[productID]&is_majorversion=[majorVersion]&is_minorversion=[minorVersion]&is_vendor=[vendor]&is_expduration=[duration]&is_expdate=[date]
```
{% endcode %}

### Arguments

| Parameter        | Description                                                                                                                                                                                                                                                                     |
| ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_expduration  | duration of evaluation version in days.                                                                                                                                                                                                                                         |
| is\_expdate      | date at which the license will expire. The date format in is\_expdate is based on the dateFormat settings in the License Server config file (web.config). The default format is: YYYY-MM-dd                                                                                     |
| is\_majorversion | your product's major version as defined in QLM                                                                                                                                                                                                                                  |
| is\_minorversion | your product's minor version as defined in QLM                                                                                                                                                                                                                                  |
| is\_productid    | your product id as defined in QLM                                                                                                                                                                                                                                               |
| is\_qlmversion   | QLM engine version                                                                                                                                                                                                                                                              |
| is\_quantity     | the number of licenses to create. Works in conjunction with is\_usemultipleactivationskey. Note that when calling this API from one of the supported eCommerce Providers, you do not need to set is\_quantity as it is automatically passed from the eCommerce provider to QLM. |
| is\_vendor       | one of the supported vendors. This argument is required. Example: stripe                                                                                                                                                                                                        |
|                  |                                                                                                                                                                                                                                                                                 |

### Optional Arguments

| Parameter                     | Description                                                                                                                                                                                                                                                                                                                                                                                                                      |
| ----------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_additionalactivations     | by default, the number of activations enabled for each generated license key is based on the quantity of licenses purchased. For example, if a customer purchases 3 licenses, they will receive an activation key with 3 activations (is\_usemultipleactivationskey must be true). To provide additional activations, set this argument to the number of additional activations required. Example: \&is\_additionalactivations=2 |
| is\_affiliateid               | the id of the affiliate/reseller associated with the license key                                                                                                                                                                                                                                                                                                                                                                 |
| is\_computertype              | specifies the type of the client computer. Possible values are: 0 \| 1 \| 2 . 0 sets the computer type to 'none'. 1 sets the computer type to 'PC'. 2 sets the computer type to 'VM'.                                                                                                                                                                                                                                            |
| is\_features                  | semi comma separated list of feature sets and their corresponding values. Example: is\_features=0:1;1:2;2:3;3:6.                                                                                                                                                                                                                                                                                                                 |
| is\_floating                  | set this value to true to create floating licenses. The number of floating seats will be set to the quantity ordered.                                                                                                                                                                                                                                                                                                            |
| is\_licensemodel              | the license model can be one of: permanent \| permanent\_cloud \| permanent\_floating \| trial \| trial\_cloud \| trial\_floating \| subscription \| subscription\_cloud \| subscription\_floating. Example: \&is\_licensemodel=subscription                                                                                                                                                                                     |
| is\_maintduration             | set this value to the duration of the maintenance plan. By default, a maintenance plan is 365 days. The default value can be changed in the web.config file of the License Server. Example: \&is\_maintduration=180                                                                                                                                                                                                              |
| is\_maintenance\_plan         | set this value to 1 to enable the maintenance plan for this license. Example: \&is\_maintenance\_plan=1                                                                                                                                                                                                                                                                                                                          |
| is\_numberofactivationsperkey | for each generated key, set the number of activations allowed. Example: is\_numberofactivationsperkey=3. This argument is only effective when is\_usemultipleactivationskey is false.                                                                                                                                                                                                                                            |
| is\_pwd                       | password defined in Manage Keys / 3rd Party Extensions for the specified is\_vendor.                                                                                                                                                                                                                                                                                                                                             |
| is\_usemultipleactivationskey | when set to true or not set, if multiple licenses are ordered in the same request, the system returns one activation key for all licenses. When set to false, the system returns one activation key for each ordered license. The default is true.                                                                                                                                                                               |
| is\_user                      | username defined in Manage Keys / 3rd Party Extensions for the specified is\_vendor.                                                                                                                                                                                                                                                                                                                                             |

### Remarks

When calling GetActivationWithExpiryDate, an expiry date can be set by using the is\_expduration or is\_expdate argument. For example, to create a license key that expires 31 days after purchase, you have 2 options:

* Use the is\_expdate argument such as: \&is\_expdate=2015-03-01. The generated license will expire on the specified date.
* Use the is\_expduration argument such as: \&is\_expduration=31.

The useDurationToSetExpiryDate setting in the QLM License Server "Server Properties" determines the behaviour of the is\_expduration argument. When useDurationToSetExpiryDate is true, an expiry date is computed by the License Server based on the order date plus the is\_expduration period. For example, if a user purchased a 30-day subscription of your product on January 1st and is\_expduration is set to 30, the license will be set to expire on January 31st.

When useDurationToSetExpiryDate is set to false, the generated license key does not have a specific expiry date but rather a duration-based license key. This means that the license expiry date is determined the first time the application is executed. For example, if a user purchased a 30-day subscription of your product on January 1st, but then runs your product for the first time on January 15, the 30-day license will only start on January 15.

