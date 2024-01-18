# How to implement Cloud Floating Licenses (CFL) in QLM v17+

Edition: QLM Pro

Version: 17.0

***

## Configuration <a href="#h_01ha5b76m8wg7esk9hp2gaajnz" id="h_01ha5b76m8wg7esk9hp2gaajnz"></a>

### Product Definition <a href="#h_01ha5b76m8x5h71r1486vhs4zg" id="h_01ha5b76m8x5h71r1486vhs4zg"></a>

Unlike previous versions of QLM, no change is required at the product definition level to implement Cloud Floating Licenses (CFL)

### License Wizard Settings File <a href="#h_01ha5b76m8zw0rrrwvde9wy6xh" id="h_01ha5b76m8zw0rrrwvde9wy6xh"></a>

Unlike previous versions of QLM, no change is required in the License Wizard settings file to implement CFL.

### Implement CFL in your Application <a href="#h_01hcg1s328y5vw5f2jpdg4d28f" id="h_01hcg1s328y5vw5f2jpdg4d28f"></a>

To implement CFL in your application, you must perform the regular license key validation, similarly to node-locked licenses and in addition, you must do the following:

* When the application starts up after the license is validated, check out the license
* When the application exits, check-in the license

The QLMProFloatingLicense sample can be used as a reference to add floating license support to your application. The sample is located in the following folder: %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense

In the sample, the Checkout/Check-in functionality is implemented in a new class called FloatingLicenseValidator which is a subclass of the LicenseValidator class.

At application startup, you need to:

* Create an instance of the FloatingLicenseValidator class
* Register an event that is fired when an error occurs
* Call the FloatingLicenseValidator.ValidateLicenseAtStartup to validate the license&#x20;
  * If the license is not valid, launch the wizard to activate the license
  * If the license is valid, check-out the license

At application exit, you need to:

\- Check-in the license.

#### Create license keys for CFL <a href="#h_01ha5b76m8emhkdkvet6qpvr5c" id="h_01ha5b76m8emhkdkvet6qpvr5c"></a>

To create an Activation Key for a cloud-based floating license:

* Launch the QLM Management Console.
* Go to the Manage Keys tab.
* Click Create Activation Key.
* Set the Number of Activations field to the number of required cloud floating licenses.
* Set the license model to: trial\_cloud or subscription\_cloud or permanent\_cloud
* Set any other property as needed.
* Click OK

![](https://support.soraco.co/hc/article\_attachments/19140530382228)

### Limitations <a href="#h_01ha5b76m8t1m2md2v9g2nmkc0" id="h_01ha5b76m8t1m2md2v9g2nmkc0"></a>

* You cannot edit a license and change the license model after the Activation Key is created. If you need to update the license model, you need to create a new Activation Key and set the proper license model at creation time. This is required because the license model value is embedded in the Activation Key.
