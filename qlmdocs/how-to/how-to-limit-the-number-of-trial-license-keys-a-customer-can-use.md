# How to limit the number of trial license keys a customer can use

We've added the ability to limit the number of trials for a given client. Note that this only works for trial licenses that require activation.

To use this feature, you need to upgrade to QLM 7.0.14103.x or higher.

On the License Server, you need to configure the following settings:

* Go to the Manage Keys tab
* Click Sites and select your site
* Go to the Server Properties tab
* Set: enforceMaxTrialsWhenActivating: true
* Set: numberOfTrialLicensesAllowedPerClient: -1 (means infinite) or any value >= 0
* Set: countRevokedTrials to true to take into account revoked trials.
* Set: enforceMaxTrialsMatchComputerIDOnly to true if you want to match against the computer ID only. By default, QLM tries to match both the computerID and computerName.

The feature works as follows: when a client tries to actviate a trial license, we check in the database if another client with the same computerID and computerName has a trial license already registered. If yes, then the numberOfTrialLicensesAllowedPerClient value is verified and the activation request is rejected if the threshold has been exceeded.

Notes:

* There is a potential for conflict if 2 customers have the same computerID and computerName.
* These settings only take effect if the LicenseModel is "trial"
