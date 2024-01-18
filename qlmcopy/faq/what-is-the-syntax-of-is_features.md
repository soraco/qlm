# What is the syntax of is\_features

QLM  can embed up to 32 features in a license key. The 32 features are broken into 4 feature sets (0 to 3) with 8 features per feature set. The 8 features in a feature set are defined as follows: 1 | 2 | 4 | 8 | 16 | 32 | 64 | 128

When invoking GetActivationKey or GetActivationKeyWithExpiryDate, you can specify which features to enable on the command line.

The syntax for defining features on the command line is:

\&is\_features=semi comma separated list of feature sets and their corresponding values.

Example: \&is\_features=0:3;1:2;2:7;3:25

The above statement means:

For feature set 0, features 1 + 2 (3) are enabled

For feature set 1, feature 2 is enabled.

For feature set 2, features 1 + 2 + 4 (7) are enabled.

For feature set 3, features 1 + 8 +  16 (25) are enabled.
