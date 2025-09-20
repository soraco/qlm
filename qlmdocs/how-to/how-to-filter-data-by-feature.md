# How to filter data by feature

### Overview

Features are stored in the database using the following syntax: \<FeatureSet>:\<FeatureID1|FeatureID2|...>;\<FeatureSet><\<FeatureID1|FeatureID2|...>

For example, the built-in Demo product has the following features:

| Feature Set | Feature ID | Feature Name |
| ----------- | ---------- | ------------ |
| 0           | 1          | STD          |
| 0           | 2          | PRO          |
| 0           | 4          | ENT          |

If you enable all 3 features for a license, the information stored in the DB will be: 0:7;

### Filtering data based on database values

In the QLM Management Console, you can filter licenses based on the value of the Features field in the database. To do so:

* Go to the Manage Keys tab
* In the ad-hoc query section, set the following:
  * Field: Features
  * Operator: like
  * Value: 0:7
  * Click "search"

<figure><img src="../.gitbook/assets/image (1) (1) (1) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

### Filtering data locally in the grid

You can also filter data locally by using the grid features to group data by a specific column. Follow the instructions below to perform a local grouping of licenses by feature.

* Go to the Manage Keys tab
* Click 'all orders' to view all the orders in the system (you can also select another search based on your requirements)
* Locate the "Enabled Features" column in the grid
* Drag the "Enabled Features" column to the section labeled "Drag a column header here to group by that column"
* Licenses will now be grouped by enabled feature



<figure><img src="../.gitbook/assets/image (2) (1) (1) (1).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (3) (1) (1).png" alt=""><figcaption></figcaption></figure>
