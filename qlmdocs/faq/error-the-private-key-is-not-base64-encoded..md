# Error: The private key is not base64-encoded.

A regression issue was introduced in the first couple builds of QLM 9.2 that cause the Private Key to have some trailing garbage characters. Once the Private Key is corrupted, you can no longer create license keys and you received the following message: "The private key is not base64-encoded."

To resolve this issue, you must do the following:

1\. In the QLM Management Console, go to the Define Products page and click the Encryptions Keys tab

2\. For each product, confirm that the Private keys ends with the characters "=". If there are non printable characters after the "=", you have been impacted by this bug.

3\. Locate the products.xml file that contains your product definition. This file is typically located in %appdata%\Soraco\Quick License Manager. Make a backup of this file.

4\. Open the xml file in Notepad

5\. For each product you created, locate the EPrivateKey entry in the xml file

6\. Delete the value of this key (the data inside the double quotes).

7\. Rename EPrivateKey to PrivateKey

8\. Set the value of PrivateKey to the value displayed in the Define Products page without the garbage characters. See the example below for help.

9\. Repeat these steps for each product, then save the XML file.

10\. Close QLM and restart it

11\. Upload your products to the server from Manage Keys / Sites

**Example of an entry in the XML file:**

* Original value: EPrivateKey="QiK3ClP9mBiGy9d2dd+8lgbj2pqYfG3VGiipktTBkqQ="
* Delete the value -> EPrivateKey=""
* Rename EPrivateKey to PrivateKey -> PrivateKey=""
* Set the Set the value of PrivateKey to the value displayed in the Define Products page without the garbage characters -> PrivateKey="AgYAiwXGscI="
