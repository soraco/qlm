# How to prevent a user from running multiple instances of your app

If you want to prevent a user from running multiple instances of your application on the same computer, you can do so by using a Mutex as shown in the example below.

&#x20;

\[STAThread]\
static void Main()\
{

&#x20;   bool bMutexAcquired = false;\
&#x20;   using (Mutex mutex = new Mutex(true, "Unique\_Mutex\_Name", out bMutexAcquired))\
&#x20;   {

&#x20;       // If the mutex was not acquired, we should not run the app. \
&#x20;       if (bMutexAcquired == false)\
&#x20;       {\
&#x20;           return 0;\
&#x20;       }

&#x20;       Application.EnableVisualStyles();\
&#x20;       Application.SetCompatibleTextRenderingDefault(false);

&#x20;       Application.Run(new Form1());\
&#x20;   }

}
