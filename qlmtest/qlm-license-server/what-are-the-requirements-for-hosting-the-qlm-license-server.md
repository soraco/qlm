# What are the requirements for hosting the QLM License Server?

The QLM License Server is an ASP.NET web service. The requirements on the server are:

* Windows 2012 R2 server or higher.
* .NET Framework 4.62
* SQL Server database  (any edition including SQL Express).
* Full Trust for .NET assemblies.

When you install the QLM License Server, in addition to installing the QLM License Server, the following components are also installed:

#### QLM Portal

The QLM Portal is a web-based administration tool to manage license keys.  The portal requires Microsoft SQL Server. The QLM Portal is an add-on to QLM that must be purchased separately.&#x20;

#### QlmCustomerSite

The QlmCustomerSite provides multiple web pages that you can expose to your customers for operations such as deactivating a license key, requesting a trial license, activating a license offline (on behalf of another system), etc.&#x20;

### Soraco License Server Hosting Plan

Soraco offers a yearly hosting plan for QLM License Server. What are the benefits of our hosting plan?

* Initial setup by us in less than 24 hours
* Daily backup to a remote site
* Daily replication to a Disaster Recovery Site
* Maintenance and upgrades performed by us
* Data recovery in case of data loss

#### Facts and limits of our License Server hosting service

* The cost of the QLM License Server Hosting does not include your QLM Professional or Enterprise licenses.
* The QLM License Server hosting service supports up to 100 new keys per day on average. If you expect to create more than 100 keys per day on a regular basis, please contact us. Note that occasional spikes are tolerated.
* Data is replicated once per day to a remote site.
* In case of a disaster at the primary site, you can automatically configure your application to connect to the DR site but activity on the DR site is not automatically resynchronized with the primary site.

For pricing information about the QLM License Server Hosting package, [click here](https://soraco.co/pricing/).
