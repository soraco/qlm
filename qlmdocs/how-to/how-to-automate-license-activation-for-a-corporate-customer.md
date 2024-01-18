# How to automate license activation for a corporate customer

To automate the license activation process at a large site, one possibility is to store the Activation key in a file located on a network share accessible to all users.

When the application starts up, it would either automatically know the location of the network share (this might be possible depending on whether your application already has a central repository for some of your own settings) or it could prompt the user for the location of the nework share.

Once the location is known, the application would then read the license file, retrieve the Activation Key and automatically activate it.&#x20;

A sample is provided to illustrate this feature. The sample is located in the following folder:

%Public%\Documents\Quick License Manager\Samples\qlmpro\Windows\DotNet\C#\QlmControlSampleAutoActivation&#x20;

**Sample Walkthrough:**

* When the application starts up, the ReadGlobalKey function is called.
* ReadGlobalKey first checks if a license has already been activated on the current system.
* If a license was already activated, it simply proceeds to call ValidateLicenseAtStartup
* If no license is found on the current system, the sample tries to locate a license file in a specific folder. If no license file is found, the user is prompted to specify the location of the license file.
* Once the license file is found, the Activation Key is read from the license file. It is  then activated and stored on the current system.
