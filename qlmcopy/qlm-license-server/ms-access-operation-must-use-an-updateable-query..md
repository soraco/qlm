# MS-Access - Operation must use an updateable query.

You have configured QLM to use an MS-Access database and you receive the following error message:

**Operation must use an updateable query**\
\
The error indicated the QLM is not able to write to your MDB file.\
This can be caused by one of 2 reasons:\
\
1\. The .mdb file is read-only\
2\. The user running the web service does not have "write" privileges on the mdb file or its folder.\
\
The 2nd reason is the most likely one. If you have configured the web service to allow Anonymous connections then you have 2 options to resolve this issue:\
\
1\. Give the Anonymous user (IUSR\_XXX) write privileges to the folder where the .mdb file is located\
2\. Configure the web service to use an Application Pool. In the Application Pool , configure the Identity with a user account that has "write" privileges on the folder where the mdb file is located.
