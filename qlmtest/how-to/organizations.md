# Organizations

As of QLM 11.1.x, QLM supports the concepts of Organizations.

An organization has the following attributes:

* A name
* Primary and secondary contacts
* User Group
* Domain
* Notes

Each customer can belong to a single organization.

Organizations are meant to replace the Company field. For backward compatibility, the Company field will remain in the system.

&#x20;

**Migrating your data**

There are 2 ways you can migrate your data from the Company field to an Organization:

1\. By selecting a set of customers in the Manage Customers tab and setting their organization:

* Launch the QLM Management Console
* Go to the Manage Customers tab
* Click Organizations and create organizations as needed
* Select the required customer records in the Customers grid
* Click Set Organization
* Select and organization and click Ok
* The organization of all the selected records will be set to the selected organization

2\. By performing an automatic migration of all selected records in the Customers tab.

* Launch the QLM Management Console
* Go to the Manage Customers tab
* Select the required customer records in the Customers grid
* Click Migrate Organization
* Click Yes
* The organization of all the selected records will be set based on the Company field.

**Automatic setting of the Organization**

When a user is created, QLM can automatically select the organization and associate it to the user based on the Organizations' Domain attribute.

The Organization Domain attribute specifies a list of domain names that are associated to an organization.&#x20;

For example, given an Organization called Soraco, you would set the Domain of this organization to: %soraco.co, %soraco.ca

The % character is a wild character.

When a user is created, the system will try to match the user's email address to the Domain of the registered organizations. If a match is found, the user is linked to the Organization.
