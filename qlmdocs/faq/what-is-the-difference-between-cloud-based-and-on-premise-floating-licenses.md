# What is the difference between cloud-based and on-premise floating licenses?

### What is a floating license?

A floating license, sometimes called a concurrent license, is a license that can be shared by multiple users, non simultaneously.

For example, if a customer purchases 5 copies of your application, your application could be installed on 100 computers but only 5 computers/users could run your application simultaneously. This is done by checking out a license when the application starts up and checking it back in when the application exits so that the license can be used by another user.

QLM offers 2 approaches for implementing floating licenses:

* Cloud-based floating licenses (required QLM Pro)
* On-premise floating licenses (requires QLM Enterprise)

### Cloud-based floating licenses

With cloud-based floating licenses, the check-out operation is performed against the QLM License Server hosted in the cloud. To check out a license, a user needs internet access. Similarly, to check in a license, a user needs to connect to the QLM License Server. Cloud-based floating licenses are simple to implement but require that users have an internet connection when starting the application and when exiting it.

For more details about implementing cloud-based floating licenses, [click here](../how-to/how-to-implement-cloud-floating-licenses-cfl-in-qlm-v17+.md).

### On-premise floating licenses

With on-premise floating licenses, the check-out operation is performed against a floating license database deployed at the customer site. To check out a license, a user does not need internet access. Similarly, to check in a license, a user needs to connect to the floating license database so no internet connection is required. On-premise floating licenses are a bit more complex to implement, and require the deployment of a floating license database at the customer site but do not require that users have an internet connection.

QLM supports on-premise floating licenses on Windows only.

For more details about implementing on-premise floating licenses, [click here](../step-by-step-guides/how-to-implement-floating-licensing-with-qlm-enterprise.md).
