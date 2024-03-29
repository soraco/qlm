# Implement cloud-based floating licenses with QLM Pro

QLM Enterprise provides support for on-premise floating licenses.

QLM Pro supports cloud-based floating licenses. Note that your application must have internet access when it is launched and when it exits. This limitation does not exist with QLM Enterprise's on-premise floating licenses.

The steps to implement cloud-based floating licenses with QLM Pro are:

1. In the QLM Management Console, create an Activation Key and set the "Number of Activations per Key" to the required number of floating licenses.
2. At application startup, call [ReadKeys](https://support.soraco.co/hc/en-us/articles/207296736-QlmLicense-ReadKeys) to retrieve the Activation Key and the Computer Key.
3. If both values are empty, launch the QLM License Wizard to allow the user to enter an activation key and activate it.
4. If ReadKeys retrieves an Activation Key and not a Computer Key, call [ActivateLicense](https://support.soraco.co/hc/en-us/articles/207295216-QlmLicense-ActivateLicense) to activate the license key and check-out the license.
5. If ReadKeys retrieves an Activation Key and a Computer Key, the license is already checked-out and does not need to be activated. You should still however call [ValidateLicenseEx](https://support.soraco.co/hc/en-us/articles/207611613-QlmLicense-ValidateLicenseEx) with the Computer Key to make sure that the license is valid.
6. When your application exits, call [DeleteKeysEx](https://support.soraco.co/hc/en-us/articles/213569423-QlmLicense-DeleteKeysEx) (false, true, false, false, out errorMessage) then call [ReleaseLicense](https://support.soraco.co/hc/en-us/articles/360047102951-QlmLicense-ReleaseLicense), while ensuring to set the **logRelease** argument to false.

Note that this process requires an internet connection at the time the application starts up and when it exits.

For example, if a user with a laptop starts up the application before leaving the office while he has an internet connection, a license is checked-out and acquired by his laptop. He then closes his laptop without closing the application and leaves the office. The checked-out license remains checked-out by his laptop. He then travels and uses the application as expected. If he closes the application and reopens it while no internet connection is available, the license remains checked-out by his laptop and he can use the application at will. Upon his return to the office, when he closes the application, his license is checked-in and is returned to the pool of licenses available to other users.

You can find a sample that demonstrates this capability here:\
%Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmProFloatingLicense

Additional resources:

[What is the difference between cloud-based and on-premise floating licenses?](https://support.soraco.co/hc/en-us/articles/360048038592)\
[Cloud-based floating licenses and multiple application instances](https://support.soraco.co/hc/en-us/articles/360050973071)
