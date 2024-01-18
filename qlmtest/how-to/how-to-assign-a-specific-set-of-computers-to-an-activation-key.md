# How to assign a specific set of computers to an Activation key

Applies to: QLM Enterprise

Version: 16

***

QLM can restrict the set of computers that can activate a given license. With each Activation Key, you can associate a set of allowed Computer IDs. When an activation request is received by the server, if the Computer ID in the request does not match one of the allowed Computer IDs, the activation request is denied.

To create a list of allowed Computer IDs:

* Create an Activation Key with all the required options
* Edit the Activation Key in the QLM Management Console
* Go to the Computer Properties tab
* Select the "Allowed Computers" radio button
* In the Computer ID field, add all the allowed computers
* Click OK

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/8195528756756/mceclip0.png)
