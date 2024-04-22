# WooCommerce - How to map WooCommerce variations to QLM features

This article describes how to map your WooCommerce variations to QLM features or Product Properties. You should also refer to the following articles for information on how to integrate QLM with WooCommerce:

* [How to integrate QLM with WooCommerce](https://support.soraco.co/hc/en-us/articles/207907363-Wordpress-How-to-integrate-QLM-with-WooCommerce)
* [How to use WooCommerce Subscription](https://support.soraco.co/hc/en-us/articles/209630123-How-to-use-WooCommerce-Subscription)

In this article, we will suppose that we have a product with 2 features and 2 product properties as follows:

| **Item**           | **Name**         | **QLM identifier**                     | **WooCommerce SKU** |
| ------------------ | ---------------- | -------------------------------------- | ------------------- |
| Feature 1          | STANDARD         | Feature Set:0, Feature ID: 1           | woo\_std            |
| Feature 2          | PROFESSIONAL     | Feature Set: 0, Feature ID: 2          | woo\_pro            |
| Product Property 1 | Number Of Scans  | Category: general, Property: numscans  |                     |
| Product Property 2 | Number Of Prints | Category: general, Property: numprints |                     |

&#x20;

&#x20;

The first step in selling your product via WooCommerce is to define your product in WordPress.

* Click Add Product
* Enter a Product name
* Set the **Product Data** to: Variable product
* Click **Attributes**
* Next to Custom product attribute, click **Add**.
* In the Name field, enter:  Edition
* In the Values field, enter: STANDARD | PROFESSIONAL
* Check "Visible on the product page"
* Check "Used for variations"
* Click **Save attributes**.
* Click the **Variations** item
* Select "Create variations from all attributes" and click Go
* Four variations will be created
* For each variation, set the regular price and provide a unique SKU
* Important: Do **NOT** check the **Downloadable** checkbox
* Click **Save Changes**.

Next, we will map each SKU to a QLM server property.

To create a custom Server Property:

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* For each SKU that you created above
  * In the Name column, enter: Your SKU value
  * In the Value column, enter: _\&is\_features=x:y_
* Click OK to close the Site Editor&#x20;

For example, based on the table of features above, we will create 2 custom server properties

* Customer Server Property 1:
  * Name: woo\_std
  * Value: \&is\_features=0:1
* Customer Server Property 2:
  * Name: woo\_pro
  * Value: \&is\_features=0:2

Click the **Update** button on the top right to commit all your changes to the product.

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
* If the **Order Status** is set to **Pending Payment**, set it to **Processing then** click **Save Order** in the right hand panel.
* At this point, a license key should have been generated.
* In the Order details page, scroll to the bottom of the page and locate the License Keys section. It should contain the generate keys.
