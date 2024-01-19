# How to enable attaching images to an email

By default, for security reasons, the QLM Portal does not allow attaching images to an email.

To enable this functionality, you must modify the permissions of 2 folders where images are uploaded.

On your server, locate the following 2 folders:

c:\inetpub\wwwroot\Qlm\QlmPortal\UploadedImages

c:\inetpub\wwwroot\Qlm\QlmPortal\App\_Data\UploadTemp

&#x20;For each folder, modify the NTFS permissions as follows:

User: IUSR, Permissions: Modify, Read & execute, List folder contents, Read, Write

User: IIS\_IUSRS, Permissions: Modify, Read & execute, List folder contents, Read, Write
