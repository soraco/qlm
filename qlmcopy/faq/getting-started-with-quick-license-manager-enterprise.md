# Getting Started with Quick License Manager Enterprise

QLM Enterprise offers all the features of QLM Professional. Additionally, QLM Enterprise supports:

* Floating licenses on Windows.
* Analytics to track installs and uninstalls of your application.
* Cross platform support: Android, iOS, Mac, Java Desktop

QLM Enterprise supports floating licenses by storing a database (MS-SQL, MS-Access DB or an XML file) on a the customer's network. No additional service is required.

The first step in creating license keys for your products is to define each product. Click on the **Define Products** tab and then click on **New.** Enter the Product Name, the Major and Minor version of the product. The Product ID and the GUID fields are automatically generated.You will need these values when you use the API to validate license keys. You may also associate up to 32 features with each of your products.

Note: As of QLM version 5, the encryption key is no longer required and has been superseeded by the public/private key pair found on the Encryption Keys tab.

## Generate license keys

Once you have defined your products, you can generate license keys for each product. There are 2 types of license keys: permanent, and evaluation/subscription keys. Evaluation/Subscription keys can specify the duration of the license, an expiry date or both.

Prior to creating license keys with QLM Enterprise, you need to setup the QLM License Server and a database that will host the license keys. For instructions on installing the QLM License Server and the database, refer to the Help. For evaluation purposes, Soraco provides you with a demo License Server and a database. The only restriction of our demo License Server is that you cannot publish your products to the web service; you can only work with the default product **Demo**. Additionally, note that the database content on the demo License Server is regularly reset.

To generate license keys with QLM Enterprise, click on the **Manage Keys** tab, then click on the Create button. Select a Product, the number of keys to generate, the type of keys to generate and then click on the **OK** button.  QLM stores the generated keys in a database.

&#x20;

## Modify your application

For details about modifying your application to implement floating licenses, refer to the QLM online help.

## Samples

All QLM Enterprise samples are located in the folder:

&#x20;   C:\Users\Public\Documents\Quick License Manager\Samples\qlmenterprise

Samples are grouped in programming languages.

.NET Samples:

* DotNet\C#\QlmEnterpriseSample  - This sample shows how to implement floating licenses in C#

Android

* Android\Java: Android sample in Java shows how to add online activation to your Android application.
* Android\DotNet: Android sample in C# using Xamarin shows how to add online activation to your Android application.

iOS

* iOS\QLMiOSSample: iOS sample shows how to add online activation to your iOS application.

Java Desktop

* JavaDesktop\QlmJavaDesktopSample: Java Desktop sample shows how to add online activation to your Java Desktop application.

Mac

* Mac\QlmMacSample: Mac sample shows how to add online activation to your Mac application.
