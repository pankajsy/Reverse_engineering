package com.keepassdroid.settings;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.preference.Preference;

import com.keepassdroid.Database;
import com.keepassdroid.LockingClosePreferenceActivity;
import com.keepassdroid.app.App;
import com.keepassdroid.compat.BackupManagerCompat;
import com.keepassdroid.database.PwEncryptionAlgorithm;

public class AppSettingsActivity
        extends LockingClosePreferenceActivity {
    public static boolean KEYFILE_DEFAULT = false;
    private BackupManagerCompat backupManager;

    public static void Launch(Context paramContext) {
        paramContext.startActivity(new Intent(paramContext, AppSettingsActivity.class));
    }

    private void setAlgorithm(Database paramDatabase, Preference paramPreference) {
        if (paramDatabase.pm.getEncAlgorithm() == PwEncryptionAlgorithm.Rjindal) {
        }
        for (int i = 2131099777; ; i = 2131099791) {
            paramPreference.setSummary(i);
            return;
        }
    }

    private void setRounds(Database paramDatabase, Preference paramPreference) {
        paramPreference.setSummary(Long.toString(paramDatabase.pm.getNumRounds()));
    }

    protected void onCreate(Bundle paramBundle) {
        super.onCreate(paramBundle);
        addPreferencesFromResource(2130968576);
        findPreference(getString(2131099838)).setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject) {
                if (!((Boolean) paramAnonymousObject).booleanValue()) {
                    App.getFileHistory().deleteAllKeys();
                }
                return true;
            }
        });
        findPreference(getString(2131099845)).setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
            public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject) {
                paramAnonymousObject = (Boolean) paramAnonymousObject;
                paramAnonymousPreference = (Preference) paramAnonymousObject;
                if (paramAnonymousObject == null) {
                    paramAnonymousPreference = Boolean.valueOf(true);
                }
                if (!paramAnonymousPreference.booleanValue()) {
                    App.getFileHistory().deleteAll();
                }
                return true;
            }
        });
        paramBundle = App.getDB();
        if ((paramBundle.Loaded()) && (paramBundle.pm.appSettingsEnabled())) {
            Preference localPreference = findPreference(getString(2131099846));
            localPreference.setOnPreferenceChangeListener(new Preference.OnPreferenceChangeListener() {
                public boolean onPreferenceChange(Preference paramAnonymousPreference, Object paramAnonymousObject) {
                    AppSettingsActivity.this.setRounds(App.getDB(), paramAnonymousPreference);
                    return true;
                }
            });
            setRounds(paramBundle, localPreference);
            setAlgorithm(paramBundle, findPreference(getString(2131099822)));
        }
        for (; ; ) {
            this.backupManager = new BackupManagerCompat(this);
            return;
            findPreference(getString(2131099828)).setEnabled(false);
        }
    }

    protected void onStop() {
        this.backupManager.dataChanged();
        super.onStop();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/settings/AppSettingsActivity.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */