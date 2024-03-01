# Variable License Binding

In some scenarios, you may want to use a different license binding method per customer.

QLM Enterprise's Variable License Binding allows you to associate a binding method with a QLM feature.&#x20;

### Defining Product Features

The first step in configuring Variable License Binding is to define a new feature per license binding method. To do so:

* Launch the QLM Management Console
* Go to the Define Products tab
* Select your product
* For each license binding method that you'd like to support, add a corresponding feature

<figure><img src="../.gitbook/assets/image (23).png" alt=""><figcaption></figcaption></figure>

### Defining the variable license binding

Next, you must associate a different license binding method with each feature.

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Step to the "Customize Look & Feel / Behavior" page
* Go to the License Properties section
* Click the dropdown box next to QlmLicenseBindingPerFeature and configure the mapping as required
* Complete the wizard and generate the XML/Source code files.
* Update your application to use the newly generated files

<figure><img src="../.gitbook/assets/image (24).png" alt=""><figcaption></figcaption></figure>

*

