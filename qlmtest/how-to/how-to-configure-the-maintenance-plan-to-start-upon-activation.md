# How to configure the maintenance plan to start upon activation

When you create an Activation Key and enable the maintenance plan, the maintenance plan renewal date is automatically set to today's date + 1 year.

In some cases, you may want to delay the start of the maintenance plan period until the license is activated. This is typically the case when you create activation keys in bulk prior to the license being purchased by your customer.

With QLM 9.2.17002.1 and later, you can delay the start of the maintenance plan until the license is activated. To do so, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click "Create Activation Key"
* Select your product and any other setting as required
* Check the Maintenance Plan checkbox
* Go to the Advanced tab
* Set the Order Status drop down to EInProgress.
* Click Ok

Once you complete the steps above, a new Activation Key is created but the maintenance plan date is not set yet. It will only be set once the key is activated.

For this feature to work, both the QLM Management Console and your QLM License Server must be running a version later than 9.2.17002.1.
