# Terminal Server Support

QLM Professional can limit the number of instances of your application running on a Terminal Server or Citrix XenDesktop.

To restrict the number of instances on a Terminal Server or Citrix XenDesktop, you must set the "Floating Seats" property when creating an Activation Key.

Below are the steps required to specify the number of allowed terminal server instances:

* Click on the Manage Keys tab.
* Click on the Create button.
* Specify the Floating Seats property to the number of instances allowed to run on the Terminal Server.
* Click OK

In your code, you must also set the LimitTerminalServerInstances property to _true_. The default value is _false_.

Note that an instance is uniquely identified by a session id and a user id. For example, if only 1 instance is allowed, **the same user can still launch your application multiple times within the same Terminal Server session.** That same user or another user will not be able to start another Terminal Server session and start another instance of your application.

As of QLM 9.2, if QLM detects that the maximum number of instances of your application has been reached, the returned error message includes information about the running instances.&#x20;
