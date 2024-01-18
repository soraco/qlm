# Error: Invalid column name 'xxx' in the QLM Management Console

When performing any operation in the QLM Management Console that communicates with the QLM License Server, such as activating a license or deactivating a license, an error saying "Invalid column name" typically means that there is a discrepency between the version of the QLM Management Console and the version of the QLM License Server.

To resolve this issue, follow the recommendations below.

**Version mismatch**

To identify whether there is a version mismatch, you need to first determine the version of the QLM Management Console and the version of the QLM License Server.

To determine the version of the QLM Management Console:

* Launch the QLM Management Console
* Go to the Get Started tab
* Locate the "QLM Version Information" tile and note your version

![](https://support.soraco.co/hc/article\_attachments/360000697563/mceclip1.png)

To determine the version of the QLM License Server:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and then select your License Server
* Click the Test button of the Primary Site
* The first result returned by the test includes the version of the QLM License Server
* Locate the "QLM Version Information" tile and note your version

![](https://support.soraco.co/hc/article\_attachments/360000704566/mceclip0.png)

If the 2 versions are identical, proceed to the next step. If they are not, upgrade your system so that both versions are identical.

&#x20;

**Out of date DB Schema**&#x20;

Once you have ensured that the QLM Management Console and the QLM License Server are running the same version, you must verify that the QLM License Server Database Schema is up-to-date. A database schema update is typically required whenever you ugprade your QLM License Server to a newer version.

To upgrade the DB schema of the License Server:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and then select your License Server
* Click the "Upgrade DB Schema " button
* Verify that all the results returned when upgrading the schema are successful.

![](https://support.soraco.co/hc/article\_attachments/360000697663/mceclip2.png)
