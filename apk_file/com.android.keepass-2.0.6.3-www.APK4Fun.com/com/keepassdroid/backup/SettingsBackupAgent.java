package com.keepassdroid.backup;

import android.annotation.SuppressLint;
import android.app.backup.BackupAgentHelper;
import android.app.backup.SharedPreferencesBackupHelper;

@SuppressLint({"NewApi"})
public class SettingsBackupAgent
        extends BackupAgentHelper {
    private static final String PREFS_BACKUP_KEY = "prefs";

    public void onCreate() {
        addHelper("prefs", new SharedPreferencesBackupHelper(this, new String[]{getPackageName() + "_preferences"}));
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/backup/SettingsBackupAgent.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */