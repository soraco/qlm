# EnableSoapExtension

When communicating with the License Server, QLM adds header information to the SOAP message sent to the server to provide metadata information to the server.

This metadata information includes:

\- Customer's locale settings

\- User Authentication settings (not currently used)

This allows the server to respond to the client in the proper locale. For example, if the client is running your application on a French operating system, the QLM License Server will return messages in French if you enable the Soap Extension property.
