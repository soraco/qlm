# LimitTerminalServerInstances

This attribute limits the number of instances of your application when running on a Terminal Server (Microsoft RDP or Citrix XenDesktop).

When set to true, the QLM ValidateLicense API will fail if the number of running instances is greater than the one defined in the license key.

An instance is defined as an instance of your application with a unique user id and a unique session id.

For example, if a user initiates a remote desktop session to a system, and launches 5 instances of your application, the 5 instances will count as one because the same user has launched the 5 instances in the same session.

If the same user then initiates another remote desktop session and launches 3 instances of your application, the total number of instances will be 2.

This feature is only available with QLM Professional and QLM Enterprise.

You can control the number of allowed instances on a terminal server session by setting the Floating Seats property when creating an Activation Key.
