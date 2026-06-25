# Cloud License Reclamation

### Overview

_\[The Reclamation service described below is available as of QLM v20.0.26176.1]_

When using **QLM Cloud Licenses**, your QLM-protected application includes a built-in timer (via the `QlmCloudFloatingLicenseHelper` class) that periodically contacts the server to verify whether the license is still checked out.

### License Validation Frequency

You can control how often this validation occurs by setting the `QlmCloudFloatingLicenseHelper.QlmTimerFrequency` property.

> **Note:** For Soraco-hosted license servers, the minimum allowed validation interval is **3 hours**.

Each time a client validates a license with the server, the **Last Accessed Date** of the license is updated (available starting with QLM v20.x).

***

### License Reclamation

License Reclamation relies on the **Last Accessed Date** to determine whether a license is still actively in use.

As long as your application remains open, it continues to send heartbeat signals to the server, ensuring the license is considered active. A license is typically considered inactive in scenarios such as:

* The computer is shut down
* The system goes to sleep
* The device goes offline
* The application crashes

***

### Inactivity Threshold

During the reclamation process, the server compares the **Last Accessed Date** with the current date and time to decide whether a license should be reclaimed.

You can configure the inactivity window using the **Inactivity Threshold** setting:

* Navigate to:\
  **QLM Management Console → Manage Keys → Options → Cloud Licenses**

This setting defines how long a license can remain inactive before being reclaimed.

***

### Reclamation Timer Frequency

The **QLM Agent Service**, which is responsible for executing the reclamation process, contacts the server at regular intervals.

This interval is known as the **Reclamation Timer Frequency**, and can be configured at:

* **QLM Management Console → Manage Keys → Options → Cloud Licenses**

> **Note:** For Soraco-hosted license servers, the minimum allowed value for this interval is **6 hours**.

***

### Configuration

To enable license reclamation:

* Launch the QLM Management Console
* Go to the Manage Keys tab and select Options
* Go to the Cloud Licenses tab
* Select "Enable floating license reclamation"
* Select your License Server
* Set the Inactivity threshold in minuntes
* Set the timer frequency in minutes

Note that the [QLM Agent Service ](../../how-to/qlm-agent-service.md)must be running on your workstation.
