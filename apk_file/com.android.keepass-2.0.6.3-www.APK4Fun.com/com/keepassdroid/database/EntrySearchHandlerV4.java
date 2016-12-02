package com.keepassdroid.database;

import com.keepassdroid.utils.StrUtil;
import com.keepassdroid.utils.UuidUtil;

import java.util.List;
import java.util.Locale;

public class EntrySearchHandlerV4
        extends EntrySearchHandler {
    private SearchParametersV4 sp;

    protected EntrySearchHandlerV4(SearchParameters paramSearchParameters, List<PwEntry> paramList) {
        super(paramSearchParameters, paramList);
        this.sp = ((SearchParametersV4) paramSearchParameters);
    }

    protected boolean searchID(PwEntry paramPwEntry) {
        boolean bool2 = false;
        paramPwEntry = (PwEntryV4) paramPwEntry;
        boolean bool1 = bool2;
        if (this.sp.searchInUUIDs) {
            bool1 = bool2;
            if (StrUtil.indexOfIgnoreCase(UuidUtil.toHexString(paramPwEntry.uuid), this.sp.searchString, Locale.ENGLISH) >= 0) {
                bool1 = true;
            }
        }
        return bool1;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/EntrySearchHandlerV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */