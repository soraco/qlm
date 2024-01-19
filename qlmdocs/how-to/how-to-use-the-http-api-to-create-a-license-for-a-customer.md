# How to use the HTTP API to create a license for a customer

If you're integrating QLM with a 3rd party process such as a CRM system, you could use the QLM HTTP API to create a license for a customer.

The workflow for creating a license for a customer is:

* Create the customer using [UpdateUserInformation](../api-reference/http-methods/updateuserinformation.md)
* Create the license and associate it with the customer using [GetActivationKey](../api-reference/http-methods/getactivationkey.md)

Note that the QLM HTTP API requires authentication. When you call an API, you must set the 3rd party provider by setting the is\_vendor argument and configure the user/password as described in this article: [How to define the user / password associated to an eCommerce provider](how-to-define-the-user-password-associated-to-an-ecommerce-provider.md)

**Example for creating a customer:**

{% code overflow="wrap" %}
```
Curl -d "Email=vanessa@soraco.co" -d "name=Vanessa Shannon" -d "Phone=514-123-1234" -d "Country=Canada" -d "zip=H3P 3N4" -d "Company=Soraco" -d "addr1=Address1" -d "addr2=Address2" -d "City=MyCity" -d "state=MyState" -d "CustomerNotes=MyNotes" "https://qlm3.net/yesaccessible/qlmlicenseserver/qlmservice.asmx/UpdateUserInformation?is_user=test&is_pwd=test123456&is_vendor=regnow"
```
{% endcode %}

**Example for creating a license key for that customer:**

{% code overflow="wrap" %}
```
Curl -d "is_features=0:1" -d "is_productid=2" -d "is_majorversion=1" -d "is_minorversion=0" -d "email=vanessa@soraco.co" -d "order_id=123456" -d quantity="3" "https://qlm3.net/yesaccessible/qlmlicenseserver/qlmservice.asmx/GetActivationKey?is_user=test&is_pwd=test123456&is_vendor=regnow"
```
{% endcode %}
