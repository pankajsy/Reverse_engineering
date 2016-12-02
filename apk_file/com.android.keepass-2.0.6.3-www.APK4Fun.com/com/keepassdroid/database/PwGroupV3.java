package com.keepassdroid.database;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

public class PwGroupV3
        extends PwGroup {
    public static final int BUF_SIZE = 124;
    public static final Date NEVER_EXPIRE = PwEntryV3.NEVER_EXPIRE;
    public int flags;
    public int groupId;
    public int level;
    public PwGroupV3 parent = null;
    public PwDate tCreation;
    public PwDate tExpire;
    public PwDate tLastAccess;
    public PwDate tLastMod;

    public PwGroupId getId() {
        return new PwGroupIdV3(this.groupId);
    }

    public void setId(PwGroupId paramPwGroupId) {
        this.groupId = ((PwGroupIdV3) paramPwGroupId).getId();
    }

    public Date getLastMod() {
        return this.tLastMod.getJDate();
    }

    public String getName() {
        return this.name;
    }

    public PwGroup getParent() {
        return this.parent;
    }

    public void setParent(PwGroup paramPwGroup) {
        this.parent = ((PwGroupV3) paramPwGroup);
        this.level = (this.parent.level + 1);
    }

    public void initNewGroup(String paramString, PwGroupId paramPwGroupId) {
        super.initNewGroup(paramString, paramPwGroupId);
        paramString = Calendar.getInstance().getTime();
        this.tCreation = new PwDate(paramString);
        this.tLastAccess = new PwDate(paramString);
        this.tLastMod = new PwDate(paramString);
        this.tExpire = new PwDate(NEVER_EXPIRE);
    }

    public void populateBlankFields(PwDatabaseV3 paramPwDatabaseV3) {
        if (this.icon == null) {
            this.icon = paramPwDatabaseV3.iconFactory.getIcon(1);
        }
        if (this.name == null) {
            this.name = "";
        }
        if (this.tCreation == null) {
            this.tCreation = PwEntryV3.DEFAULT_PWDATE;
        }
        if (this.tLastMod == null) {
            this.tLastMod = PwEntryV3.DEFAULT_PWDATE;
        }
        if (this.tLastAccess == null) {
            this.tLastAccess = PwEntryV3.DEFAULT_PWDATE;
        }
        if (this.tExpire == null) {
            this.tExpire = PwEntryV3.DEFAULT_PWDATE;
        }
    }

    public void setGroups(List<PwGroup> paramList) {
        this.childGroups = paramList;
    }

    public void setLastAccessTime(Date paramDate) {
        this.tLastAccess = new PwDate(paramDate);
    }

    public void setLastModificationTime(Date paramDate) {
        this.tLastMod = new PwDate(paramDate);
    }

    public String toString() {
        return this.name;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwGroupV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */