# Protect a PDF file with QLM

QLM 8 Enterprise can protect PDF files by wrapping the PDF file in an executable file which protects the PDF file using QLM’s licensing mechanism.

The executable will embed an encrypted copy of the PDF document along with metadata required to enforce licensing of the PDF document.

To protect your PDF file:

* Launch the QLM Management Console
* Go to the Define Products tab and create a new product for your PDF document. If you are evaluating QLM, we recommend you use the product Demo 1.0.
* Then, go to the Protect your application tab
* On page 2 of the wizard, select the product you defined, your License Server then click Next
* On page 3, select PDF Document then click Next.
* On page 4, select the PDF document you want to protect
* Optionally, select an icon to associate to your PDF document
* Optionally select the digital certificate to sign the final executable.
* Click Next
* On the Look and Feel Customization page, click Next or customize any setting of your choice.
* By default, QLM will bind the license to the Computer Name. You can select the binding of your choice by setting the [QlmLicenseBinding](https://support.soraco.co/hc/en-us/articles/360001183583-QlmLicense-LicenseBinding) property located in the section "6. Qlm License Properties".
* On the Save your customizations page, select a folder where the protected PDF file will be generated.
* Click Save. An executable with the same name as your PDF document will be generated along with some DLLs.&#x20;
* Double click the executable to launch it.
* If no license was previous activated, the QLM License Wizard will prompt you to enter a license key.
* Go to the Manage Keys tab in QLM and click the “Create Activation Key” button
* Select your product and any other option of your choice and click OK
* A new Activation is created. Copy the Activation Key and paste it in the QLM License Wizard that was prompting you for a license.
* Click Activate and proceed with the wizard
* Your PDF document should now open up

Limitations of our PDF protection

* Only available on Windows as a Desktop Application
* Cross-references and table of contents are not supported
* Interactive Forms are not supported
* Pattern, Separation, DeviceN, ICC-based and Lab color spaces are not supported
* Type 3 fonts are not supported.
