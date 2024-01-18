# Protect a JUCE application

Requirements: QLM v15+

***

Following is a step-by-step procedure to protect a JUCE C++ Cross-Platform app. Note that the steps below assume you have a QLM License Server already set up.

1\. Launch the QLM Management Console

2\. Create a product from the “Define Product” tab or use the Demo 1.0 product if you are evaluating QLM.&#x20;

3\. Go to the "Protect your application tab":

* Page 1: Select the product to protect and the License Server then click Next
* Page 2: Select "Other Languages"
* Page 2: Select "JUCE"
* Page 3: Leave the default settings or customize the look & feel if needed
* Page 4: Select the folder where your want to generate the C++ source code and click Save
* Page 5: Click Finish

4\. Add the generated files to your project.

5\. Install OpenSSL

* [64 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win64-mingw.zip)
* [32 bit Open SSL binaries](https://soraco.co/products/qlm/openssl/openssl-1.1.1k-win32-mingw.zip)

6\. Copy the required binaries to your bin folder. On Windows, you will need:

* libcrypto-1\_1-x64.dll
* libssl-1\_1-x64

7\. Review the provided JUCE sample to determine how to validate a license at startup. The sample is located in: %Public%\Public Documents\Quick License Manager\Samples\qlmenterprise\Juce

The parameters that may need to be updated in the sample are in MainComponent.cpp:

* licenseFile: location where the license file will be created
* URL: URL to the QLM License Server
* productID: Your product's Product ID as per the Define Products/Product Information tab
* majorVersion: Your product's Major Version as per the Define Products/Product Information tab
* minorVersion: Your product's Minor Version as per the Define Products/Product Information tab
* publicKey: Your product's RSA Public Key as per the Define Products / Encryption Keys tab

In your application, at startup, you must:

*   Create an instance of the QlmLicense class:

    ```
    std::unique_ptr<soraco::License> m_license; // in header file
    m_license.reset(new soraco::License()); // in cpp file
    ```
*   Load the license file if it exists:

    ```
    m_license->loadLicense(licenseFile,publicKey,m_computerId);
    ```

&#x20;

*   To check if a license is valid, create a function called checkLicense and call it.

    ```
    void MainComponent::checkLicense() 
    {
        juce::String validationResult = m_license->validationResult().result;

        if (m_license->isLicenseValid(m_computerId) == false)
        {
            // You must decide what to do if the license is not valid 
            // Display a UI to allow the user to enter a new license key
            return;
        }

        // If the local license file is valid, we can also contact the server 
        // to check if the license is still valid on the server.
        if (ValidateLicenseOnServer() == false)
        {
            // You must decide what to do if the license is not valid 
             // Display a UI to allow the user to enter a new license key
            return;
        }
    }
    ```

To generate a license key for testing purposes:

* Go to the Manage Keys tab.
* Click "Create Activation Key"
* Select the Product (Demo 1.0 for trials) and click Ok.
* Copy and Paste the generated Activation Key in the License Wizard launched when your application starts up and follow the steps in the wizard.

A sample is available in the following folder: %Public%\Documents\Quick License Manager\Samples\qlmenterprise\Juce
