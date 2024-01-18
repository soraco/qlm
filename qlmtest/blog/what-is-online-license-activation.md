# What is online license activation?

If you ever heard the term online activation, software activation or product activation and wondered what it meant, read the rest of this blog.

Most of us have already been exposed to online activation, most likely when you installed a Microsoft Office product. Microsoft was one of the early adopters of online activation. Due to online activation, Microsoft was able to effectively stop the piracy of its Office product line in the consumer market (it's a different story for the Enterprise market).

In the early days of licensing, when you purchased a product, you received a license key that enabled you to run the software. The license key was generic, i.e. not tied to a specific computer. This meant that users were able to install your application on any number of computers and reuse the same license key over and over. With the advent of the internet, generic license keys were published on the internet therefore allowing anyone to install your application.

With software activation, when a customer purchases a software product, they receive an activation key. The activation key does not enable the application to run. When the user enters an activation key in the application, the application connects to a license server and sends the activation key along with one or several unique computer identifiers. The license server validates the key and generates a new ID, sometimes called Product ID or Computer Key and sends it back to the application. This Computer Key is used subsequently as the license key that will be validated at application start-up. The Computer Key is bound to the computer identifiers that were sent to the license server. If a user tries to use this Computer Key on another computer, it will fail.

When users have an internet connection, the activation process can be fully automated thus making the user experience seamless and friendly. In some instances, users may not have an internet connection so access to the license server is not possible. In these cases, offline activation is possible. Offline activation is typically done by asking the user to send his activation key along with the computer identifiers (the application should display to the user the computer identifiers) by fax, phone or email. Upon receipt of this information, the vendor generates a Computer Key on the customer's behalf and sends it back to him. The customer then enters the Computer Key and enables the software to run.

Another aspect to consider when implementing software activation is license transfers. It is quite common that companies will need to uninstall an application from one computer and reinstall it on another. There are 2 general cases to consider: (a) the original computer is still operational or (b) the original computer is not operational. When the computer where the software was initially installed is still functional, the recommended approach is to automatically de-activate (release) the activated license when the software is uninstalled. Therefore, the setup program that uninstalls the application should automatically connect to the license server and release the license that was activated. This allows the user to simply install the application on another system and activate it. If the original system where the software was installed is not functional, then there are two choices: either the vendor allows the customer to de-activate the original license by providing them with such an option in the application or the customer will need to contact the vendor to request a license transfer. The choice here clearly depends on the type of customer and the type of product you are selling.

Product activation is an effective way to prevent software piracy. It is used by many software companies today and has become the standard way for protecting the intellectual property of the vendor. For more details about Quick License Manager's, visit our [web site](https://soraco.co/quick-license-manager).