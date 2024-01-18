# QLM Management Console and QLM License Server Versions

It is highly recommended that your QLM Management Console and your QLM License Server be running the same version.&#x20;

The QLM Management console uses API functions to communicate with the License Server and expects the License Server to be running the same version as the Console.

### How to determine the version of the QLM Management Console

* Launch the QLM Management Console
* On the Get Started tab, you should see a tile called "QLM Version Information" which displays your current version as well as the latest version available to you.

### How to determine the version of the QLM License Server

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your License Server
* Click the Test button
* The first line of the result displays your current version.

### Upgrade Database Schema

If you encounter errors in the QLM Management Console when communicating with the QLM License Server, it is possible that the DB schema of the License Server needs upgrading. This step is usually performed after upgrading the License Server but it is safe to perform it again.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites then select your License Server
* Click Upgrade DB Schema
