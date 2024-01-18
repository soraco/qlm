# How to bind a license to a USB key (dongle)

## Application running from USB Key <a href="#h_01haca4cfbpcq1bemmf7n0wt1j" id="h_01haca4cfbpcq1bemmf7n0wt1j"></a>

### Product Configuration <a href="#h_01hacb15rn2gjbg6pepxss3prq" id="h_01hacb15rn2gjbg6pepxss3prq"></a>

To bind a license to a USB key, you must select configure&#x20;

* Launch the QLM Management Console
* Go to the Protect your application tab
* Select your product and the License Server
* Set the QlmLicenseBinding property to USBKey
* Complete the wizard and update your application with the generated code (LicenseValidator.cs and XML Settings File).

![](https://support.soraco.co/hc/article\_attachments/19220390064020)

&#x20;

### Application Configuration <a href="#h_01haca4rtxzg7vxr7e265rfr3x" id="h_01haca4rtxzg7vxr7e265rfr3x"></a>

At the application level, set the license binding to USBKey as well as shown below.

![](https://support.soraco.co/hc/article\_attachments/19220446670740)

## Application running on a local drive <a href="#h_01hacb1qeeptpbsryd8bdnmvc1" id="h_01hacb1qeeptpbsryd8bdnmvc1"></a>

If the application is running on a local path but you want to bind the license to a USB key, update your application as per the instructions below. Note that you must prompt the user to specify the location of the USB key.

### Product Configuration <a href="#id-01hacb211tftbryhga5gkw418j" id="id-01hacb211tftbryhga5gkw418j"></a>

To bind a license to a USB key, you must select configure&#x20;

* Launch the QLM Management Console
* Go to the Protect your application tab
* Select your product and the License Server
* Set the QlmLicenseBinding property to UserDefined
* Complete the wizard and update your application with the generated code (LicenseValidator.cs and XML Settings File).

![](https://support.soraco.co/hc/article\_attachments/19220642798228)

### Application Configuration <a href="#id-01hacb211twp00m4x4x9d71m9z" id="id-01hacb211twp00m4x4x9d71m9z"></a>

At the application level, set the license binding to UserDefined and get the computerID as shown in the code below.&#x20;

![](https://support.soraco.co/hc/article\_attachments/19220646308884)
