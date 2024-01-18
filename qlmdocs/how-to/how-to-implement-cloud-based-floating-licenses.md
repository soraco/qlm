# How to implement cloud-based floating licenses

Edition: QLM Pro

Version: 15.0.21267.1

***

\*\*\* Important: If you are using QLM v17, please refer to this [article](https://support.soraco.co/hc/en-us/articles/19140337385876) instead.\*\*\*

### Configuration <a href="#h_01hcg5hqsgf65f8v237zmq1dag" id="h_01hcg5hqsgf65f8v237zmq1dag"></a>

#### Product Definition <a href="#h_01hcg5ga82estegdtekz89vf9n" id="h_01hcg5ga82estegdtekz89vf9n"></a>

To enable CBFL, you must create a QLM feature and associate it with your product as follows:

* Launch the QLM Management Console
* Go to the Define Products tab
* Select your product
* Add a new feature as follows:
  * Feature Name: CLOUD\_FLOATING\_LICENSE (or any name of your choice)
  * Feature Set: \<select any feature set>, for example: 3
  * Feature ID: \<default>, for example: 1
* Click Save to save your product
* Go to the Manage Keys tab and answer yes when prompted to upload the products to the server

#### License Wizard Settings File <a href="#h_01hcg5ga822cr69d13m0ws7761" id="h_01hcg5ga822cr69d13m0ws7761"></a>

The next step is to update the License Wizard settings file to instruct the wizard which QLM feature is associated with CBFL.

* Launch the QLM Management Console
* Go to the Protect your application tab
* Select your product
* Go to the "Customize look & feel" page
* Go to the "QLM License Wizard - Behavior Properties" section
* Set the QlmCloudFloatingLicenseFeature to: \<FeatureSet>:\<FeatureID>, for example: 3:1
* Click Next and save the XML settings file.

#### Implement CBFL in your Application <a href="#h_01hcg5ga82hwxssbqv8dqbw7jz" id="h_01hcg5ga82hwxssbqv8dqbw7jz"></a>

To implement CBFL in your application, you must perform the regular license key validation, similarly to node-locked licenses and in addition, you must do the following:

* When the application starts up after the license is validated, check out the license
* When the application exits, check-in the license

The QLMProFloatingLicense sample can be used as a reference to add floating license support to your application. The sample is located in the following folder: %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense

In the sample, the Checkout/Checkin functionality is implemented in a new class called FloatingLicenseValidator which is a descendant of the LicenseValidator class.

#### Create license keys for CBFL <a href="#h_01hcg5ga828y3g5w3fz9des95y" id="h_01hcg5ga828y3g5w3fz9des95y"></a>

To create an Activation Key for a cloud-based floating license:

* Launch the QLM Management Console.
* Go to the Manage Keys tab.
* Click Create Activation Key.
* Set the Number of Activations field to the number of required floating licenses.
* Set any other property as needed.
* Click OK

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4644230225940)

### Limitations <a href="#h_01hcg5ga82yb522mscxf2aryp7" id="h_01hcg5ga82yb522mscxf2aryp7"></a>

* You cannot edit a license and enable CBFL after the Activation Key is created. If you need to enable CBFL for a customer, you need to create a new Activation Key and set the CBFL feature at creation time.
