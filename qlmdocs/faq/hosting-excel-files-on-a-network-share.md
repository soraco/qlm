# Hosting Excel files on a network share

If your customer wants to host your QLM protected Excel application on a network share, you will need to configure Excel to trust the specific network location as per the instructions below:

* Launch Excel
* Click File / Options
* Click Trust Center
* Click Trust Center Settings
* Click Trusted Locations
* Check the option "Allow Trusted Locations on my network"
* Click "Add new location"
* Enter the UNC path to the network share (do not use an IP address, use the machine name). Example: \\\soraco-16\TestShare\Excel

<figure><img src="../.gitbook/assets/image (109).png" alt=""><figcaption></figcaption></figure>

