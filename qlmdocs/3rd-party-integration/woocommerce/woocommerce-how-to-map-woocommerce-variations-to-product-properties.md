# WooCommerce - How to map WooCommerce variations to product properties

This article describes how to map your WooCommerce variations to QLM Product Properties. You should also refer to the following articles for information on how to integrate QLM with WooCommerce:

* [How to integrate QLM with WooCommerce](https://support.soraco.co/hc/en-us/articles/207907363-Wordpress-How-to-integrate-QLM-with-WooCommerce)
* [How to use WooCommerce Subscription](https://support.soraco.co/hc/en-us/articles/209630123-How-to-use-WooCommerce-Subscription)

In this article, we will suppose that we have a product with 2 product properties as follows:

| **Item**           | **Name**         | **QLM identifier**                     | **WooCommerce SKU** |
| ------------------ | ---------------- | -------------------------------------- | ------------------- |
| Product Property 1 | Number Of Scans  | Category: general, Property: numscans  |  woo\_scans         |
| Product Property 2 | Number Of Prints | Category: general, Property: numprints |  woo\_prints        |

&#x20;

The first step in selling your product via WooCommerce is to define your product in WordPress.

* Click Add Product
* Enter a Product name
* Set the **Product Data** to: Variable product
* Important: Do **NOT** check the **Downloadable** checkbox
* Click **Attributes**
* Next to Custom product attribute, click **Add**.
* In the Name field, enter:  Scans
* In the Values field, enter: 100 | 200
* Check "Visible on the product page"
* Check "Used for variations"
* Repeat the same steps for **Prints**
* Click **Save attributes**.
* Click the **Variations** item
* Select "Create variations from all attributes" and click Go
* Four variations will be created
* For each variation, set the regular price and provide a unique SKU
* Important: Do NOT check the VIRTUAL checkbox
* Click **Save Changes**.
* Click the **Update** button on the top right to commit all your changes to the product.

Next, we will map each SKU to a QLM server property.

To create a custom Server Property:

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear in the **custom** category.
* For each SKU that you created above
  * In the Name column, enter: Your SKU value
  * In the Value column, enter: \&is\_pp=\<category>.\<name>::value::expiryDate||\<category>.\<name>::value::expiryDate
  * For more details about the syntax, check this [article](https://support.soraco.co/hc/en-us/articles/115000785306-How-to-use-Product-Properties).
* Click OK to close the Site Editor&#x20;

For example, based on the table of Product Properties above, we will create 4 custom server properties

* Customer Server Property 1:
  * Name: woo\_print100\_scan100
  * Value: \&is\_pp=general.numprints::100||general.numscans::100
* Customer Server Property 2:
  * Name: woo\_print100\_scan200
  * Value: \&is\_pp=general.numprints::100||general.numscans::200
* Customer Server Property 3:
  * Name: woo\_print200\_scan100
  * Value: \&is\_pp=general.numprints::200||general.numscans::100
* Customer Server Property 4:
  * Name: woo\_print200\_scan200
  * Value: \&is\_pp=general.numprints::200||general.numscans::200

&#x20;

&#x20;To place a test order:

* In the WordPress left panel, click Products
* Locate your product and click **View**
* Select a variation
* Click **Add To Cart**
* Click **View Cart**
* Click **Proceed to Checkout**
* Enter your **Billing Details** and click **Continue**
* Click **Continue** for **Additional Information**
* Select your payment method and proceed to pay
* Once payment is completed, go to the WordPress left panel and click **WooCommerce / Orders**
* Locate the order you just placed and click it
* If the **Order Status** is set to **Pending Payment**, set it to **Processing then** click **Save Order** in the right-hand panel.
* At this point, a license key should have been generated.
* In the Order details page, scroll to the bottom of the page and locate the License Keys section. It should contain the generate keys.
