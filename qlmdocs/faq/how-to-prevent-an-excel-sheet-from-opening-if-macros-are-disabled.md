# How to prevent an Excel sheet from opening if macros are disabled

Preventing an Excel sheet from opening if macros are disabled is not supported by QLM.

Several Excel-specific techniques exist to accomplish this. This article describes one such technique.

In order to prevent users from viewing your workbook if macros are disabled, perform the following:

* Create a new worksheet called "HiddenWorksheet"
* Add two new Subs in your workbook as follows:

{% code overflow="wrap" %}
```vba
Private Sub ShowSheets()
    Dim sh As Worksheet
    For Each sh In Worksheets
        sh.Visible = xlSheetVisible
    Next sh

    ' hide the HiddenWorksheet
    Sheets("HiddenWorksheet").Visible = xlVeryHidden
End Sub
Private Sub HideSheets()
    Dim sh As Worksheet

    ' hide the HiddenWorksheet
    Sheets("HiddenWorksheet").Visible = xlSheetVisible
    For Each sh In Worksheets
    If Not sh.Name = "HiddenWorksheet" Then sh.Visible = xlVeryHidden
    Next sh
End Sub
```
{% endcode %}

* In the Workbook\_Open Sub, call ShowSheets
* In the Workbook\_BeforeClose Sub, call HideSheets

Useful references:

* [Teach Excel](https://www.youtube.com/watch?v=pBdBwPwsDgI)
* [Mr Excel](https://www.mrexcel.com/forum/excel-questions/39695-prohibiting-file-opening-if-macros-disabled.html%C2%A0)&#x20;

You may also want to consider tools such as [Unviewable+](https://www.spreadsheet1.com/unviewable-vba-project-app-for-excel.html) to protect your VBA code.
