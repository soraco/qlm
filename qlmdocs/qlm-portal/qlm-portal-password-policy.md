# QLM Portal Password Policy

The QLM Portal uses ASP.NET Membership to authenticate users.

The default password strength of the ASP.NET Membership framework is set to a minimum password length of 7 characters with at least 1 non-alphanumeric character.

If you need to configure your membership provider to enforce specific strong password rules, you can use some very handy regular expressions, or you can set specific max and min requirements for numeric, alphabetic, and alphanumeric characters, by editing the QLM Portal's web.config file.

**Using minimum length and non-alphanumeric character**

{% code overflow="wrap" %}
```xml
<membership defaultProvider="QlmSqlProvider" userIsOnlineTimeWindow="20">
  <providers>
    <add minRequiredPasswordLength=10 minRequiredNonalphanumericCharacters=2 .../>
  </providers>
 </membership>
```
{% endcode %}

**Using regular expression**

{% code overflow="wrap" %}
```xml
<membership defaultProvider="QlmSqlProvider" userIsOnlineTimeWindow="20">
  <providers>
    <add passwordStrengthRegularExpression=
                    "^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,10}$" .../>
  </providers>
 </membership>
```
{% endcode %}
