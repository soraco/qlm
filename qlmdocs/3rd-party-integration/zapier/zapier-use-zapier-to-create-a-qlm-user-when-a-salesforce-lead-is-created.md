# Zapier - Use Zapier to create a QLM user when a SalesForce lead is created

If you use Zapier and salesforce.com and would like to automatically create a QLM user when a salesforce.com lead is created, follow the steps below:

&#x20;\[Note that this integration is available as of QLM 9.2.16346.1]

* Login to Zapier
* Click Make a Zap
* In the Choose a Trigger App, select: Salesforce
* Then, select New Lead
* Click Save & Continue
* If prompted, connect to your Salesforce account
* Click Fech & Continue
* Click View your lead and confirm that all the information is visible.
* Click Continue
* In the Choose an Action App, select "Code by Zapier"
* Select "Run javascript"
* Click Save + Continue
* In the Code section, paste the content of the attached script (addUser.js)
* Modify the URL in the script to match your QLM License Server
* In the Input Data section, add a row for each field in the address that you would like to map as follows:

| **QLM variable** | **SalesForce Mapping**               |
| ---------------- | ------------------------------------ |
| is\_vendor       | zapier                               |
| is\_vendor       | zapier                               |
| name             | Full Name                            |
| email            | Email                                |
| company          | Company                              |
| address1         | Street                               |
| address2         |                                      |
| phone            | Phone                                |
| region           | State/Province                       |
| country          | Country                              |
| postalcode       | Zip/Postal Code                      |
| city             | City                                 |
| is\_user         | QLM user name for Zapier integration |
| is\_pwd          | QLM password for Zapier integration  |

* You may also see the attached screenshot (SalesForceContactMapping.png).
* Click Continue
* Click Create and Continue
* Connect to QLM and verify that a user was created
* Click Finish
* Name your zap and turn it on.

While the Zap is on, new leads in Salesforce will be automatically created in QLM.

For more details about the _is\_user_ and _is\_pwd_ argument, refer to this [article](https://support.soraco.co/hc/en-us/articles/201702694-How-to-define-the-user-password-associated-to-an-eCommerce-provider).

&#x20;

* [SalesForceContactMapping.png](https://support.soraco.co/hc/en-us/article\_attachments/212022226)50 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/212022226)
* [addUser.js](https://support.soraco.co/hc/en-us/article\_attachments/211795803)1 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/211795803)
