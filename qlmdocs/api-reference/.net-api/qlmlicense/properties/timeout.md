# Timeout

Defines the time a client waits for a web service method to respond (in milliseconds).

Any QlmLicense method that contacts the QLM License Server uses this timeout value.

The default is 100000 milliseconds.

Setting the Timeout property to [Timeout.Infinite](https://msdn.microsoft.com/en-us/library/system.threading.timeout.infinite\(v=vs.110\).aspx) indicates that the request does not time out. Even though you can set the Timeout property to not time out, the Web server can still cause the request to time out on the server side.
