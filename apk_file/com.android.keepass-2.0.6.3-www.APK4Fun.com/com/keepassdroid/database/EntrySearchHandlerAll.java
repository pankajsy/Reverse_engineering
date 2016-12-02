package com.keepassdroid.database;

import java.util.Date;
import java.util.List;

public class EntrySearchHandlerAll
        extends EntryHandler<PwEntry> {
    private List<PwEntry> listStorage;
    private Date now;
    private SearchParameters sp;

    public EntrySearchHandlerAll(SearchParameters paramSearchParameters, List<PwEntry> paramList) {
        this.sp = paramSearchParameters;
        this.listStorage = paramList;
        this.now = new Date();
    }

    public boolean operate(PwEntry paramPwEntry) {
        if ((this.sp.respectEntrySearchingDisabled) && (!paramPwEntry.isSearchingEnabled())) {
        }
        while ((this.sp.excludeExpired) && (paramPwEntry.expires()) && (this.now.after(paramPwEntry.getExpiryTime()))) {
            return true;
        }
        this.listStorage.add(paramPwEntry);
        return true;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/EntrySearchHandlerAll.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */