package com.keepassdroid.search;

import android.content.Context;
import android.preference.PreferenceManager;
import android.util.Log;

import com.keepassdroid.Database;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV3;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.PwGroupV3;
import com.keepassdroid.database.PwGroupV4;
import com.keepassdroid.database.iterator.EntrySearchStringIterator;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

public class SearchDbHelper {
    private final Context mCtx;

    public SearchDbHelper(Context paramContext) {
        this.mCtx = paramContext;
    }

    private boolean omitBackup() {
        return PreferenceManager.getDefaultSharedPreferences(this.mCtx).getBoolean(this.mCtx.getString(2131099844), this.mCtx.getResources().getBoolean(2131230722));
    }

    public void processEntries(PwEntry paramPwEntry, List<PwEntry> paramList, String paramString, Locale paramLocale) {
        EntrySearchStringIterator localEntrySearchStringIterator = paramPwEntry.stringIterator();
        while (localEntrySearchStringIterator.hasNext()) {
            String str = (String) localEntrySearchStringIterator.next();
            if ((str != null) && (str.length() != 0) && (str.toLowerCase(paramLocale).contains(paramString))) {
                paramList.add(paramPwEntry);
            }
        }
    }

    public PwGroup search(Database paramDatabase, String paramString) {
        PwDatabase localPwDatabase = paramDatabase.pm;
        Locale localLocale;
        String str;
        boolean bool;
        LinkedList localLinkedList;
        if ((localPwDatabase instanceof PwDatabaseV3)) {
            paramDatabase = new PwGroupV3();
            paramDatabase.name = this.mCtx.getString(2131099785);
            paramDatabase.childEntries = new ArrayList();
            localLocale = Locale.getDefault();
            str = paramString.toLowerCase(localLocale);
            bool = omitBackup();
            localLinkedList = new LinkedList();
            if (localPwDatabase.rootGroup != null) {
                localLinkedList.add(localPwDatabase.rootGroup);
            }
        }
        for (; ; ) {
            paramString = paramDatabase;
            Object localObject;
            if (localLinkedList.size() != 0) {
                paramString = (PwGroup) localLinkedList.remove();
                if (!localPwDatabase.isGroupSearchable(paramString, bool)) {
                    continue;
                }
                localObject = paramString.childEntries.iterator();
                while (((Iterator) localObject).hasNext()) {
                    processEntries((PwEntry) ((Iterator) localObject).next(), paramDatabase.childEntries, str, localLocale);
                }
                if ((localPwDatabase instanceof PwDatabaseV4)) {
                    paramDatabase = new PwGroupV4();
                    break;
                }
                Log.d("SearchDbHelper", "Tried to search with unknown db");
                paramString = null;
            }
            return paramString;
            paramString = paramString.childGroups.iterator();
            while (paramString.hasNext()) {
                localObject = (PwGroup) paramString.next();
                if (localObject != null) {
                    localLinkedList.add(localObject);
                }
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/search/SearchDbHelper.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */