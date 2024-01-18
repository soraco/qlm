# How to share products on 2 machines running QLM?

If you have multiple licenses of QLM, you can share the definition of your products on all the machines running QLM.

**QLM Express**

* Start QLM.
* Click on Options then click on the General tab. In QLM 5, you can access the Options by clicking on the QLM icon on the top left corner.
* Locate the field that defines the path to the products.xml file.
* Create a Windows Share on your network and copy the products.xml file to this share.
* Update the path under Options / General to point to the share.
* On each system that needs to share the product defintion, update the path under Options / General to point to the share.

If the 2 machines are not on the same network, you can simply copy the products.xml file from one machine to the other to generate compatible keys.

**QLM Pro**

You can follow the same approach as above. In addition, you can do as follows:

Assuming you have 2 systems, PC1 and PC2.

* On PC1, create the producs from the Define Products Page.
* Upload the products to the web service as follows;
  * Click on the Manage Keys tab
  * Click on the Sites and select your profile
  * Click no the "Upload products to web service"
* On PC2, configure the same web service as on PC1
* PC2 should automatically detect that new products were uploaded and prompt you to download them
* To force a download of the products to PC2, do as follows on PC2:
  * Click on the Manage Keys tab
  * Click on the Sites and select your profile
  * Click no the "Download products from  web service"
