# How to limit the number of deactivations

QLM provides 3 [server properties](../qlm-license-server/server-properties.md) that you can use to control the number of allowed deactivations.

**maxReleaseCount**: The maximum number of times an end-user can release a license.

**maxReleasePerClient**: When counting the number of released licenses for a given activation key, count only the ones associated to a specific client. By default, QLM counts all the released licenses for a given activation regardless of the client system.

**maxReleasePeriodInDays**: When counting the number of released licenses, only count the ones that have been released in the past "maxReleasePeriodInDays" days. For example, if you want to allow a user to release a license twice per month, set maxReleasePeriodInDays to 30 and maxReleaseCount to 2.

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360056445511/mceclip1.png)

&#x20;As of QLM v14, MaxReleaseCount and MaxReleasePeriodInDays can be configured per license. To configure these settings per license, locate a license in the Manage Keys tab, then click Edit and update these settings are required.

![mceclip3.png](https://support.soraco.co/hc/article\_attachments/360056292292/mceclip3.png)
