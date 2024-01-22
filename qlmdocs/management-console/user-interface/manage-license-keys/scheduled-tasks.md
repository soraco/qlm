# Scheduled Tasks

QLM can schedule and execute tasks such as emailing notifications to your customers or displaying alerts when the QLM database is updated. QLM includes one built-in email scheduled task designed for implementing a Maintenance Plan for your product and several alert-type tasks. You can use these tasks as is, customize them to suit your needs, or create other scheduled tasks that meet your special needs.

Note that for tasks to run, the Quick License Manager Agent must be running.

Below are the steps required to create scheduled tasks:&#x20;

* Click on the Manage Keys tab.&#x20;
* Click on the Scheduled Tasks button.&#x20;
* Click on Add.&#x20;
* If you have multiple web servers, select the License Server profile to use. Otherwise, select the Default profile.&#x20;
* Select the Search to execute. The scheduled task will be executed on each record returned by the search.&#x20;
* Specify how often the task will run.&#x20;
* To configure an Email notification task, click on the Email tab and check the Enable Email Notification box, then fill in all the remaining fields.&#x20;
* To configure an Alert notification task, click on the Alert tab and check the Enable Alert box, then fill in all the remaining fields. The Message field supports variables such as %FullName% or %ActivationKey%.&#x20;
