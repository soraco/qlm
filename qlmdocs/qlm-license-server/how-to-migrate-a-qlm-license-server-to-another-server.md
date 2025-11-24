# How to migrate a QLM License Server to another server

### License Server Migration Steps

If you are using QLM Pro or Enterprise and need to migrate your license server to a new server, follow the procedure below.

* Install the QLM License Server on the new server, along with a new QLM database. For details on how to install the QLM License Server, check this [article](https://support.soraco.co/hc/en-us/articles/202937924-How-to-install-the-QLM-License-Server).
* Configure a new profile in the QLM Management Console to connect to the new License Server
  * From the Manage Keys tab, click Sites
  * Click Add to add a new profile
  * Enter the URL of the new profile along with the encryption keys
  * Test the profile and make sure all tests pass
* Create a SQL Server backup of the existing database from the SQL Server Management Studio.
* Create a SQL login user (with the same password) identical to the one used by QLM on the previous server.&#x20;
* On the new server, restore the backup over the existing database created during the installation of the QLM License Server.
* Finally, you must upgrade the database schema as described in this [article](how-to-perform-a-db-schema-upgrade.md).

### Additional Considerations

If the new License Server URL is different from the old one and you have existing customers pointing to the old server, you will need to setup a redirect to redirect existing customers to the new server.

### Soraco Migration Service

We offer a service to remote connect and migrate your server to a new system. The cost of this service can be found [here](https://soraco.co/product/qlm-license-server-installation/). In order to use our service, you must meet the following requirements:

The server where you will be hosting the QLM License Server must be preconfigured with the following components:

* All Windows Security Updates
* Microsoft SQL Server 2016 or above
* Microsoft SQL Server Management Studio
* IIS must be configured as described [here](https://docs.soraco.co/docs/qlm-license-server/iis-features-on-windows-server-2012-or-higher)
* A connection to your new server should be enabled via RDP or AnyDesk.
* A connection to the old server should be enabled via RDP or AnyDesk.



&#x20;
