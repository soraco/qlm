# UpdateUserInformation

### Description

Creates or updates user information in the QLM License Server.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is_vendor=digibuy&is_user=user_name&is_pwd=user_pwd
```

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

The actual field names are e-commerce provider dependent. The supported e-commerce providers are listed on our web site.

Additionally, if the is\_avkey argument is added to the URL and specifies an Activation Key that is already published to the QLM License Server, this function will associate the provided Activation Key to the provided user.

Note: To update an existing account with a new email address, you must add the previous email address as an additional argument to the URL (as of QLM v14.1.21031.2).

Example: [http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is\_vendor=fastspring\&is\_user=user\_name\&is\_pwd=user\_pwd\&is\_previousemail=\[tom@soraco.co\](mailto:tom@soraco.co)](http://yourserver/yourvirtualdirectory/qlmservice.asmx/UpdateUserInformation?is\_vendor=fastspring\&is\_user=user\_name\&is\_pwd=user\_pwd\&is\_previousemail=\[tom@soraco.co]\(mailto:tom@soraco.co\))

\[block:parameters] { "data": { "h-0": "Vendor", "h-1": "Email", "h-2": "Name", "h-3": "Company", "h-4": "Address1", "h-5": "Address2", "h-6": "City", "h-7": "State", "h-8": "Zip", "h-9": "Country", "h-10": "Phone", "0-0": "Regnow", "0-1": "email", "0-2": "name", "0-3": "company", "0-4": "addr1", "0-5": "addr2", "0-6": "city", "0-7": "state", "0-8": "zip", "0-9": "country", "0-10": "phone", "1-0": "Avangate", "1-1": "email", "1-2": "firstname \nlastname", "1-3": "company", "1-4": "addr1", "1-5": "addr2", "1-6": "city", "1-7": "state", "1-8": "zipcode", "1-9": "country", "1-10": "phone", "2-0": "Chargify", "2-1": "email", "2-2": "fullName", "2-3": "company", "2-4": "address1", "2-5": "address2", "2-6": "city", "2-7": "state", "2-8": "zip", "2-9": "country", "2-10": "phone", "3-0": "Cleverbridge", "3-1": "email", "3-2": "reg\_name", "3-3": "company", "3-4": "street", "3-5": "street2", "3-6": "city", "3-7": "state", "3-8": "zip", "3-9": "country", "3-10": "phone", "4-0": "Fastspring", "4-1": "email", "4-2": "name", "4-3": "customercompany", "4-4": "AddressStreet1", "4-5": "AddressStreet2", "4-6": "AddressCity", "4-7": "AddressRegion", "4-8": "AddressPostalCode", "4-9": "AddressCountry", "4-10": "CustomerPhone", "5-0": "Paymotion", "5-1": "email", "5-2": "name", "5-3": "company", "5-4": "address1", "5-5": "address2", "5-6": "city", "5-7": "region", "5-8": "zip\_postal", "5-9": "country", "5-10": "Phone\_Number", "6-0": "PayPal", "6-1": "payer\_email", "6-2": "last\_name \nfirst\_name", "6-3": "payer\_business\_name", "6-4": "address\_street", "6-5": "cust\_address2", "6-6": "address\_city", "6-7": "address\_state", "6-8": "address\_zip", "6-9": "address\_country\_code", "6-10": "cust\_phone", "7-0": "Bluesnap", "7-1": "email", "7-2": "name", "7-3": "company", "7-4": "addr1", "7-5": "addr2", "7-6": "city", "7-7": "state", "7-8": "zip", "7-9": "country", "7-10": "phone", "8-0": "Regnow", "8-1": "email", "8-2": "name", "8-3": "company", "8-4": "addr1", "8-5": "addr2", "8-6": "city", "8-7": "state", "8-8": "zip", "8-9": "country", "8-10": "phone", "9-0": "Shareit/MyCommerce", "9-1": "email", "9-2": "firstname \nlastname", "9-3": "company", "9-4": "street", "9-5": "addr2", "9-6": "city", "9-7": "state", "9-8": "zip", "9-9": "country", "9-10": "phone", "10-0": "Shopify", "10-1": "email", "10-2": "name", "10-3": "company", "10-4": "address1", "10-5": "address2", "10-6": "city", "10-7": "province", "10-8": "zip", "10-9": "country", "10-10": "phone", "11-0": "Stripe", "11-1": "email", "11-2": "name", "11-3": "CustomerCompany", "11-4": "AddressStreet1", "11-5": "AddressStreet2", "11-6": "AddressCity", "11-7": "AddressRegion", "11-8": "AddressPostalCode", "11-9": "AddressCountry", "11-10": "CustomerPhone", "12-0": "WooCommerce", "12-1": "Customer\_Email", "12-2": "Customer\_Name", "12-3": "Customer\_Company", "12-4": "Customer\_Address1", "12-5": "Customer\_Address2", "12-6": "Customer\_City", "12-7": "Customer\_State", "12-8": "Customer\_Zip", "12-9": "Customer\_Country", "12-10": "Customer\_Phone" }, "cols": 11, "rows": 13, "align": \[ "left", "left", "left", "left", "left", "left", "left", "left", "left", "left", "left" ] } \[/block]
