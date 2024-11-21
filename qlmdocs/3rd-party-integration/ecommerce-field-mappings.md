# eCommerce Field Mappings

## License Fields Mapping

| **Vendor**           | **OrderID**  | **Quantity** |
| -------------------- | ------------ | ------------ |
| Avangate             | REFNO        | QUANTITY     |
| Bluesnap             | order\_id    | quantity     |
| Chargify             | orderid      | quantity     |
| Cleverbridge         | PURCHASE\_ID | QUANTITY     |
| Fastspring           | reference    | quantity     |
| Magento              | OrderId      | quantity     |
| Paymotion            | orderNumber  | quantity     |
| Paypal               | txn\_id      | quantity     |
| Regnow               | order\_id    | quantity     |
| Shareit / MyCommerce | PURCHASE\_ID | QUANTITY     |
| Shopify              | orderNumber  | quantity     |
| Stripe               | orderNumber  | quantity     |
| WooCommerce          | OrderId      | quantity     |

## Customer Fields Mapping

| Vendor               | Email           | Name                              | Company               |                    |                    |                |                 |                   |                        |                 |
| -------------------- | --------------- | --------------------------------- | --------------------- | ------------------ | ------------------ | -------------- | --------------- | ----------------- | ---------------------- | --------------- |
| Avangate             | email           | <p>firstname</p><p>lastname</p>   | company               | addr1              | addr2              | city           | state           | zipcode           | country                | phone           |
| Bluesnap             | email           | name                              | company               | addr1              | addr2              | city           | state           | zip               | country                | phone           |
| Chargify             | email           | fullName                          | company               | address1           | address2           | city           | state           | zip               | country                | phone           |
| Cleverbridge         | email           | reg\_name                         | compay                | street             | street2            | city           | state           | zip               | country                | phone           |
| Fastspring           | email           | name                              | customercompany       | AddressStreet1     | AddressStreet2     | AddressCity    | AddressRegion   | AddressPostalCode | AddressCountry         | CustomerPhone   |
| Magento              | Customer\_Email | Customer\_Name                    | Customer\_Company     | Customer\_Address1 | Customer\_Address2 | Customer\_City | Customer\_State | Customer\_Zip     | Customer\_Country      | Customer\_Phone |
| Paymotion            | email           | name                              | company               | address1           | address2           | city           | region          | zip\_postal       | country                | Phone\_Number   |
| Paypal               | payer\_email    | <p>last_name</p><p>first_name</p> | payer\_business\_name | address\_street    | cust\_address2     | address\_city  | address\_state  | address\_zip      | address\_country\_code | cust\_phone     |
| Regnow               | email           | name                              | company               | addr1              | addr2              | city           | state           | zip               | country                | phone           |
| Shareit / MyCommerce | email           | <p>firstname</p><p>lastname</p>   | company               | street             | addr2              | city           | state           | zip               | country                | phone           |
| Shopify              | email           | name                              | company               | address1           | address2           | city           | province        | zip               | country                | phone           |
| Stripe               | email           | name                              | CustomerCompany       | AddressStreet1     | AddressStreet2     | AddressCity    | AddressRegion   | AddressPostalCode | AddressCountry         | CustomerPhone   |
| WooCommerce          | Customer\_Email | Customer\_Name                    | Customer\_Company     | Customer\_Address1 | Customer\_Address2 | Customer\_City | Customer\_State | Customer\_Zip     | Customer\_Country      | Customer\_Phone |
