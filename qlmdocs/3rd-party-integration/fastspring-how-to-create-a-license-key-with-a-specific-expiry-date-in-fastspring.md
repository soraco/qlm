# FastSpring - How to create a license key with a specific Expiry Date in FastSpring

The procedure below describes how to order a product via FastSpring with a specific expiry date. In this example, the expiry date is set to one year from the date of order but you can change the value in the script.

* Create a product in FastSpring.
* Asd a fulfillment action:
  * Select the "Generate a License" option.
  * Select Script (PHP or JavaScript).
  * Set the Output Format to: Single-Line License (Quantity Based).
  * Set the License Name to: Person Name.
  * Set the Script Type to: JavaScript
  * Click Create.
  * Copy paste the attached script.
  * Click Save.
* Test your order from FastSpring

In the script, you can change the duration of the expiry date by modifying this line:

//\
// Set the expiry to one year from today\
//\
endDate.setMonth(endDate.getMonth()+12);

* [fastspring-set-expirydate-script.txt](https://support.soraco.co/hc/en-us/article\_attachments/115010397686)1 KB [Download](https://support.soraco.co/hc/en-us/article\_attachments/115010397686)
