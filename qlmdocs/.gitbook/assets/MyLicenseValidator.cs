using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using QlmLicenseLib;

namespace QLM
{
    internal class MyLicenseValidator : LicenseValidator
    {
        public MyLicenseValidator() : base()
        {
            MigrateKeys();
        }

        public MyLicenseValidator(string settingsFile) : base(settingsFile)
        {
            MigrateKeys();
        }

        /// <summary>
        /// This function is to migrate keys from ERegistry to EFileCommonData. 
        /// We want to move keys to EFileCommonData for better reliability and performance. 
        /// We will first try to read keys from EFileCommonData, if not found, we will read from the ERegistry and then save to EFileCommonData for next time. 
        /// After migration, we will set a flag "keyLoctionMigrated" to true in EFileCommonData to avoid repeated migration in the future.
        /// </summary>
        private void MigrateKeys()
        {
            // Try to read keys from the current configured location, if not found, read from the ERegistry and then save to EFileCommonData for next time.
            EStoreKeysTo migrateFromLocation = EStoreKeysTo.ERegistry;
            EStoreKeysOptions migrateFromOptions = EStoreKeysOptions.EStoreKeysPerUserAndMachine;
            string cookieName = "keyLocationMigrated";


            license.ReadCookie(cookieName, 0, out string keyLocationMigrated);
            if (String.IsNullOrEmpty(keyLocationMigrated))
            {
                string _activationKey = string.Empty;
                string _computerKey = string.Empty;

                // Read keys from the currently configure location
                license.ReadKeys(ref activationKey, ref computerKey);

                if (String.IsNullOrEmpty(activationKey) && String.IsNullOrEmpty(computerKey))
                {
                    // If we do not find keys, try to read from the  previous location
                    EStoreKeysTo saveLocation = this.license.StoreKeysLocation;
                    EStoreKeysOptions saveOptions = this.license.StoreKeysOptions;
                    try
                    {
                        // Try to read from the old location
                        this.license.StoreKeysLocation = migrateFromLocation;
                        this.license.StoreKeysOptions = migrateFromOptions;

                        license.ReadKeys(ref activationKey, ref computerKey);

                        if (!String.IsNullOrEmpty(activationKey) && !String.IsNullOrEmpty(computerKey))
                        {
                            // Optionally delete the keys from the old location
                            // license.DeleteKeys ();

                            // If we find keys in ERegistry, save to EFileCommonData for next time.

                            // Restore the default settings
                            this.license.StoreKeysLocation = saveLocation;
                            this.license.StoreKeysOptions = saveOptions;
                            license.StoreKeys(activationKey, computerKey);

                        }
                    }
                    finally
                    {
                        this.license.StoreKeysLocation = saveLocation;
                        this.license.StoreKeysOptions = saveOptions;
                        // we will store the date we do migration in "keyLocationMigrated" so that we will not do migration again in the future.
                        license.StoreCookie(DateTime.Now.ToString("g"), cookieName, 0, out bool userLevelResult, out bool machineLevelResult, out string errorMessage);

                        
                    }
                }
            }
        }
    }
}
