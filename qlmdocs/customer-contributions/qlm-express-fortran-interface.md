# QLM Express - Fortran Interface

**QLM Express – Fortran Interface**

This document describes the process of implementing QLM Express into an ISV’s Fortran Application. The examples provides have been written in the Intel XE 2011 Fortran compiler under Microsoft Visual Studio 2008.Two example programs are provided:

1\) isv\_application – this being an example of an ISV’s application into which QLM Express has been integrated.2) isv\_generate\_key – this being an example of an ISV’s tool to generate license keys.

Both of these VS projects are contained in the VS Solution qlm\_express\_fortran and both projects use the modules licensing\_module and QLMlicenselib. Note that to create QLMlicenselib you should run the Intel Visual Fortran Module Wizard. The Fortran code should be self-explanatary so the description provided below focuses on the how the licensee licenses their copy of the ISV’s application and how the licensor (the ISV) creates a key for the licensee. Note that the licensing model used is that of a computer bound key, i.e. the license is to be locked to a particular computer (node-locked) and to implement this the licensee needs to pass computer identification information to the licensor in order that he may generate a license key.

**Licensee** The licensee will install the ISV’s application on his machine. They will then run the application and because a computer\_key\_file is not found under the c:\programdata\ISV root, the application will generate a computer\_id\_file under that directory and will instruct the user to send this to the licensor in order to obtain a computer key.

**Licensor** The licensor receives the licensee’s computer\_id\_file and runs the application isv\_generate\_key which reads the computer\_id\_file, creates a computer key and writes it to the computer\_key\_file. The licensor then sends this file to the licensee.

Licensee The licensee places the computer\_key\_file under the c:\programdata\ISV root and runs the application again. This time the computer\_key\_file is found and read, and provided the computer identity of the computer on which the application is being run matches that of the computer key then the application runs.

[qlm\_express.zip](https://support.soraco.co/hc/en-us/article\_attachments/200181275)
