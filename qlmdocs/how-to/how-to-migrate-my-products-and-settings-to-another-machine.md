# How to migrate my products and settings to another machine?

### QLM Pro /  Enterprise Users 5.2 or later <a href="#h_01hbdvpw4mt71a334hca07cczv" id="h_01hbdvpw4mt71a334hca07cczv"></a>

It is highly recommended that you back up your QLM License Server before migrating your products to a new client system.

_IMPORTANT:_

Make sure you NEVER  "**upload products** to the License Server" from the new system until it has the new product definitions. If you are presented with a prompt to upload your products to the server, answer **NO or Cancel**.

#### If the computer on which QLM is already installed is operational: <a href="#h_01hbdw63payjcgqfwth2fztaq0" id="h_01hbdw63payjcgqfwth2fztaq0"></a>

* Make a backup of the following folder, **including subfolders**, on the old system:
  * %appdata%\Soraco\Quick License Manager
  * %localappdata%\Soraco\_Technologies\_Inc\IsQuickLicenseMgr\*\_StrongName\_\<xxx>\w.x.y.z\user.config
* Copy the backed-up files from the old system to the corresponding location on the new system.
* Edit the %appdata%\Soraco\Quick License Manager\profiles.xml file in a text editor (_this step is not needed if you're running the latest version of QLM)_
  * Locate the entries productsFile, queriesFile and emailTemplatesFolder
  * If the path is hardcoded for a specific user, update the path based on the new system's path
  * For example, if your user account on the old system was called "tom" if you see a path that looks like: "c:\users\tom\AppData\Roaming\Soraco\Quick License Manager\\..." and your new user account is "tommy", you should update the path to be "c:\users\tommy\AppData\Roaming\Soraco\Quick License Manager\\..."
* Deactivate or uninstall QLM from the old system
* Install QLM on the new system
* Launch QLM&#x20;
* Step through the QLM License Wizard to activate your license
* Close QLM
* On the new system, go to the following folder in Windows Explorer: %localappdata%\Soraco\_Technologies\_Inc\IsQuickLicenseMgr\*\_StrongName\_\<xxx>\w.x.y.z
* Copy the backed-up user.config file to the folder above.

#### If the computer on which QLM is already installed is not operational: <a href="#h_01hbdw68ntqefjnr8nhq9bgdkm" id="h_01hbdw68ntqefjnr8nhq9bgdkm"></a>

* Install QLM on the new system
* Launch QLM&#x20;
* Step through the QLM License Wizard to activate your license
* Go to the Manage Keys tab and click Sites
* Add your site
* Click "Download your products from the License Server"
* Click Ok

#### **Limitations** <a href="#h_01hbdvpw4mq4mt0y92r3svvn16" id="h_01hbdvpw4mq4mt0y92r3svvn16"></a>

Note that as per our [EULA](http://soraco.co/products/qlm/QlmLicense.pdf) you are limited to transferring a license 4 times per year. The relevant section in the EULA is included below.

![](https://support.soraco.co/attachments/token/aUcubhviFxr0dtJwAdCzkG8A6/?name=inline-1029670197.png)

&#x20;

### QLM Express Users 5.2 or later <a href="#h_01hbdvpw4mhwvc7evhxrckpq0p" id="h_01hbdvpw4mhwvc7evhxrckpq0p"></a>

To transfer the definition of your product to another machine:\
\
\- Make a backup of the products.xml file. This file is located in:

C:\Users\\\[your user name]\AppData\Roaming\Soraco\Quick License Manager

After installing QLM on the new system, copy the backed-up products.xml file to the new system in the appropriate folder as described above.

#### &#x20; <a href="#h_01hbdvpw4mh74qp2zxr0s0324f" id="h_01hbdvpw4mh74qp2zxr0s0324f"></a>

### QLM Pro / Enterprise Users 4.x or 5.1 <a href="#h_01hbdvpw4m0apd4h5zr76nndb2" id="h_01hbdvpw4m0apd4h5zr76nndb2"></a>

The procedure below applies to QLM Pro users.\
\
To transfer the definition of your product to another machine:\
\
\- Make a backup of all the QLM data files. QLM data files are located in:

C:\Users\\\[your user name]\AppData\Roaming\Interactive Studios\Quick License Manager

After installing QLM on the new system, copy the backed-up files file to the new system in the appropriate folder as described above.\
\


### QLM Express Users 4.x or 5.1 <a href="#h_01hbdvpw4m9chjeb5wev33wybp" id="h_01hbdvpw4m9chjeb5wev33wybp"></a>

To transfer the definition of your products to another machine:\
\
\- Make a backup of the products.xml file. This file is located in:

C:\Users\\\[your user name]\AppData\Roaming\Interactive Studios\Quick License Manager

After installing QLM on the new system, copy the backed-up products.xml file to the new system in the appropriate folder as described above.

### QLM 3.x Users <a href="#h_01hbdvpw4mbcbxt1gj3zg591by" id="h_01hbdvpw4mbcbxt1gj3zg591by"></a>

To transfer the definition of your product to another machine:\
\
\- Make a backup of the products.xml file. This file is located in the following folder:

C:\Program Files\Interactive Studios\QuickLicenseMgr

After installing QLM on the new system, copy the backed-up products.xml file to the new system in the appropriate folder as described above.
