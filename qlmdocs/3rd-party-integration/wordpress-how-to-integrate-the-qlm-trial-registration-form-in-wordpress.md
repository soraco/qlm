# WordPress - How to integrate the QLM Trial Registration form in WordPress

To display the QLM Trial Registration Form on a WordPress page, follow the steps below:

* Create a WordPress Page
* Add a Text Block to your WP page
* In the Text Block, switch to Source Code view
* Paste the html code below

\<iframe\
style="border: 0px #ffffff none;"\
src="http://yourserver.com/QlmCustomerSite/QlmRegistrationForm.aspx?is\_args=your\_args"\
name="myiFrame"\
width="100%"\
height="580px"\
frameborder="1"\
marginwidth="0px"\
marginheight="0px"\
scrolling="no"\
allowfullscreen="allowfullscreen">\
\</iframe>

* Click Ok and then click Update to save your WP page.
* In the URL above:
  * Replace the URL with the URL pointing to your site
  * Replace the argument to the URL with the arguments that correspond to your product

&#x20;To learn about the arguments supported by the Trial Registration form, check these articles:

* [How to generate a trial key from your web site](https://support.soraco.co/hc/en-us/articles/205933400-How-to-generate-a-trial-key-from-your-web-site)
* [How to hide the URL Arguments of the QlmRegistrationForm.aspx](https://support.soraco.co/hc/en-us/articles/211568803-How-to-hide-the-URL-arguments-of-the-QlmRegistrationForm-aspx-or-QlmRegistration-asmx-pages)
