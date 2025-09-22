# How to bind a license to a computer

Binding a license to a computer ensures that a license key cannot be used on more than one computer.

On Windows, QLM provides many options for binding the license to a computer. These options are documented [here](../api-reference/qlmlicense/enums/elicensebinding.md).

We recommend setting the license binding to QlmUniqueSystemIdentifier2. This binding automatically determines if the application is running on a physical machine or a virtual machine and use the most appropriate binding depending on the customer's environment.

To use QlmUniqueSystemIdentifier2, you must do the following:

* Launch the QLM Management Console
* Go to the Protect Your Application tab
* Step through the wizard
* Select your product and your License Server
* On the "Customize Look & Feel and behavior tab", set the QlmLicenseBinding property to QlmUniqueSystemIdentifier2 (in the QLM License Properties section)
* Complete the wizard to generate the LicenseValidator class and the XML Settings file
* Update your application to use the newly generated files
* Update your application by setting the license binding to QlmUniqueSystemIdentifier2 before calling the ValidateLicenseAtStartup function&#x20;
