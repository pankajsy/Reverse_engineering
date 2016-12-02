package com.keepassdroid;

import android.content.Intent;

import com.keepassdroid.database.PwGroupIdV3;

public class GroupActivityV3
        extends GroupActivity {
    protected PwGroupIdV3 retrieveGroupId(Intent paramIntent) {
        int i = paramIntent.getIntExtra("entry", -1);
        if (i == -1) {
            return null;
        }
        return new PwGroupIdV3(i);
    }

    protected void setupButtons() {
        super.setupButtons();
        if ((!this.isRoot) && (!this.readOnly)) {
        }
        for (boolean bool = true; ; bool = false) {
            this.addEntryEnabled = bool;
            return;
        }
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/GroupActivityV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */