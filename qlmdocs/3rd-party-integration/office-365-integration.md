# Office 365 Integration

## Introduction&#x20;

This document describes how to install, configure and use the QLM / Office 365 module (QLM-O365).

QLM-O365 is designed to perform the following tasks:

* Export customers from QLM to O365 contacts
* Export contacts from O365 to QLM customers

## Requirements

* The QLM-O365 module is designed to work with Office 365 2018.
* .NET 4.5 must be installed on the target system.
* QLM Enterprise Edition

## Installation

QLM-O365 is automatically installed with QLM. It is typically located in:

C:\Program Files\Soraco\QuickLicenseMgr\Integrations\QlmOffice365

## Azure Application

In order to enable QLM to communicate with Office 365, you need to register an App in the Azure Active Directory service as shown below.

* Login to O365
* Go to the Admin centers
* Click "Azure Active Directory"
* Click All services
* In the "Security + Identity" section, select "App registrations"
* Click "New application registration"
* Enter a name for the application such as: QLM O365 Integration
* Set the Application Type to: Native
* Set the Sign-on URL to: [http://localhost](http://localhost/)
* Click Create
* Once the App registration is created, make a note of the Application ID. You will need it later on when running the QlmOffice365 tool.
* Then, click Settings and select Required Permissions
* Click Add then "Select an API"
* Click "Microsoft Graph" then click Select
* In the Select Permissions section, check the following entries:&#x20;
  * Read and write user and shared contacts
  * Read user and shared contacts
* Click Select then click Done&#x20;

## Configuration

The first time you launch QLM-O365, you must configure it to connect to your QLM License Server:

* Go to the Settings tab
* Enter your O365 Application ID
* Enter your O365 Authority URL
* Enter the URL to your QLM License Server
* Enter the communicationEncryptionKey of your QLM License Server
* Enter the adminEncryptionKey of your QLM License Server

## Export to Office 365

To export QLM customers to Office 365 Contacts

* Go to the “Export Customers to Office 365”
* Click “Load Customers from QLM”
* Select each customer that you would like to Export
* Click “Export to Office 365”
* Login to O365 when prompted
* A dialog will display the result of the operation.

## Export to QLM

To export Office 365 Contacts to QLM customers

* Go to the “Export Contacts to QLM”
* Click “Load Contacts from Office 365”
* Select each customer that you would like to Export
* Click “Export to QLM”
* A dialog will display the result of the operation.

## Command Line

You can automate the export process by creating a scheduled task that runs a command line version of the export tool.&#x20;

Syntax for running QlmOffice365 from the command line:

_QlmOffice365.exe /from \[o365|qlm] /to \[o365|qlm] \[/overwrite]_

Example 1: Import from Office 365 to QLM, do not overwrite existing entries

_QlmOffice365.exe /from o365 /to qlm_

Example 2: Import from Office 365 to QLM, overwrite existing entries

_QlmOffice365.exe /from o365 /to qlm /overwrite_

Example 3: Import from QLM to Office 365, do not overwrite existing entries

_QlmOffice365.exe /from qlm /to o365_

Example 4: Import from QLM to Office 365, overwrite existing entries

_QlmOffice365.exe /from qlm /to o365 /overwrite_
