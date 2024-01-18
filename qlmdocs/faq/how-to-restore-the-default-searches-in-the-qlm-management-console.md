# How to restore the default searches in the QLM Management Console

QLM ships with a set of default searches as shown in the screenshot below:

![mceclip0.png](https://support.soraco.co/hc/article\_attachments/360083883612/mceclip0.png)

If the searches are not visible in your QLM Management Console and you need to restore the default ones, follow the steps below:

* Launch the QLM Management Console
* Go to the Manage Keys tab
* Click Sites and make sure your License Server is selected
* Go to the Files and Folders tab
* Locate the **Searches File** field and note the path of the file.

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/360083956631/mceclip1.png)

* Close the QLM Management Console
* Go to the QLM installation folder, typically C:\Program Files\Soraco\QuickLicenseMgr
* Locate the file queries.xml
* Copy this file to the **Searches File** folder and rename it to match the **Searches File** filename.
* Launch the QLM Management Console
* Your searches should now be restored.
