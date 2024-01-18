# IsolatedStorageException calling StoreKeys in an ASP.NET application

The QLM API provides 2 helper methods for storing the license keys on the end user system and reading them back (StoreKeys/ReadKeys). For more details about this API, review this [article](http://soracoinc.com/Forum/tabid/68/forumid/4/threadid/29/scope/posts/Default.aspx).

When operating in the context of an ASP.NET application, the user running the ASP.NET application needs to have the required privileges to write to the file system.

The recommended approach is to create a specific Application Pool for your ASP.NET Application (virtual directory) and then set the identity of the Application Pool to a specific user. If you are using IIS 7.x, you may also want to set the **LoadUserProfile** property of the Application Pool to true.

\
If you do not want to follow the recommendation above, you can store the license keys in any location of your choice. The StoreKeys/ReadKeys API are optional and simply offer a quick convenient way to store and read license keys. If your application is associated to a database for example, you can store the keys in your database.
