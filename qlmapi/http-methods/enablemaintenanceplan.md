# EnableMaintenancePlan

### Description

Enables the maintenance plan for a given activation key.

To invoke this method via a URL, append this function's name to the URL of the QLM License Server and add the required arguments.

{% code overflow="wrap" %}
```http
http://yourserver/yourvirtualdirectory/qlmservice.asmx/EnableMaintenancePlan?is_avkey=[activationKey]&is_maintplan=1&is_vendor=[vendor]&is_mainduration=[duration]
```
{% endcode %}

### Arguments

| Parameter         | Description                                                                                                                     |
| ----------------- | ------------------------------------------------------------------------------------------------------------------------------- |
| is\_vendor        | one of the supported vendors                                                                                                    |
| is\_avkey         | activation key                                                                                                                  |
| is\_maintplan     | flag to determine if the maintenance plan should be extended. If this argument is specified , the maintenance plan is extended. |
| is\_maintdate     | date at which the new maintenance plan should expire                                                                            |
| is\_maintduration | number of days by which to extend the maintenance plan as of today                                                              |
| is\_user          | username defined in Manage Keys / 3rd Party Extensions.                                                                         |
| is\_pwd           | password defined in Manage Keys / 3rd Party Extensions.                                                                         |

### Remarks

If neither is\_maintdate nor is\_mainduration are specified, the maintenance plan is extended based on the maintenancePlanPeriodInDays settings in the QLM License Server config file (web.config). The default value of maintenancePlanPeriodInDays is 365 days.

If is\_maintdate and is\_maintduration are both specified, is\_maintdate takes precedence.

The format of the date in is\_maintdate is based on the dateFormat settings in the License Server config file (web.config). The default format is: YYYY-MM-dd.

When invoking this method from an eCommerce provider, you can customize the url arguments for is\_avkey and is\_maintplan. Customization of these arguments requires subclassing of the eCommerce provider classes. For more details, contact us.
