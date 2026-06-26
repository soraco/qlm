# Cloud License Reclamation

### Overview

_\[The Reclamation service described below is available as of QLM v20.0.26177.4]_

When using **QLM Cloud Licenses**, your QLM-protected application includes a built-in timer (via the `QlmCloudFloatingLicenseHelper` class) that periodically contacts the server to verify whether the license is still checked out.

### License Validation Frequency

You can control how often this validation occurs by setting the `QlmCloudFloatingLicenseHelper.QlmTimerFrequency` property.

> **Note:** For Soraco-hosted license servers, the minimum allowed validation interval is **3 hours**.

Each time a client validates a license with the server, the **Last Accessed Date** of the license is updated (available starting with QLM _v20.0.26177.4]_).

### License Reclamation

License Reclamation relies on the **Last Accessed Date** to determine whether a license is still actively in use.

As long as your application remains open, it continues to send heartbeat signals to the server, ensuring the license is considered active. A license is typically considered inactive in scenarios such as:

* The computer is shut down
* The computer goes to sleep
* The computer goes offline
* The application crashes

### Inactivity Threshold

During the reclamation process, the server compares the **Last Accessed Date** with the current date and time to decide whether a license should be reclaimed.

You can configure the inactivity window using the **Inactivity Threshold** setting:

* Navigate to:\
  **QLM Management Console → Manage Keys → Options → Cloud Licenses**

This setting defines how long a license can remain inactive before being reclaimed.

### Offline Licenses

If a license was checked-out for offline usage, the reclamation process honors the offline expiry date. If the offline expiry date has been reached, the license will be reclaimed.

### Reclamation Process

The reclamation can be triggered automatically via the QLM Agent service or manually.

When enabled, the **QLM Agent Service** contacts the server at regular intervals and performs the reclamation process. This interval can be configured at:

* **QLM Management Console → Manage Keys → Options → Cloud Licenses**

> **Note:** For Soraco-hosted license servers, the minimum allowed value for this interval is **6 hours**.

To manually trigger the reclamation process, go to **QLM Management Console → Manage Keys → Options → Cloud Licenses** and click 'Relcaim inactive licenses now".

### Configuration

To enable license reclamation:

* Launch the QLM Management Console
* Go to the Manage Keys tab and select Options
* Go to the Cloud Licenses tab
* Select "Enable floating license reclamation"
* Select your License Server
* Set the Inactivity threshold in minutes
* Set the timer frequency in minutes

Note that the [QLM Agent Service ](../../how-to/qlm-agent-service.md)must be running on your workstation.

### Important Note

If you have upgraded from a previous version of QLM, you should wait 24 hours following the upgrade before enabling license reclamation. If you do not, licenses that are still active will be reclaimed.
