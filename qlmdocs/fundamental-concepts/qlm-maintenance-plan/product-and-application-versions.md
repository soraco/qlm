# Product and Application Versions

## Understanding QLM Product Versions vs. Application Versions

When implementing a maintenance plan in Quick License Manager (QLM), it is important to understand that **your application version and your QLM product version do not have to match**. The QLM product version exists primarily for **licensing and upgrade entitlement management**, not to mirror every version of your application.&#x20;

### QLM Product Versions Are Used for Licensing

In QLM, product versions are used to determine whether a customer is entitled to activate and run a specific version of your software. When a maintenance plan is enabled, QLM verifies that the customer's maintenance entitlement covers the version they are attempting to use.&#x20;

The version definitions in QLM are therefore a business and licensing decision rather than a reflection of your application's exact version numbering scheme.

### Controlling Upgrades by Major Version Only

In many cases, software vendors want customers to receive all minor updates within a major release, while requiring a maintenance plan or upgrade purchase to move to a newer major release.

For example, suppose your application versions evolve as follows:

* 1.0
* 1.1
* 1.2
* 1.3
* 2.0
* 2.1
* 2.2
* 3.0

If customers who purchased version 1.x should be allowed to upgrade to any 1.x release without restriction, you would only define the following versions in QLM:

* MyProduct 1.0
* MyProduct 2.0
* MyProduct 3.0

In this scenario:

* Application versions 1.0, 1.1, 1.2, and 1.3 all map to **QLM Product 1.0**
* Application versions 2.0, 2.1, and 2.2 all map to **QLM Product 2.0**
* Application version 3.0 maps to **QLM Product 3.0**

This approach simplifies license management while still allowing you to control access to major releases. QLM's maintenance plan framework only requires you to create the versions that you want to use for entitlement decisions. In fact, if you only need to control upgrades between major releases, there is no need to create minor versions in QLM.

### Controlling Upgrades by Minor Version

If you need more granular control over upgrades, then the corresponding minor versions must be defined in QLM.

For example, if customers should only be entitled to specific minor releases, you might define:

* MyProduct 1.0
* MyProduct 1.1
* MyProduct 1.2
* MyProduct 2.0
* MyProduct 2.1

This configuration allows QLM to distinguish between individual minor releases and enforce maintenance plan eligibility at that level.

### Where QLM Product Versions Are Defined

QLM product versions are created and managed from the **QLM Management Console**:

1. Open **QLM Management Console**
2. Go to **Define Products**
3. Click **New**
4. Select **Create a new version of an existing product**
5. Choose the product to version
6. Update the product information and release date as needed&#x20;

The release date associated with each QLM product version is used by the maintenance plan framework to determine whether a customer's maintenance entitlement covers that version.&#x20;

### Best Practice

Before creating versions in QLM, decide how you want to manage upgrades:

* **Major-version licensing only:** Define only major versions in QLM.
* **Major and minor version licensing:** Define both major and minor versions in QLM.
* **Maximum simplicity:** Create the minimum number of QLM versions required to enforce your upgrade policy.

Remember: **QLM product versions are licensing milestones, not necessarily application release numbers.** Define versions in QLM according to the upgrade rights you want to enforce for your customers.
