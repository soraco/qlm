# Protect a Linux C++ Application

Requirements: QLM Enterprise v18+

***

Following is a step-by-step procedure to protect a Linux C++ app. Note that the steps below assume you have a QLM License Server already set up.

1. Launch the QLM Management Console
2. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;
3. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server then click Next
* Page 2: Select "Other Languages"
* Page 2: Select "Linux C++"
* Page 3: Leave the default settings
* Page 4: Select the folder where your want to generate the C++ source code and click Save
* Page 5: Click Finish

4. Add the generated files to your project (source and include folders)
5. Install OpenSSL and copy the required OpenSSL to your bin folder

* [64 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win64-mingw.zip)
* [32 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win32-mingw.zip)

6. The generated files also contain a test folder with a sample application that can be used as a reference for adding license activation and validation to your own code. Some parameters that may need to be updated in the sample are:

* `URL: URL to the QLM License Server`
* `productID: Your product's Product ID as per the Define Products/Product Information tab`
* `majorVersion: Your product's Major Version as per the Define Products/Product Information tab`
* `minorVersion: Your product's Minor Version as per the Define Products/Product Information tab`
* `publicKey: Your product's RSA Public Key as per the Define Products / Encryption Keys tab`



To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
