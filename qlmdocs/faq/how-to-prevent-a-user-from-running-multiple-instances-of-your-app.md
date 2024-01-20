# How to prevent a user from running multiple instances of your app

If you want to prevent a user from running multiple instances of your application on the same computer, you can do so by using a Mutex as shown in the example below.

{% code overflow="wrap" %}
```csharp
[STAThread]
static void Main()
{
    bool bMutexAcquired = false;
    using (Mutex mutex = new Mutex(true, "Unique_Mutex_Name", out bMutexAcquired))
    {
        // If the mutex was not acquired, we should not run the app. 
        if (bMutexAcquired == false)
        {
            return 0;
        }
        Application.EnableVisualStyles();
        Application.SetCompatibleTextRenderingDefault(false);
        Application.Run(new Form1());
    }
}
```
{% endcode %}
