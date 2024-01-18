# Definition of the macros that can be used in searches

When you define a custom "search" (Manage Keys/search/edit searches), you can use any of the macros in the table below in the SQL field. These macros are automatically replaced when the search is performed.&#x20;

![mceclip1.png](https://support.soraco.co/hc/article\_attachments/10001794427156)

**List of supported macros:**

| **Macro**             | **Description**                                    |
| --------------------- | -------------------------------------------------- |
| \[today\_start]       | 12:00:01 AM of the current day                     |
| \[today\_end]         | 11:59:59 PM of the current day                     |
| \[yesterday\_start]   | 12:00:01 AM yesterday                              |
| \[yesterday\_end]     | 11:59:59 PM yesterday                              |
| \[last\_month\_start] | 12:00:01 AM on the first day of the previous month |
| \[last\_month\_end]   | 11:59:59 PM on the last day of the previous month  |
| \[this\_month\_start] | 12:00:01 AM on the first day of the current month  |
| \[this\_month\_end]   | 11:59:59 PM on the last day of the current month   |
| \[date]               | Date the scheduled task last ran                   |

&#x20;

You can use + or - arithmetic operations within a macro. When using arithmetic operators the default unit is days. For example, the macro to \[today\_start+5] effectively means \[today\_start + 5 days].

The following units are available to control the increments: d (default), h (hours), m (minutes), s (seconds), and M (months - available as of QLM v16.0.2250.1)&#x20;

**Examples:**

\[today\_start-5] is equivalent to 5 days ago.

\[today\_start+5] is equivalent to 5 days from today.

\[today\_start+5d] is equivalent to 5 days from today.

\[this\_month\_start-3M] is equivalent to 3 months ago.
