# How to simultaneously support node-locked and cloud-based floating licenses

### Overview

To simultaneously support node-locked and cloud-based floating licenses, you can use [QLM Features](https://support.soraco.co/hc/en-us/articles/360021106252) to identify if the license acquired by the customer should be a node locked license or a cloud-based floating license.

The general steps to accomplish this are:

* Associate a new feature, called CLOUD\_FLOATING\_LICENSE, with your product.
* When creating a license for a customer, specify whether the CLOUD\_FLOATING\_LICENSE feature is enabled
* In your application, check if the CLOUD\_FLOATING\_LICENSE feature is enabled and apply the cloud-based floating license logic when required.

### Add a new feature

* Launch the QLM Management Console
* Go to the Define Products tab
* Select your product
* Add a new feature called CLOUD\_FLOATING\_LICENSE
* Note the **Feature Set** and **Feature ID** of this new feature. Example: Feature Set=3 and Feature ID=64
* Save your product and make sure it gets uploaded to the server

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/4408158103060/mceclip0.png)

### Configure the QLM License Wizard

* Launch the QLM Management Console
* Go to the Protect your application tab
* Go to the Customize Look & Feel page
* Go to section 3 "QLM License Wizard - Behavior Properties"
* Set the QlmCloudFloatingLicenseFeature to: \<feature\_set>:\<feature\_ID. Example: 3:64
* Click Next and Save your customizations
* Update your application with the newly generated files

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/4408158145172/mceclip1.png)

### License Key Creation

When creating a license key for a customer, enable or disable the CLOUD\_FLOATING\_LICENSE feature as required.

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/4408165800596/mceclip2.png)

&#x20;

### Application Implementation

At the application level, after the license is validated, call [IsFeaturedEnabledEx ](https://support.soraco.co/hc/en-us/articles/207611713-QlmLicense-IsFeatureEnabledEx)to determine if the CLOUD\_FLOATING\_LICENSE  feature is enabled. If it is, you must check-out the license at application startup and check it back in when the application exits.

The sample %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense should be used as a reference for implementing this model.
