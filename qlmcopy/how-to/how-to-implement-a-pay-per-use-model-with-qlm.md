# How to implement a pay-per-use model with QLM

#### Overview

A pay-per-use model defines specific criterion that is used to constrain what a user can do in your application. For example, you may want to limit the number of times a user can execute your application, or limit the number of reports that a customer can view in your application.

Pay-per-use can be implemented with QLM by using QLM's Product Properties. For each constraint that you want to control, you define a Product Property (PP). When you create a license for a specific customer you assigned a value to this PP. At runtime, you can retrieve the PP and enforce it.

This article provides the steps needed to implement a pay-per-use model to limit the number of executions of your application. You can use the same methodology to limit any other criteria as needed.

#### Define a Product Property

* Launch the QLM Management Console
* Go to Define Products / Product Properties
* Click the + sign to add a PP
* Set the category as  needed
* Set the name to "number\_of\_executions"
* Set the data type to int.
* &#x20;Set the Default Value to -1.

You can also use QLM's Product Properties to track the consumed executions. To do so, define a PP as follows:

* Launch the QLM Management Console
* Go to Define Products / Product Properties
* Click the + sign to add a PP
* Set the category as  needed
* Set the name to "consumed\_executions"
* Set the data type to int.
* &#x20;Set the Default Value to 0.

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/10961174277012)

#### Creating a license

A PP is set when you create a license for a customer. To set the PP:

* Launch the QLM Management Console
* Go to Manage Keys
* Click "Create Activation Key"
* Select your product then go to the Product Properties tab
* Set the value of max\_executions to the desired value
* Click OK

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/10961253770900)

#### Server Configuration

In order to publish the usage to a product property on the server, you must set the server property\
options/setProductPropertiesUseAdminEncryptionKey to false.

Note that you can also use SetUserData and GetUserData to store the consumption.

![mceclip2.png](https://support.soraco.co/hc/article\_attachments/10961259433364)

#### Application Implementation

A sample program is included with QLM to demonstrate how to add support for pay-per-use in your application. The sample is located in: %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmSamplePayPerUse

The logic for validating and recording application usage is implemented in a class called LicenseValidatorPP.cs which inherits from LicenseValidator. You can copy this class to your own application and modify it as needed.

The sample performs standard QLM license validation. If the regular license validation is successful, the sample then calls VerifyAndRecordUsage which verifies if the user has exceeded the number of uses and updates the server with the additional consumption.
