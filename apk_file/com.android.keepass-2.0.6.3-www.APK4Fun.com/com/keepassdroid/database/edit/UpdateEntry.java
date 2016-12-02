package com.keepassdroid.database.edit;

import android.content.Context;

import com.keepassdroid.Database;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwGroup;

public class UpdateEntry
        extends RunnableOnFinish {
    private Context ctx;
    private Database mDb;
    private PwEntry mNewE;
    private PwEntry mOldE;

    public UpdateEntry(Context paramContext, Database paramDatabase, PwEntry paramPwEntry1, PwEntry paramPwEntry2, OnFinish paramOnFinish) {
        super(paramOnFinish);
        this.mDb = paramDatabase;
        this.mOldE = paramPwEntry1;
        this.mNewE = paramPwEntry2;
        this.ctx = paramContext;
        this.mFinish = new AfterUpdate((PwEntry) this.mOldE.clone(), paramOnFinish);
    }

    public void run() {
        this.mOldE.assign(this.mNewE);
        this.mOldE.touch(true, true);
        new SaveDB(this.ctx, this.mDb, this.mFinish).run();
    }

    private class AfterUpdate
            extends OnFinish {
        private PwEntry mBackup;

        public AfterUpdate(PwEntry paramPwEntry, OnFinish paramOnFinish) {
            super();
            this.mBackup = paramPwEntry;
        }

        public void run() {
            if (this.mSuccess) {
                if ((!this.mBackup.getTitle().equals(UpdateEntry.this.mNewE.getTitle())) || (!this.mBackup.getIcon().equals(UpdateEntry.this.mNewE.getIcon()))) {
                    PwGroup localPwGroup = this.mBackup.getParent();
                    if (localPwGroup != null) {
                        localPwGroup.sortEntriesByName();
                        UpdateEntry.this.mDb.dirty.add(localPwGroup);
                    }
                }
            }
            for (; ; ) {
                super.run();
                return;
                UpdateEntry.this.mOldE.assign(this.mBackup);
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/UpdateEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */