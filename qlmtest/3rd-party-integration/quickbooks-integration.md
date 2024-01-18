# QuickBooks Integration

## Introduction

This document describes how to install, configure and use the QLM / QuickBooks integration module (QLM-QuickBooks).

QLM- QuickBooks is designed to perform the following tasks when an invoice is paid:

* Publish the customer’s information to the QLM database
* Create license keys based on the paid invoice
* Email the license keys to the customer

\-> [View a video tutorial](https://www.screencast.com/t/zpfb9Jxg) of the QuickBooks integration.

## Requirements

* The QLM- QuickBooks module is designed to work with QuickBooks Desktop v15+.
* The QLM- QuickBooks depends on the QuickBooks API which must first be installed by running QBFC13\_0Installer.exe.
* .NET 4.5 must be installed on the target system.&#x20;

## Installation

* Run the QBFC13\_0Installer.exe
* Copy all the QLM- QuickBooks files to any folder on the target system
* Register the QLM- QuickBooks service as follows:
  * Launch a command prompt as Administrator (Run As Administator)
  * Type: QlmQuickBooksService.exe  -regserver
  * Type: QlmQuickBooksService.exe  -d

## Configuration

You must now configure the QLM- QuickBooks service to connect to your QLM License Server.

&#x20;QlmQuickBooksService.exe.config

* Open the QlmQuickBooksService.exe.config file in an editor of your choice
* Update the serviceURL setting to point to your own QLM License Server
* If you want all QuickBooks items to be sent to QLM, set the processQlmItemsOnly to false. When set to true, only items that have a Custom Field called QLM whose value is set to 1 are processed by QLM.

&#x20;log4net.config

* Open the log4net.config file
* Update the file / value path to point to a writable folder on your system

## First Run / Authorization

Once the steps above are completed:

* If QuickBooks was open, close it
* Launch QuickBooks
* Open your company file
* QuickBooks will then display a confirmation to allow Quick License Manager to integrate with your QuickBooks Company file. If you are not prompted for confirmation, it is an indication that one of the previous steps did not work as expected.
* Select “Yes, always; allow access even if QuickBooks is not running”
* Do NOT check “Allow this application to access personal data…”
* Click Continue…

## Product Configuration

When you create an Item in QuickBooks, you must map this item to a product in QLM. The mapping of items is done via the QLM Server Properties / custom variables.

To create a custom variable:

* Launch the QLM Management Console
* Go to the Manage Keys tab, click Sites then select your Site.
* Go to the Server Properties tab
* Click the + button to add a new server property. A new row should appear at the bottom of the grid.
* In the Name column, enter a name of your QuickBooks item, for example: demo\_order
* In the Value column, enter (replace the values to match your product): \&is\_productid=1\&is\_majorversion=1\&is\_minorversion=0\&is\_features=0:1;1:3\&is\_licensemodel=permanent\&is\_productname=Demo\&is\_emailtemplate=1. New Order
* Click OK to close the Site Editor&#x20;

To enable the QLM QuickBooks integration:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click 3rd Party Extensions
* Select QuickBooks
* Check Enabled
* Click Ok

In QuickBooks, for each item that you would like to have QLM process, do the following:

* From the QuickBooks main menu, click Lists / Item List
* Double click the item that you would like to have QLM Process
* Click “Custom Fields”
* Click “Define Fields”
* In the Label field, enter QLM then check the Use column
* Click OK twice
* Set the value of the QLM field to 1.
* Close all dialogs

## Testing an order

To test an order:

* Click Create Invoices
* Add to the invoice an item that was mapped to a QLM Server Property
* Click Save & Close
* Add to the invoice an item that was mapped to a QLM Server Property
* Click Receive Payments
* Select the invoice created earlier
* Mark the invoice as paid (click the Check Mark Column)
* Click Save & Close
* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click today’s order and confirm that a new key was created

## Uninstallation

* Unregister the QLM-DB service as follows:
  * Launch a command prompt as Administrator (Run As Administator)
  * Type: QlmQuickBooksService.exe  -dd
  * Type: QlmQuickBooksService.exe  -unregserver
* Delete all the QLM- QuickBooks files on the target system
* Uninstall QBFC13\_0Installer.exe (QBFC 13.0)
