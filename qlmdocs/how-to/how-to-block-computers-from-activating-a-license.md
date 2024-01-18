# How to block computers from activating a license

Applies to: QLM Enterprise

Version: 16

***

QLM can block a set of computers from activating a given license. With each Activation Key, you can associate a set of denied Computer IDs. When an activation request is received by the server, if the Computer ID in the request matches one of the denied Computer IDs, the activation request fails.

To create a list of denied Computer IDs:

* Create an Activation Key with all the required options
* Edit the Activation Key in the QLM Management Console
* Go to the Computer Properties tab
* Select the "Denied Computers" radio button
* In the Computer ID field, add all the denied computers
* Click OK

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/8195534165524/mceclip0.png)
