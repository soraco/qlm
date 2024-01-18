# Could not find product x.y

If you are evaluating QLM and you get an error when creating an Activation Key that says: "Could not find product x.y", the reason is typically that you have created your own product in the QLM Management Console / Define Products tab but are using our Demo License Server.

By default, when you are evaluating QLM, your QLM Management Console is configured to connect to a License Server hosted on our server for the purpose of evaluating QLM. We call this License Server the "Demo License Server". You can check if you are connected to the Demo License Server by going to the Manage Keys tab, then clicking on Sites. If you are connected to our Demo License Server, the URL defined in the Primary Site field would be: [https://quicklicensemanager.com/qlmdemo/qlmLicenseServer/qlmservice.asmx](https://quicklicensemanager.com/qlmdemo/qlmLicenseServer/qlmservice.asmx)

Since the Demo License Server is shared by all our potential clients who are evaluating QLM, we do not allow uploading your own products to this server. The Demo License Server is only aware of the 4 products that the trial version of QLM ships with and these are: Demo 1.0, Demo 1.1, Demo 2.0, and Demo Enterprise 1.0.

During the trial, we recommend that you use the Demo 1.0 product and pretend that your product is called Demo and its version is 1.0. Once you complete your trial and purchase QLM, you will just need to update some basic information to switch the licensing to your own product.

Alternatively, you can install a License Server on your own server. This will allow you to bypass this restriction and define your own products. The requirements to install the QLM License Server can be found [here](https://support.soraco.co/hc/en-us/articles/200229459-What-are-the-requirements-for-hosting-the-QLM-License-Server-). Installation instructions can be found [here](https://support.soraco.co/hc/en-us/articles/202937924-How-to-install-the-QLM-License-Server).
