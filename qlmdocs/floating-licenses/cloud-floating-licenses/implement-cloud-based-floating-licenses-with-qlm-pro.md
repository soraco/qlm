# Implement cloud-based floating licenses with QLM Pro

QLM Enterprise provides support for on-premise floating licenses.

QLM Pro supports cloud-based floating licenses. Note that your application must have internet access when it is launched and when it exits. This limitation does not exist with QLM Enterprise's on-premise floating licenses.

The workflow of cloud floating license is as follows:

1. In the QLM Management Console, create an Activation Key and set the following properties:
   1. Number of Activations per Key = Required number of floating licenses.
   2. License Model = permanent\_cloud | subscription\_cloud | trial\_cloud
   3. Set any other property as needed
2. The first time the application starts up, launch the QLM License Wizard or your own UI to prompt the user for the Activation Key
3. Once the Activation Key is activated, the license is checked out by the current computer.
4. When the application exits, you check-in the license so it can be used by another user.

Note that this process requires an internet connection at the time the application starts up and when it exits.

For example, if a user with a laptop starts up the application before leaving the office while he has an internet connection, a license is checked out and acquired by his laptop. He then closes his laptop without closing the application and leaves the office. The checked-out license remains checked out by his laptop. He then travels and uses the application as expected. If he closes the application and reopens it while no internet connection is available, the license remains checked out by his laptop and he can use the application at will. Upon his return to the office, when he closes the application, his license is checked in and is returned to the pool of licenses available to other users.

Additionally, QLM supports checking out a license for offline usage. When a user selects to work offline, a license can be checked out for a specified period of time after which the license becomes available for other users to consume while the original user is denied access.



You can find samples that demonstrate this capability in the folders below:

| Language | Folder                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------- |
| C#       | %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense   |
| Delphi   | %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\Delphi\CloudFloatingLicenseSample |
| VC++     | %Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\C++\QlmCloudFloatingLicenseSample |

\
Additional resources:

[What is the difference between cloud-based and on-premise floating licenses?](../../faq/what-is-the-difference-between-cloud-based-and-on-premise-floating-licenses.md)\
[Cloud-based floating licenses and multiple application instances](cloud-based-floating-licenses-and-multiple-application-instances.md)
