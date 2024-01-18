# Protect a Qt C++ Cross Platform Application

Requirements: QLM Enterprise v15+

***

Following is a step-by-step procedure to protect a Qt C++ Cross-Platform app. Note that the steps below assume you have a QLM License Server already set up.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server then click Next
* Page 2: Select "Other Languages"
* Page 2: Select "Qt C++ Cross Platform"
* Page 3: Leave the default settings
* Page 4: Select the folder where your want to generate the Qt C++ source code and click Save
* Page 5: Click Finish

4\. Add the generated files to your project.

5\. If you are building on Windows using ming, you may need to execute the ming tool windeployqt.exe as follows: windeployqt.exe \<name of your executable>

6\. Install OpenSSL

* [64 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win64-mingw.zip)
* [32 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win32-mingw.zip)

7\. Copy the required binaries to your bin folder. On Windows, you will need:

* libcrypto-1\_1-x64.dll
* libgcc\_s\_seh-1.dll
* libssl-1\_1-x64
* libstdc++-6.dll
* libwinpthread-1.dll
* Qt6Core.dll
* Qt6Gui.dll
* Qt6Network.dll
* Qt6Widgets.dll
* Qt6Xml.dll

7\. Review the provided Qt sample to determine how to validate a license at startup. The sample is located in: %Public%\Public Documents\Quick License Manager\Samples\qlmenterprise\Qt

The parameters that may need to be updated in the sample are in mainwindow.cpp:

* licenseFile: location where the license file will be created
* URL: URL to the QLM License Server
* productID: Your product's Product ID as per the Define Products/Product Information tab
* majorVersion: Your product's Major Version as per the Define Products/Product Information tab
* minorVersion: Your product's Minor Version as per the Define Products/Product Information tab
* publicKey: Your product's RSA Public Key as per the Define Products / Encryption Keys tab

In your application, at startup, you must:

*   Create an instance of the QlmLicense class:

    ```
    license = new QlmLicense();    
    ```
*   Load the license file if it exists:

    ```
    license->loadLicense(licenseFile,publicKey,computerId);
    ```
*   To activate a license, create a function called ValidateLicenseOnServer and call it:

    ```
    bool MainWindow::ValidateLicenseOnServer ()
    {
        if (license->Ping (url))
        {
            QString ak = license->getActivationKey();
            QString ck = license->getComputerKey();
            QString cid = license->getComputerID();

            license->activateLicense(url, ak, ck, cid, productID, majorVersion, minorVersion);

            if (license->isLicenseValid(computerId) == false)
            {
                return false;
             }
          }
          return true;
    }
    ```



To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.
