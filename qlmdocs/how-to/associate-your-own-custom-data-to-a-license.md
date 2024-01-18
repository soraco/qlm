# Associate your own custom data to a license

The QLM database includes a field called UserData1 which can be used to store any information of your choice and associate it to a license.

#### UserData1 in the main License Keys table&#x20;

The UserData1 field in the main license keys table can be used to associate any custom data of your choice to a license key.&#x20;

We recommend that you store data in a structured form such as in XML or Json so that you can easily store additional information in the future as your requirements evolve.

There are 2 APIs available to set and get user data: [GetUserData](https://support.soraco.co/hc/en-us/articles/207609893-QlmLicense-GetUserData) and [SetUserData](https://support.soraco.co/hc/en-us/articles/207609833-QlmLicense-SetUserData)

Additionally, most of the QLM HTTP APIs allow passing the user data as via the  is\_userdata1 URL argument.

#### UserData1 in the Activation Log table

For license keys that allow multiple activations (number of activations > 1), you can also store your own custom data for each activation of a license. Activation information is stored in a separate table called Activation Log.

We recommend that you store data in a structured form such as in XML or Json so that you can easily store additional information in the future as your requirements evolve.

There are 2 APIs available to set and get user data: [GetUserDataFromActivationLog](https://support.soraco.co/hc/en-us/articles/207295126-QlmLicense-GetUserDataFromActivationLog) and [SetUserDataInActivationLog](https://support.soraco.co/hc/en-us/articles/207609823-QlmLicense-SetUserDataInActivationLog)
