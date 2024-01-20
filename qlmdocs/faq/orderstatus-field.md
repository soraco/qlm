# OrderStatus field

### Overview

The OrderStatus database field allows you to track the status of an order for each Activation Key.

The possible values of OrderStatus are:

| **Order Status**  | **Value**  | **DB Field Value** | **Description**             |
| ----------------- | ---------- | ------------------ | --------------------------- |
| EUndefined/ENone  | 0          | None               | the value was not set       |
| EInProgess        | 1          | In Progress        | the order is in progress    |
| ECompleted        | 2          | Completed          | the order is completed      |
| EUpgraded         | 4          | Upgraded           | the license was upgraded    |
| EReleased         | 8          | Released           | the license was deactivated |
| EArchived         | 16         | Archived           | the license was archived    |

You can set the value of the OrderStatus when creating an activation key by calling [CreateActivationKeyWithExpiryDateEx6](../api-reference/qlmlicense/management-methods/createactivationkeywithexpirydateex6.md) or directly by calling the [UpdateOrderStatus](../api-reference/qlmlicense/management-methods/updateorderstatus.md) method.

### Rules

When an Activation Key is upgraded, the OrderStatus is automatically changed to _EUpgraded_.

When an Activation Key is archived, the OrderStatus is set to _EArchived_.

When creating an Activation Key if the OrderStatus is set to _EInProgress_, the maintenance plan expiry date is not set until the license is activated. When the license is activated, the expiry date of the maintenance plan is set based on the server property _maintenancePlanPeriodInDays._ Upon successful activation, the orderStatus is set to _EComplete_.

### Searches

Searches created in QLM to query specific values of the Order Status should use the DB Field Name, as per the table above, in order to search for a specific status.&#x20;

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360071818131/mceclip0.png)
