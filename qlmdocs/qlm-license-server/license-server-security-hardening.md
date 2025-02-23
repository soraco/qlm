# License Server Security Hardening

### Overview

QLM provides a set of tools to harden the security of your License Server. This article describes all the configuration options available to you in order to secure your License Server. In addition to QLM hardening options, you should apply best practices at the networking and operating system levels to restrict access to the server.

### Network Security

The QLM License Server needs to be accessed by your customers over HTTPS. At the firewall level, you should only enable the HTTPS protocol and open up the required port to connect over HTTP (443).

In addition, you should consider disabling SSL and TLS / TLS 1.1. To disable SSL and TLS for the QLM application, you add the following entry in the License Server's web.config file, in the \<QlmWebService.Properties.Settings> section:

```xml
<setting name="securityProtocol" serializeAs="String">
      <value>3072</value>
</setting>      
```

| Protocol | Value |
| -------- | ----- |
| SSL3     | 48    |
| TLS      | 192   |
| TLS 1.1  | 768   |
| TLS 1.2  | 3072  |
| TLS 1.3  | 12288 |

Values can OR'ed together. For example, to enable support for TLS 1.1  and TLS 1.2, you would set the value to 768 + 3072 = 3849

### Operating System Security

Ensure that the latest Microsoft security updates are installed on a regular basis.

### Database

Ensure that the latest Microsoft SQL Server security updates are installed on a regular basis.

You should create a regular backup of your database and store it in a remote location.

### Backups

You should create a regular full backup of your server. For partial backups, you should make sure that the following components are backed up:

* IIS Configuration
* SQL Server Databases
* Folders where you deployed the QLM License Server

### QLM Security

#### Encryption Keys

The QLM .NET API uses a proprietary encryption mechanism to encrypt data over the wire in addition to HTTPS encryption. You can read details about this topic [here](https://support.soraco.co/hc/en-us/articles/115005268823-CommunicationEncryptionKey-and-AdminEncryptionKey). Ensure that the CommunicationEncryption and the AdminEncryptionKey do not have the same value.

#### Blocking IP Addresses

You can block a list of IP addresses from communicating with the License Server by configuring a list of blocked IP addresses in the [QLM Server Properties / options.](server-properties.md)

#### Blocking Computer IDs

You can block a specific computer from activating a license at two levels:

* Global List of blocked computer ID defined in [QLM Server Properties / options.](server-properties.md)
* List of denied computers defined per Activation Key.

#### HTTP Methods

QLM provides a series of HTTP methods that can be invoked from a URL. These methods can be individually enabled by in the **security** section of the [Server Properties](server-properties.md).

#### Allowed IP Addresses for HTTP Methods

Since HTTP Methods are designed to be called from a 3rd party platform such as an ecommerce provider, you can restrict access to these methods by IP Address.

This can be achieved with the help of 2 server properties:

* httpAdminMethods: List of HTTP methods considered to be administration methods. These methods can be protected by restricting the IP addresses that can call them.
* httpAdminMethodsAllowedIPAddresses: List of IP addresses that are allowed to call HTTP admin methods.

#### Allowed IP Addresses for Management API

Calling the QLM Management API (.NET API) requires knowledge of the AdminEncryptionKey. For additional security, you can limit access to the QLM Management API to a set of IP addresses.&#x20;
