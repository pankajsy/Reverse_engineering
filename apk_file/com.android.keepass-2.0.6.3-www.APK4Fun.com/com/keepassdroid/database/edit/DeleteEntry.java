package com.keepassdroid.database.edit;

import android.content.Context;

import com.keepassdroid.Database;
import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwGroup;

public class DeleteEntry
        extends RunnableOnFinish {
    private Context ctx;
    private Database mDb;
    private boolean mDontSave;
    private PwEntry mEntry;

    public DeleteEntry(Context paramContext, Database paramDatabase, PwEntry paramPwEntry, OnFinish paramOnFinish) {
        this(paramContext, paramDatabase, paramPwEntry, paramOnFinish, false);
    }

    public DeleteEntry(Context paramContext, Database paramDatabase, PwEntry paramPwEntry, OnFinish paramOnFinish, boolean paramBoolean) {
        super(paramOnFinish);
        this.mDb = paramDatabase;
        this.mEntry = paramPwEntry;
        this.mDontSave = paramBoolean;
        this.ctx = paramContext;
    }

    public void run() {
        PwDatabase localPwDatabase = this.mDb.pm;
        PwGroup localPwGroup = this.mEntry.getParent();
        boolean bool = localPwDatabase.canRecycle(this.mEntry);
        if (bool) {
            localPwDatabase.recycle(this.mEntry);
        }
        for (; ; ) {
            this.mFinish = new AfterDelete(this.mFinish, localPwGroup, this.mEntry, bool);
            new SaveDB(this.ctx, this.mDb, this.mFinish, this.mDontSave).run();
            return;
            localPwDatabase.deleteEntry(this.mEntry);
        }
    }

    private class AfterDelete
            extends OnFinish {
        private PwEntry mEntry;
        private PwGroup mParent;
        private boolean recycled;

        public AfterDelete(OnFinish paramOnFinish, PwGroup paramPwGroup, PwEntry paramPwEntry, boolean paramBoolean) {
            super();
            this.mParent = paramPwGroup;
            this.mEntry = paramPwEntry;
            this.recycled = paramBoolean;
        }

        public void run() {
            Object localObject = DeleteEntry.this.mDb.pm;
            if (this.mSuccess) {
                if (this.mParent != null) {
                    DeleteEntry.this.mDb.dirty.add(this.mParent);
                }
                if (this.recycled) {
                    localObject = ((PwDatabase) localObject).getRecycleBin();
                    DeleteEntry.this.mDb.dirty.add(localObject);
                    DeleteEntry.this.mDb.dirty.add(DeleteEntry.this.mDb.pm.rootGroup);
                }
            }
            for (; ; ) {
                super.run();
                return;
                if (this.recycled) {
                    ((PwDatabase) localObject).undoRecycle(this.mEntry, this.mParent);
                } else {
                    ((PwDatabase) localObject).undoDeleteEntry(this.mEntry, this.mParent);
                }
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/DeleteEntry.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */