# Binding a license key to a computer

You sell a software product and you want to protect it against piracy by using license keys. You know you need to make sure users cannot reuse a license key on any computer. Now the tough decision: what unique identifier do you use to bind the license key to?&#x20;

The answer to this question depends on several factors. Let’s review some alternatives (this is not an exhaustive list):

* Computer Name: This is pretty straightforward. Hardware changes do not affect the license. A rename of the computer invalidates the license. Users could set up other computers with the same name on a different network to reuse the license key. The benefit of using a Computer Name is its reliability. It’s a solution that consistently works with minimal support issues. The drawback is that users could install the software on another machine if they give that machine the same name as the original system.
* MAC address of the network card: This is a pretty common approach although it could get complicated depending on the user’s hardware. Most computers nowadays have multiple network cards. Network cards are not always enabled and sometimes, in the case of USB network cards, they may not even be connected. Additionally, an advanced user can modify their MAC address at will.
* Volume Serial Number (VSN):  The VSN will change if the user reformats the volume. There are also tools that allow users to change the VSN.
* Motherboard serial number: This is a great option with the caveat that some motherboard manufacturers do not use reliable serial numbers. When extracting the SN, QLM tries to determine if the SN is unique by using data collected over many years from our customers.
* Active Directory Domain: for site licenses, binding the license to the Active Directory Domain Controller is a great option.

Given these choices, which option to pick depends on the following factors:

1. What is your target market?
2. Do you have a large support organization?
3. Do you have a large customer base?

If your target market is the enterprise market, small, medium or large, we recommend binding the license to the Computer Name. In medium and large companies, software piracy is not prevalent. In addition, most companies run a Domain Controller that manages all computers in the organization. It is not possible in this context to have two computers with the same name. It may not be practical either for a company to keep computers outside of the domain infrastructure to bypass licensing. Finally, corporate customers can get quickly frustrated if they start experiencing licensing issues after hardware changes. You need to balance security with customer satisfaction.

If your target market is the consumer market, then the decision is based on these factors:

* How many support calls can you handle?
* Is your software a prime target for hackers?
* &#x20;Is your software affordable?

If you are a one-man show or have a small support organization that is already busy on application-related issues, once again, we recommend the Computer Name approach. Dealing with license key issues is not your primary business and you certainly do not want to spend a good portion of your time figuring out what hardware change broke the license.

If your software is a prime target for hackers, then consider the Motherboard SN, Volume SN or Mac Address with the possibility of reverting to a Computer Name if these identifiers cannot be retrieved.

If your software is affordable, then it may be less of a target for hackers. Consumers do not mind paying a low price for a product that meets their needs. Piracy is most common with higher-priced products.

Whichever solution you end up picking, keep in mind that someone somewhere will always try to hack your software and get a free copy. Is it worth your while? Is it worth implementing a very strict license policy and potentially alienate paying customers to protect against a few hackers? It’s a decision you need to think about seriously as it has a direct impact on your bottom line, one way or another.

For more details about Quick License Manager's, visit our [web site](https://soraco.co/quick-license-manager).
