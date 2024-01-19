# How to hide the URL arguments to QlmCustomerSite pages

QlmCustomerSite pages are typically invoked from a page on your website or a 3rd party tool. This implies that an end-user could potentially view the source of this page and extract the URL arguments you use to invoke the page. Additionally, some 3rd party tools impose a limit on the length of the arguments.&#x20;

To address these issues, QLM allows you to define your URL arguments in a server variable and then use the name of the server variable as your only URL argument.

**Defining a  server variable as a QLM Server Property**

The URL argument that you would normally specify to one of these pages would look like:&#x20;

{% code overflow="wrap" %}
```http
?is_productid=1&is_majorversion=1&is_minorversion=0&is_expduration=30&is_emailfrom=sales@soraco.co&is_emailsubject=Your Demo Trial Information&is_productname=My Product
```
{% endcode %}

To create a custom server variable that encapsulates these arguments:&#x20;

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* In the Name column, enter a name of your choice, for example: demo\_order
* In the Value column, enter (replace the values to match your product): _\&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=1. NewOrder_
* Click OK to close the Site Editor

**How to use your Server Variable**&#x20;

When invoking the QlmRegistrationForm.aspx or QlmRegistration.asmx, instead of passing along all the explicit arguments, you would pass the name of the variable specified above as the value of the is\_args variable.

Example 1:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistrationform.aspx?is_args=demo_order
```
{% endcode %}

Example 2:

{% code overflow="wrap" %}
```http
https://qlm3.net/qlmdemo/QlmCustomerSite/qlmregistration.asmx/Register?is_args=demo_order
```
{% endcode %}

_Note that if you are evaluating QLM and are using the Demo License Server, you cannot create your own custom properties on the Demo License Server._
