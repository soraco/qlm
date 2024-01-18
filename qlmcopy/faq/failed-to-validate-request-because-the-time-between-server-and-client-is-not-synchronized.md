# Failed to validate request because the time between server and client is not synchronized

When calling a web service method, you may get the error:

_"Failed to validate request because the time between server and client is not synchronized. Difference in time is > xxx"_

QLM validates that the time on the client is within a certain threshold from the time on the server. This is to avoid hackers from intercepting activation requests and playing them back later on.

To resolve this issue, you have 2 choices:

1. Option 1: Ask the end user to make sure the time on his system is correct and always synchronized with a time server.
2. Option 2: Increase the threshold that QLM allows. This threshold value is configurable from Manage Keys / Sites / Server Properties / options / webMethodMaximumDelay. The default value is 600 seconds (10 minutes).&#x20;
