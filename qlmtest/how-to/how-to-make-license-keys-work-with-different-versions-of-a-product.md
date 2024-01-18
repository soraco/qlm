# How to make license keys work with different versions of a product?

QLM embeds your product's major and minor version in the license key. This prevents users from using the same license key for different versions of your product.\
\
However, you may want to allow your users to use the same license key for all minor versions of your product. To do so, do not create a new version of the product in QLM. The QLM version defined in the "Define Products" tab defines the version used for licensing and does not need to exactly match your product's actual version.&#x20;

For example, say you release Product X version 4.0 on January 1 2007. On June 1 2007, you release version 4.1 and you want all 4.0 users to be able to upgrade to 4.1 with the same license key. In this case, do not create a new minor version of your product in QLM. \
\
If you are using the "Check for Updates" feature in QLM Pro, note that the Latest Version field and the Major/Minor version fields are independent. This means that you can have:

* Major Version = 4
* Minor Version=0
* Latest Version=4.1.5

Finally, to upgrade the version of a product, you should **NEVER** modify the version directly. Instead, you should create a new version, leaving the old one untouched. Below are the steps to add a new version of a product:

* Start the QLM Console
* Click on Define Products
* Click on New
* Select the "Create a new version of an existing product" option
* Select the product that you want to upgrade and click OK.
* In the product definition, set the major and minor version of the product and save the product.
* If you are using QLM Pro, you should also upload the new product definition to the server from the Sites option (QLM should automatically detect that your product definition was updated)

If you are using QLM Pro, you can also use the Maintenance Plan feature to allow customers with a license key of an older version of your product to activate a newer version of your product.

For more details about the Maintenance Plan feature, [click here](https://support.soraco.co/hc/en-us/articles/203184080-QLM-Maintenance-Plan).
