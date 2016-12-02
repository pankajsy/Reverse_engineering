package com.keepassdroid.fileselect;

import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.net.Uri;
import android.preference.PreferenceManager;

import com.keepassdroid.compat.EditorCompat;
import com.keepassdroid.utils.UriUtil;

import java.util.ArrayList;
import java.util.List;

public class RecentFileHistory {
    private static String DB_KEY = "recent_databases";
    private static String KEYFILE_KEY = "recent_keyfiles";
    private Context ctx;
    private List<String> databases = new ArrayList();
    private boolean enabled;
    private boolean init = false;
    private List<String> keyfiles = new ArrayList();
    private SharedPreferences.OnSharedPreferenceChangeListener listner;
    private SharedPreferences prefs;

    public RecentFileHistory(Context paramContext) {
        this.ctx = paramContext.getApplicationContext();
        this.prefs = PreferenceManager.getDefaultSharedPreferences(paramContext);
        this.enabled = this.prefs.getBoolean(this.ctx.getString(2131099845), this.ctx.getResources().getBoolean(2131230723));
        this.listner = new SharedPreferences.OnSharedPreferenceChangeListener() {
            public void onSharedPreferenceChanged(SharedPreferences paramAnonymousSharedPreferences, String paramAnonymousString) {
                if (paramAnonymousString.equals(RecentFileHistory.this.ctx.getString(2131099845))) {
                    RecentFileHistory.access$102(RecentFileHistory.this, paramAnonymousSharedPreferences.getBoolean(RecentFileHistory.this.ctx.getString(2131099845), RecentFileHistory.this.ctx.getResources().getBoolean(2131230723)));
                }
            }
        };
        this.prefs.registerOnSharedPreferenceChangeListener(this.listner);
    }

    private void init() {
        try {
            if (!this.init) {
                if (!upgradeFromSQL()) {
                    loadPrefs();
                }
                this.init = true;
            }
            return;
        } finally {
        }
    }

    private void loadList(List<String> paramList, String paramString) {
        SharedPreferences localSharedPreferences = PreferenceManager.getDefaultSharedPreferences(this.ctx);
        int j = localSharedPreferences.getInt(paramString, 0);
        paramList.clear();
        int i = 0;
        while (i < j) {
            paramList.add(localSharedPreferences.getString(paramString + "_" + i, ""));
            i += 1;
        }
    }

    private void loadPrefs() {
        loadList(this.databases, DB_KEY);
        loadList(this.keyfiles, KEYFILE_KEY);
    }

    private void saveList(String paramString, List<String> paramList) {
        SharedPreferences.Editor localEditor = PreferenceManager.getDefaultSharedPreferences(this.ctx).edit();
        int j = paramList.size();
        localEditor.putInt(paramString, j);
        int i = 0;
        while (i < j) {
            localEditor.putString(paramString + "_" + i, (String) paramList.get(i));
            i += 1;
        }
        EditorCompat.apply(localEditor);
    }

    private void savePrefs() {
        saveList(DB_KEY, this.databases);
        saveList(KEYFILE_KEY, this.keyfiles);
    }

    private boolean sqlDatabaseExists() {
        return this.ctx.getDatabasePath("keepassdroid").exists();
    }

    private void trimLists() {
        int j = this.databases.size();
        int i = 5;
        while (i < j) {
            this.databases.remove(i);
            this.keyfiles.remove(i);
            i += 1;
        }
    }

    private boolean upgradeFromSQL() {
        try {
            if (!sqlDatabaseExists()) {
                return false;
            }
            this.databases.clear();
            this.keyfiles.clear();
            FileDbHelper localFileDbHelper = new FileDbHelper(this.ctx);
            localFileDbHelper.open();
            Cursor localCursor = localFileDbHelper.fetchAllFiles();
            int i = localCursor.getColumnIndex("fileName");
            int j = localCursor.getColumnIndex("keyFile");
            if (localCursor.moveToFirst()) {
                while (localCursor.moveToNext()) {
                    String str1 = localCursor.getString(i);
                    String str2 = localCursor.getString(j);
                    this.databases.add(str1);
                    this.keyfiles.add(str2);
                }
            }
            try {
                for (; ; ) {
                    FileDbHelper.deleteDatabase(this.ctx);
                    return true;
                    savePrefs();
                    localCursor.close();
                    localException1.close();
                }
            } catch (Exception localException2) {
                for (; ; ) {
                }
            }
        } catch (Exception localException1) {
        }
    }

    public void createFile(Uri paramUri1, Uri paramUri2) {
        if ((!this.enabled) || (paramUri1 == null)) {
            return;
        }
        init();
        deleteFile(paramUri1, false);
        this.databases.add(0, paramUri1.toString());
        if (paramUri2 == null) {
        }
        for (paramUri1 = ""; ; paramUri1 = paramUri2.toString()) {
            this.keyfiles.add(0, paramUri1);
            trimLists();
            savePrefs();
            return;
        }
    }

    public void deleteAll() {
        init();
        this.databases.clear();
        this.keyfiles.clear();
        savePrefs();
    }

    public void deleteAllKeys() {
        init();
        this.keyfiles.clear();
        int j = this.databases.size();
        int i = 0;
        while (i < j) {
            this.keyfiles.add("");
            i += 1;
        }
        savePrefs();
    }

    public void deleteFile(Uri paramUri) {
        deleteFile(paramUri, true);
    }

    public void deleteFile(Uri paramUri, boolean paramBoolean) {
        init();
        String str1 = paramUri.toString();
        paramUri = paramUri.getPath();
        int i = 0;
        for (; ; ) {
            if (i < this.databases.size()) {
                String str2 = (String) this.databases.get(i);
                if ((str1.equals(str2)) || (paramUri.equals(str2))) {
                    this.databases.remove(i);
                    this.keyfiles.remove(i);
                }
            } else {
                if (paramBoolean) {
                    savePrefs();
                }
                return;
            }
            i += 1;
        }
    }

    public String getDatabaseAt(int paramInt) {
        init();
        return (String) this.databases.get(paramInt);
    }

    public List<String> getDbList() {
        init();
        return this.databases;
    }

    public Uri getFileByName(Uri paramUri) {
        if (!this.enabled) {
            return null;
        }
        init();
        int j = this.databases.size();
        int i = 0;
        while (i < j) {
            if (UriUtil.equalsDefaultfile(paramUri, (String) this.databases.get(i))) {
                return UriUtil.parseDefaultFile((String) this.keyfiles.get(i));
            }
            i += 1;
        }
        return null;
    }

    public String getKeyfileAt(int paramInt) {
        init();
        return (String) this.keyfiles.get(paramInt);
    }

    public boolean hasRecentFiles() {
        if (!this.enabled) {
        }
        do {
            return false;
            init();
        } while (this.databases.size() <= 0);
        return true;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/fileselect/RecentFileHistory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */