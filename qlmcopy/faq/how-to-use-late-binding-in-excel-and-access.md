# How to use late binding in Excel and Access

When protecting an Excel application, in order to use early binding to the QLM License object, you need to add a reference to QlmLicenseLib.tlb. Excel references are typically path specific, so when you deploy your Excel application to your customer, the path may be different.

\
There are two ways to address this behavior: (a) Use late binding or (b) add a reference dynamically.

This article discusses how to use late binding. Another article will discuss how to dynamically add a reference to your Excel application.

To use late binding, update your code as follows:

* Replace any reference to IQlmLicense, QlmLicense, ILicenseInfo, by the keyword Object.
* Add the Enums in the attached document to the LicenseValidator class. If you are using the latest version of QLM, the LicenseValidator class may already have these enums.
* Remove the reference to QlmLicenseLib.tlb.

Our recommendation is to use early binding during development because you get the benefit of intellisense and switch to late binding when you have completed development.

* [vbaEnums.txt](https://support.soraco.co/hc/en-us/article\_attachments/206341686)1 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/206341686)
