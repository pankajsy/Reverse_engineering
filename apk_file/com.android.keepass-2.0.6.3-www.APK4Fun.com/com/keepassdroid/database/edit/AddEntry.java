package com.keepassdroid.database.edit;

import android.content.Context;

import com.keepassdroid.Database;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntry;

public class AddEntry
        extends RunnableOnFinish {
    protected Database mDb;
    private Context ctx;
    private PwEntry mEntry;

    protected AddEntry(Context paramContext, Database paramDatabase, PwEntry paramPwEntry, OnFinish paramOnFinish) {
        super(paramOnFinish);
        this.mDb = paramDatabase;
        this.mEntry = paramPwEntry;
        this.ctx = paramContext;
        this.mFinish = new AfterAdd(this.mFinish);
    }

    public static AddEntry getInstance(Context paramContext, Database paramDatabase, PwEntry paramPwEntry, OnFinish paramOnFinish) {
        return new AddEntry(paramContext, paramDatabase, paramPwEntry, paramOnFinish);
    }

    public void run() {
        this.mDb.pm.addEntryTo(this.mEntry, this.mEntry.getParent());
        new SaveDB(this.ctx, this.mDb, this.mFinish).run();
    }

    private class AfterAdd
            extends OnFinish {
        public AfterAdd(OnFinish paramOnFinish) {
            super();
        }

        public void run() {
            Object localObject = AddEntry.this.mDb.pm;
            if (this.mSuccess) {
                localObject = AddEntry.this.mEntry.getParent();
                AddEntry.this.mDb.dirty.add(localObject);
            }
            for (; ; ) {
                super.run();
                return;
                ((PwDatabase) localObject).removeEntryFrom(AddEntry.this.mEntry, AddEntry.this.mEntry.getParent());
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/AddEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */