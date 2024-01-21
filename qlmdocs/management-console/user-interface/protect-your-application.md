# Protect your application

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

QLM provides several approaches to protect your application. The Protect your application wizard generates a helper class to include in your application as well as 2 configuration files that specify the properties of the QLM License Wizard Control. The QLM License Wizard Control is a license registration form to capture a license key and activate it.\
\
The **Protect your application** tab in the QLM Management Console walks you through the steps to protect your application. On the first step of the wizard. select the product you want to protect, the QLM License Server and your programming language.\
On step 2 of the wizard, select the Look & Feel options of the QLM License Wizard.\
On Step 3 of the wizard, select the licensing options. These options reflect the properties of the QlmLicense object as described in the API Reference section in the online help.\
Finally, select a location where QLM will save the helper class and the xml files with your customizations and click Save.\
If your application is a C# or a VB.NET application, QLM can automatically update your Visual Studio project with the required references and helper files.

### Protecting .NET Application

For Windows Forms .NET applications, QLM provides a .NET User Control that you can easily drop in your application. The control is a form that allows the end-user to enter a license key and activate it.\
\
The QLM License Wizard Control is also available as a standalone executable that can run alongside your application.\
\
When you install QLM on your system, a Quick License Manager tab is added to your Visual Studio toolbox that contains the QLM .NET Wizard Controls. If for any reason the Quick License Manager tab was not added to your Visual Studio toolbox, you can attempt to recreate this section by clicking on the Refresh button under Options / Enable Visual Studio Integration. Note that the QLM tab is not added to the Visual Studio Express edition as this edition does not support programmatic additions to its toolbox.\
\
For more details about the QLM .NET Controls, refer to the API Reference.\
\
For WPF applications, you can host the QLM Windows Forms Controls in WPF as described in this [article](http://keyvan.io/host-windows-forms-controls-in-wpf).\
\
If you are developing a web-based **ASP.NET** application, the above .NET controls cannot be used. A sample program is available that shows how to capture and activate a license key. The sample is located here:\
_%Public%\\_Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmAspDotNetSample

In addition to the .NET Controls that are required for capturing and activating a license key, the **Protect your application** wizard generates a helper class that you need to add to your application. The helper class has a method called **ValidateLicenseAtStartup.** You should call this method when your application is launched. For more details about this method, refer to the API reference section.
