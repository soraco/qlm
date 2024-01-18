# Length of QLM license keys

QLM packs several pieces of information in the license key. This information can be extracted at runtime to determine the type of license, the expiry date, the enabled features and so on.\
\
Depending on what information is packed in the license key, the length of the license key will vary.

&#x20;

| **Base Key Length**                        | 26 characters |
| ------------------------------------------ | ------------- |
| Trial Key - Duration based                 | +3 characters |
| Trial Key - Expiry date based              | +5 characters |
| With Features                              | +8 characters |
| With embedded seats (multiple activations) | +4 characters |

&#x20;

&#x20;

**Starting characters of QLM License Keys**

<table data-header-hidden><thead><tr><th width="165"></th><th></th></tr></thead><tbody><tr><td><strong>Character</strong></td><td><strong>Description</strong></td></tr><tr><td>A</td><td>Permanent Activation Key</td></tr><tr><td>B</td><td>Trial or Subscription Activation Key</td></tr><tr><td>E</td><td>Evaluation key that does not need activation </td></tr><tr><td>C</td><td>Computer Key, bound to the computer name (obsolete)</td></tr><tr><td>U</td><td>Computer key, bound to a user defined identifier</td></tr><tr><td>V</td><td>Computer key, bound to a user defined identifier, with expiry criteria</td></tr><tr><td>G</td><td>A <a href="https://support.soraco.co/hc/en-us/articles/200754034-How-to-use-Generic-license-keys-">generic</a> license key</td></tr></tbody></table>

&#x20;

[Read](https://support.soraco.co/hc/en-us/articles/215683603-License-Key-Types) about the definition of the different license key types.
