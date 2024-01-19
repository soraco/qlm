# Send aggregated email notifications per subscription, order or email

### Overview

When sending email notification reminders to your customers, you can configure the email to aggregate all licenses associated with a given subscription, order, or customer.

For example. a customer might have purchased a unique subscription for 3 of your products. To avoid sending the customer 3 email notifications, QLM can aggregate the information from the 3 products into a single email notification.

This feature is available in QLM Enterprise only as of QL Mv14.1.

### Scheduled Task Configuration

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Scheduled Tasks
* Click Add to add a new task
* Configure the task as required
* On the Email tab, set the Aggregate Emails field to: Per Subscription

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360088064151/mceclip0.png)

### Email Message Configuration

The email message of an aggregated email is comprised of 2 components:

* Customer and order-related information
* Product related information

Customer and order-related information is typically used in the top section of the email and would look like:

```html
Hi %FullName%,

This is a reminder for your subscription %ReceiptID%
```

Product-related information may contain multiple items and would look like:

```html
<p class="qlm_table">***qlm_table_start***</p> 

<table class="table_data" style="border-collapse:collapse;">
<tr >
<th class="td_header_products">Product</th>
<th class="td_header_products">Features</th>
<th class="td_header_products">Duration</th>
<th class="td_header_products"># Licenses</th>
<th class="td_header_products"># Floating</th>
</tr>
<tr>
<td class="td_row">%ProductName%</td>
<td class="td_num_row">%EnabledFeatures%</td>
<td class="td_num_row">%SubscriptionDuration%</td>
<td class="td_num_row">%NumLicenses%</td>
<td class="td_num_row">%FloatingSeats%</td>
</tr>
</table>
```

An example email template is attached to this article.

