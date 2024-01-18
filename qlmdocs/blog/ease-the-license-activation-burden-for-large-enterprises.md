# Ease the license activation burden for large enterprises

When selling licenses to enterprise customers with potentially thousands of computers, having each user manually activate each license is not a viable solution.

There are several ways to ease the burden for large companies while at the same time providing an adequate level of protection for your application.

**Solution 1**

The first approach involves providing a special license key that does not require activation on every single node. At the time of purchase, the customer receives a special activation key. Typically, when an activation key is activated, a computer bound key is generated and returned to the client. In this case, instead of generating a computer bound key, a generic key is created that can be reused on other system. With this approach, the customer needs to activate the license on one computer and then reuse the generated key on all other computers. The generated key could be located in a central location that your application is aware of. The first time your application is launched, it would retrieve the generic key from the central location and validate it.

With this approach the generated license key can be used to install any number of systems so this is suited for unlimited licenses.

&#x20;

**Solution 2**

\
Another approach involves binding the license key to the company’s domain name. At the time of purchase, the customer receives a standard activation key. When the first system activates the license, a computer key bound the company’s domain name is generated. This computer key can then be used on any computer within that domain. As with the approach above, your application would need to pick up this computer key from a central location such as a share or a database and then validate it when the application starts up.

With this approach the generated license key can be used to install your application on any number of systems within the specified domain so this is suited for unlimited Site licenses.

**Solution 3**

Yet another approach involves a fully automated way of activating license keys and binding them to each specific computer. At the time of purchase, the customer receives a standard activation key with the number of seats embedded in the license key. The activation key would then be stored in a central location on the customer’s network such as on a share or a database. The first time your application is launched, it would retrieve the activation key from the central location and automatically activate it. The activation process generates a computer bound license key that would then be stored on the client system. Subsequently, whenever your application is launched, your retrieve the computer key from the client and validate it.
