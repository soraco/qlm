# How to prevent an Excel sheet from opening if macros are disabled

Preventing an Excel sheet from opening if macros are disabled is not supported by QLM.

Several Excel specific techniques exist to accomplish. This article describes one such technique.

In order to prevent users from viewing your workbook if macros are disabled, perform the following:

* Create a new worksheet called "HiddenWorksheet"
* Add two new Subs in your workbook as follows:

Private Sub ShowSheets()\
&#x20;   Dim sh As Worksheet

&#x20;   For Each sh In Worksheets\
&#x20;       sh.Visible = xlSheetVisible\
&#x20;   Next sh\
\
&#x20;   ' hide the HiddenWorksheet\
&#x20;   Sheets("HiddenWorksheet").Visible = xlVeryHidden

End Sub

Private Sub HideSheets()

&#x20;   Dim sh As Worksheet\
\
&#x20;   ' hide the HiddenWorksheet\
&#x20;   Sheets("HiddenWorksheet").Visible = xlSheetVisible

&#x20;   For Each sh In Worksheets\
&#x20;   If Not sh.Name = "HiddenWorksheet" Then sh.Visible = xlVeryHidden

&#x20;   Next sh

End Sub

* In the Workbook\_Open Sub, call ShowSheets
* In the Workbook\_BeforeClose Sub, call HideSheets

Useful references:

* [Teach Excel](https://www.youtube.com/watch?v=pBdBwPwsDgI)
* [Mr Excel](https://www.mrexcel.com/forum/excel-questions/39695-prohibiting-file-opening-if-macros-disabled.html%C2%A0)&#x20;

You may also want to consider tools such as [Unviewable+](https://www.spreadsheet1.com/unviewable-vba-project-app-for-excel.html) to protect your VBA code.
