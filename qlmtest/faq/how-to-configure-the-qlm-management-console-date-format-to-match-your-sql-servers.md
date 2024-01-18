# How to configure the QLM Management Console Date format to match your SQL Server's

If your SQL Server uses a date format that does not match the default date format used by the QLM Management Console (yyyy-MM-dd HH:mm:ss), you must update the date format settings of the QLM Management Console to match your server's.

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and select your site
* Click Server Properties
* Locate the "regional" category
* Update the following properties to match your SQL Server's format:
  * sqlDateFieldFormat - Default Value: Format({0}, "YYYY-MM-DD")
  * sqlDateTimeFormat - Default Value: yyyy-MM-dd HH:mm:ss
  * sqlDateValueFormat - Default Value: yyyy-MM-dd
