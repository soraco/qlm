# How to use Generic license keys

### Overview

Generic license keys are designed for large installations with hundreds or thousands of clients. In these types of installations, requiring each client to activate their license online may not be an option. To address this, QLM offers the concept of a Generic License.&#x20;

When a customer purchases a license of your software either for a very large number of clients or an unlimited license, you can issue this customer an Activation Key and flag the Activation Key as a Generic license.&#x20;

When the customer installs your application, they are required to activate the license once. Upon activation, the QLM License Server typically returns a license key bound to the client computer. However, when the activation key is marked as Generic, the QLM License Server will return a license key that will work on any computer.

Once the customer receives the generic license key returned by the QLM License Server, they can use this key on all other systems without performing any activation.

To automate this process, you may want to add an option in your application to read the license key from a network share. Doing that would allow your customer to simply save the license key in a file on a network share that is accessible to all clients. Clients would then automatically pick up the license without requiring the user to enter the key.

When creating an Activation Key with the Generic Option, you do not need to specify the Number of Activations per key nor the number of floating seats (leave the default of 1).

### How to create a Generic Key

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click "Create Key"
* Select your product and any other setting as needed
* Go to the Advanced tab and select "Generic license"
* Click OK

Once the Activation Key is generated, you can provide it to the customer. When they activate it, the server will generate a Generic License instead of a Computer Bound Key.

Alternatively, you can activate the license on behalf of the customer and provide them with the Generic License Key. When activating a license, you can set any value for the Computer ID field.

### **Important**

As of QLM v17, Generic Keys are disabled by default. To enable generic license keys on the client side, you must set the QlmLicense.AllowGenericKeys to true. To enable generic license keys on the server side, you must set the "security/AllowGenericKeys" server property to true.

**Beware, Generic Keys are dangerous.** A Generic Key is not bound to a customer nor a computer. Anyone who gets access to a Generic Key will be able to run your application on any computer and potentially forever if the key does not have an expiry date.
