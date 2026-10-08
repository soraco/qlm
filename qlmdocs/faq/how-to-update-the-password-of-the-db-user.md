# How to update the password of the DB user

To connect to the database, QLM creates a default user called _qlm\_user_ with a default password. Before going live with your server, you should update the default DB password as per the instructions below.

### QLM v20

**A. Change the password in SQL Server**

* Launch SQL Server Management Studio
* Go to the Security node
* Expand the Logins node
* Locate the qlm\_user user
* Right-mouse click and select Properties
* Update the password
* Click Ok

**B. Change the appsettings.json files**

* On the server where you installed the QLM License Server
* Edit the appsettings.json file of the QlmLicenseServerNetCore
* Locate the ConnectionStrings/DefaultConnection section and update the password
* Repeat the same steps for the appsettings.json file of QlmCustomerSiteNetCore, QlmPortalNetCore, and QlmCustomerPortalNetCore/qlm-portal-api



### QLM v19 and earlier

**A. Change the password in SQL Server**

* Launch SQL Server Management Studio
* Go to the Security node
* Expand the Logins node
* Locate the qlm\_user user
* Right-mouse click and select Properties
* Update the password
* Click Ok

**B. Change the appsettings.json files**

* On the server where you installed the QLM License Server
* Edit the web.config file of the QlmLicenseServerNetCore
* Locate the ConnectionStrings section and update all occurences of the password
* Repeat the same steps for the web.config file of QlmCustomerSiteNetCore, QlmPortalNetCore, and QlmCustomerPortalNetCore/qlm-portal-api
