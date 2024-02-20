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

<table data-header-hidden><thead><tr><th width="165"></th><th></th><th></th><th></th></tr></thead><tbody><tr><td><strong>Character</strong></td><td><strong>Description</strong></td><td>Model</td><td>Binding Type</td></tr><tr><td>A</td><td>Activation Key</td><td>Permanent</td><td>Node Locked</td></tr><tr><td>B</td><td>Activation Key</td><td>Trial</td><td>Node Locked</td></tr><tr><td>C</td><td>Computer Key</td><td>Permanent</td><td>Node Locked/Computer Name</td></tr><tr><td>D</td><td>Computer Key</td><td>Trial</td><td>Node Locked/Computer Name</td></tr><tr><td>E</td><td>Generic Key</td><td>Trial</td><td>N/A</td></tr><tr><td>F</td><td>Activation Key</td><td>Subscription</td><td>Node Locked</td></tr><tr><td>G</td><td>Generic Key</td><td>Permanent</td><td>N/A</td></tr><tr><td>J</td><td>Computer Key</td><td>Subscription</td><td>Node Locked</td></tr><tr><td>K</td><td>Activation Key</td><td>Permanent </td><td>On-premise floating</td></tr><tr><td>L</td><td>Activation Key</td><td>Trial</td><td>On-premise floating</td></tr><tr><td>M</td><td>Activation Key</td><td>Subscription</td><td>On-premise floating</td></tr><tr><td>N</td><td>Computer Key</td><td>Permanent </td><td>On-premise floating</td></tr><tr><td>P</td><td>Computer Key</td><td>Trial </td><td>On-premise floating</td></tr><tr><td>Q</td><td>Computer Key</td><td>Subscription </td><td>On-premise floating</td></tr><tr><td>R</td><td>Activation Key</td><td>Permanent Cloud</td><td>Cloud floating</td></tr><tr><td>S</td><td>Activation Key</td><td>Trial</td><td>Cloud floating</td></tr><tr><td>T</td><td>Activation Key</td><td>Subscription</td><td>Cloud floating</td></tr><tr><td>W</td><td>Computer Key</td><td>Permanent</td><td>Cloud floating</td></tr><tr><td>X</td><td>Computer Key</td><td>Trial</td><td>Cloud floating</td></tr><tr><td>Y</td><td>Computer Key</td><td>Subscription</td><td>Cloud floating</td></tr><tr><td>U</td><td>Computer Key</td><td>Permanent</td><td>Node Locked</td></tr><tr><td>V</td><td>Computer Key</td><td>Trial</td><td>Node Locked</td></tr></tbody></table>

&#x20;

[Read](license-key-types.md) about the definition of the different license key types.
