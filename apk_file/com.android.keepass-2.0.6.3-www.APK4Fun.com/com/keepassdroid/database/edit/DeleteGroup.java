package com.keepassdroid.database.edit;

import com.keepassdroid.Database;
import com.keepassdroid.GroupBaseActivity;
import com.keepassdroid.app.App;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwGroup;

import java.util.ArrayList;
import java.util.List;

public class DeleteGroup
        extends RunnableOnFinish {
    private GroupBaseActivity mAct;
    private Database mDb;
    private boolean mDontSave;
    private PwGroup mGroup;

    public DeleteGroup(Database paramDatabase, PwGroup paramPwGroup, GroupBaseActivity paramGroupBaseActivity, OnFinish paramOnFinish) {
        super(paramOnFinish);
        setMembers(paramDatabase, paramPwGroup, paramGroupBaseActivity, false);
    }

    public DeleteGroup(Database paramDatabase, PwGroup paramPwGroup, GroupBaseActivity paramGroupBaseActivity, OnFinish paramOnFinish, boolean paramBoolean) {
        super(paramOnFinish);
        setMembers(paramDatabase, paramPwGroup, paramGroupBaseActivity, paramBoolean);
    }

    public DeleteGroup(Database paramDatabase, PwGroup paramPwGroup, OnFinish paramOnFinish, boolean paramBoolean) {
        super(paramOnFinish);
        setMembers(paramDatabase, paramPwGroup, null, paramBoolean);
    }

    private void setMembers(Database paramDatabase, PwGroup paramPwGroup, GroupBaseActivity paramGroupBaseActivity, boolean paramBoolean) {
        this.mDb = paramDatabase;
        this.mGroup = paramPwGroup;
        this.mAct = paramGroupBaseActivity;
        this.mDontSave = paramBoolean;
        this.mFinish = new AfterDelete(this.mFinish);
    }

    public void run() {
        Object localObject = new ArrayList(this.mGroup.childEntries);
        int i = 0;
        while (i < ((List) localObject).size()) {
            new DeleteEntry(this.mAct, this.mDb, (PwEntry) ((List) localObject).get(i), null, true).run();
            i += 1;
        }
        localObject = new ArrayList(this.mGroup.childGroups);
        i = 0;
        while (i < ((List) localObject).size()) {
            new DeleteGroup(this.mDb, (PwGroup) ((List) localObject).get(i), this.mAct, null, true).run();
            i += 1;
        }
        localObject = this.mGroup.getParent();
        if (localObject != null) {
            ((PwGroup) localObject).childGroups.remove(this.mGroup);
        }
        this.mDb.pm.getGroups().remove(this.mGroup);
        new SaveDB(this.mAct, this.mDb, this.mFinish, this.mDontSave).run();
    }

    private class AfterDelete
            extends OnFinish {
        public AfterDelete(OnFinish paramOnFinish) {
            super();
        }

        public void run() {
            if (this.mSuccess) {
                DeleteGroup.this.mDb.pm.groups.remove(DeleteGroup.this.mGroup.getId());
                DeleteGroup.this.mDb.dirty.remove(DeleteGroup.this.mGroup);
                PwGroup localPwGroup = DeleteGroup.this.mGroup.getParent();
                if (localPwGroup != null) {
                    DeleteGroup.this.mDb.dirty.add(localPwGroup);
                }
                DeleteGroup.this.mDb.dirty.add(DeleteGroup.this.mDb.pm.rootGroup);
            }
            for (; ; ) {
                super.run();
                return;
                App.setShutdown();
            }
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/edit/DeleteGroup.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */