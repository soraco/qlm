# UpdateUserInformation

### Description

Creates or updates user information in the QLM License Server.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
https://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is_vendor=digibuy&is_user=user_name&is_pwd=user_pwd
```
{% endcode %}

### Arguments

| Argument           | Description                                                                                                                                             |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------- |
| is\_externaluserid | external user id to associate with the customer                                                                                                         |
| is\_pwd            | password as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_user           | username as defined in the eCommerce Providers section in QLM (Manage Keys / Tools / 3rd Party Extensions or Manage Keys / Tools / eCommerce Providers) |
| is\_userdata1      | user data to store in the customer record                                                                                                               |
| is\_vendor         | one of the supported vendors                                                                                                                            |

### Remarks

The following user-related data must be sent as part of the HTTP POST data.

* FullName
* Email
* Phone
* Company
* Address1
* Address2
* City
* State
* Zip
* Country
* IP Address
* Notes
* AffiliateID

The actual field names are e-commerce provider-dependent. The supported e-commerce providers are listed on our website.

Additionally, if the is\_avkey argument is added to the URL and specifies an Activation Key that is already published to the QLM License Server, this function will associate the provided Activation Key to the provided user.

Note: To update an existing account with a new email address, you must add the previous email address as an additional argument to the URL (as of QLM v14.1.21031.2).

Example: [http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is\_vendor=fastspring\&is\_user=user\_name\&is\_pwd=user\_pwd\&is\_previousemail=\[tom@soraco.co\](mailto:tom@soraco.co)](http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is\_vendor=fastspring\&is\_user=user\_name\&is\_pwd=user\_pwd\&is\_previousemail=\[tom@soraco.co]\(mailto:tom@soraco.co\))

| Vendor             | Email           | Name                           | Company               | Address1           | Address2           | City           | State           | Zip               | Country                | Phone           |
| ------------------ | --------------- | ------------------------------ | --------------------- | ------------------ | ------------------ | -------------- | --------------- | ----------------- | ---------------------- | --------------- |
| Regnow             | email           | name                           | company               | addr1              | addr2              | city           | state           | zip               | country                | phone           |
| Avangate           | email           | <p>firstname<br>lastname</p>   | company               | addr1              | addr2              | city           | state           | zipcode           | country                | phone           |
| Chargify           | email           | fullName                       | company               | address1           | address2           | city           | state           | zip               | country                | phone           |
| Cleverbridge       | email           | reg\_name                      | company               | street             | street2            | city           | state           | zip               | country                | phone           |
| Fastspring         | email           | name                           | customercompany       | AddressStreet1     | AddressStreet2     | AddressCity    | AddressRegion   | AddressPostalCode | AddressCountry         | CustomerPhone   |
| Paymotion          | email           | name                           | company               | address1           | address2           | city           | region          | zip\_postal       | country                | Phone\_Number   |
| PayPal             | payer\_email    | <p>last_name<br>first_name</p> | payer\_business\_name | address\_street    | cust\_address2     | address\_city  | address\_state  | address\_zip      | address\_country\_code | cust\_phone     |
| Bluesnap           | email           | name                           | company               | addr1              | addr2              | city           | state           | zip               | country                | phone           |
| Regnow             | email           | name                           | company               | addr1              | addr2              | city           | state           | zip               | country                | phone           |
| Shareit/MyCommerce | email           | <p>firstname<br>lastname</p>   | company               | street             | addr2              | city           | state           | zip               | country                | phone           |
| Shopify            | email           | name                           | company               | address1           | address2           | city           | province        | zip               | country                | phone           |
| Stripe             | email           | name                           | CustomerCompany       | AddressStreet1     | AddressStreet2     | AddressCity    | AddressRegion   | AddressPostalCode | AddressCountry         | CustomerPhone   |
| WooCommerce        | Customer\_Email | Customer\_Name                 | Customer\_Company     | Customer\_Address1 | Customer\_Address2 | Customer\_City | Customer\_State | Customer\_Zip     | Customer\_Country      | Customer\_Phone |

