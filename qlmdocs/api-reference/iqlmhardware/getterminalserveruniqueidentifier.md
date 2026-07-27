# GetTerminalServerUniqueIdentifier

### Description

Gets a unique identifier for a Terminal Server user. The identifier is of the form:

```csharp
string GetTerminalServerUniqueIdentifier ()
```

### Return

<table><thead><tr><th width="113">Type</th><th>Description</th></tr></thead><tbody><tr><td>string</td><td><p>returns a unique identifier for a Terminal Server user. The identifier is of the form: </p><pre><code>&#x3C;SessionID>_&#x3C;RemoteHostName>_&#x3C;LoggedinUser>

Where:
SessionID is a number typically from 1-5 identifying the type of connection
RemoteHostName is the name of the computer connecting to the Terminal Server
LoggedInUser is the name of the user connecting to the Terminal Server



</code></pre></td></tr></tbody></table>
