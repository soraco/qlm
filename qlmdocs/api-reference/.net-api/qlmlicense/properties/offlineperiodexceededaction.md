# OfflinePeriodExceededAction

Set or get the action to be performed when the MaxDaysOffline threshold is reached.

The possible values are:

**DoNothing**: No action is taken.

**ExitApp**: The application exits.

**FireEvent**: An event that you can subscribe to is fired. _This is only supported in .NET Framework apps._

**Event signature**:&#x20;

public void OfflinePeriodExceeded\_EventHandler(object sender, OfflinePeriodExceeded\_EventArgs e);

**Arguments**:

string errorMessage: an error message\
int offlinePeriod: the number of days the client was offline\
EServerErrorCode errorCode: the server error code

**ThrowException**: An exception is thrown. If you do not handle exceptions everywhere in your code, this will most likely crash your application.&#x20;
