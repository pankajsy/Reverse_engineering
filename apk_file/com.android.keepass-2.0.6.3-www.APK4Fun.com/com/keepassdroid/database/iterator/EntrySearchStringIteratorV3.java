package com.keepassdroid.database.iterator;

import com.keepassdroid.database.PwEntryV3;
import com.keepassdroid.database.SearchParameters;

import java.util.NoSuchElementException;

public class EntrySearchStringIteratorV3
        extends EntrySearchStringIterator {
    private static final int comment = 3;
    private static final int maxEntries = 4;
    private static final int title = 0;
    private static final int url = 1;
    private static final int username = 2;
    private int current = 0;
    private PwEntryV3 entry;
    private SearchParameters sp;

    public EntrySearchStringIteratorV3(PwEntryV3 paramPwEntryV3) {
        this.entry = paramPwEntryV3;
        this.sp = SearchParameters.DEFAULT;
    }

    public EntrySearchStringIteratorV3(PwEntryV3 paramPwEntryV3, SearchParameters paramSearchParameters) {
        this.entry = paramPwEntryV3;
        this.sp = paramSearchParameters;
    }

    private String getCurrentString() {
        switch (this.current) {
            default:
                return "";
            case 0:
                return this.entry.getTitle();
            case 1:
                return this.entry.getUrl();
            case 2:
                return this.entry.getUsername();
        }
        return this.entry.getNotes();
    }

    private void useSearchParameters() {
        if (this.sp == null) {
        }
        int i;
        do {
            return;
            i = 0;
        } while (i != 0);
        switch (this.current) {
        }
        for (; ; ) {
            int j = 1;
            i = j;
            if (1 != 0) {
                break;
            }
            this.current += 1;
            i = j;
            break;
            boolean bool = this.sp.searchInTitles;
            bool = this.sp.searchInUrls;
            bool = this.sp.searchInUserNames;
            bool = this.sp.searchInNotes;
        }
    }

    public boolean hasNext() {
        return this.current < 4;
    }

    public String next() {
        if (this.current == 4) {
            throw new NoSuchElementException("Past final string");
        }
        useSearchParameters();
        String str = getCurrentString();
        this.current += 1;
        return str;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/iterator/EntrySearchStringIteratorV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */