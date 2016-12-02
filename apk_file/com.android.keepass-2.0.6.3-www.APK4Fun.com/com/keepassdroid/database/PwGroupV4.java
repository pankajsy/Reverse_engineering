package com.keepassdroid.database;

import java.util.Date;
import java.util.List;
import java.util.UUID;

public class PwGroupV4
        extends PwGroup
        implements ITimeLogger {
    public static final boolean DEFAULT_SEARCHING_ENABLED = true;

    static {
        if (!PwGroupV4.class.desiredAssertionStatus()) {
        }
        for (boolean bool = true; ; bool = false) {
            $assertionsDisabled = bool;
            return;
        }
    }

    public PwIconCustom customIcon = PwIconCustom.ZERO;
    public String defaultAutoTypeSequence = "";
    public Boolean enableAutoType = null;
    public Boolean enableSearching = null;
    public boolean isExpanded = true;
    public UUID lastTopVisibleEntry = PwDatabaseV4.UUID_ZERO;
    public String notes = "";
    public PwGroupV4 parent = null;
    public UUID uuid = PwDatabaseV4.UUID_ZERO;
    private Date creation = PwDatabaseV4.DEFAULT_NOW;
    private Date expireDate = PwDatabaseV4.DEFAULT_NOW;
    private boolean expires = false;
    private Date lastAccess = PwDatabaseV4.DEFAULT_NOW;
    private Date lastMod = PwDatabaseV4.DEFAULT_NOW;
    private Date parentGroupLastMod = PwDatabaseV4.DEFAULT_NOW;
    private long usageCount = 0L;

    public PwGroupV4() {
    }

    public PwGroupV4(boolean paramBoolean1, boolean paramBoolean2, String paramString, PwIconStandard paramPwIconStandard) {
        if (paramBoolean1) {
            this.uuid = UUID.randomUUID();
        }
        if (paramBoolean2) {
            Date localDate = new Date();
            this.lastAccess = localDate;
            this.lastMod = localDate;
            this.creation = localDate;
        }
        this.name = paramString;
        this.icon = paramPwIconStandard;
    }

    public void AddEntry(PwEntryV4 paramPwEntryV4, boolean paramBoolean) {
        AddEntry(paramPwEntryV4, paramBoolean, false);
    }

    public void AddEntry(PwEntryV4 paramPwEntryV4, boolean paramBoolean1, boolean paramBoolean2) {
        assert (paramPwEntryV4 != null);
        this.childEntries.add(paramPwEntryV4);
        if (paramBoolean1) {
            paramPwEntryV4.parent = this;
        }
        if (paramBoolean2) {
            paramPwEntryV4.setLocationChanged(new Date(System.currentTimeMillis()));
        }
    }

    public void AddGroup(PwGroupV4 paramPwGroupV4, boolean paramBoolean) {
        AddGroup(paramPwGroupV4, paramBoolean, false);
    }

    public void AddGroup(PwGroupV4 paramPwGroupV4, boolean paramBoolean1, boolean paramBoolean2) {
        if (paramPwGroupV4 == null) {
            throw new RuntimeException("subGroup");
        }
        this.childGroups.add(paramPwGroupV4);
        if (paramBoolean1) {
            paramPwGroupV4.parent = this;
        }
        if (paramBoolean2) {
            paramPwGroupV4.parentGroupLastMod = new Date(System.currentTimeMillis());
        }
    }

    public void buildChildEntriesRecursive(List<PwEntry> paramList) {
        int i = 0;
        while (i < this.childEntries.size()) {
            paramList.add(this.childEntries.get(i));
            i += 1;
        }
        i = 0;
        while (i < this.childGroups.size()) {
            ((PwGroupV4) this.childGroups.get(i)).buildChildEntriesRecursive(paramList);
            i += 1;
        }
    }

    public void buildChildGroupsRecursive(List<PwGroup> paramList) {
        paramList.add(this);
        int i = 0;
        while (i < this.childGroups.size()) {
            ((PwGroupV4) this.childGroups.get(i)).buildChildGroupsRecursive(paramList);
            i += 1;
        }
    }

    public boolean expires() {
        return this.expires;
    }

    public Date getCreationTime() {
        return this.creation;
    }

    public void setCreationTime(Date paramDate) {
        this.creation = paramDate;
    }

    public Date getExpiryTime() {
        return this.expireDate;
    }

    public void setExpiryTime(Date paramDate) {
        this.expireDate = paramDate;
    }

    public PwIcon getIcon() {
        if ((this.customIcon == null) || (this.customIcon.uuid.equals(PwDatabaseV4.UUID_ZERO))) {
            return super.getIcon();
        }
        return this.customIcon;
    }

    public PwGroupId getId() {
        return new PwGroupIdV4(this.uuid);
    }

    public void setId(PwGroupId paramPwGroupId) {
        this.uuid = ((PwGroupIdV4) paramPwGroupId).getId();
    }

    public Date getLastAccessTime() {
        return this.lastAccess;
    }

    public void setLastAccessTime(Date paramDate) {
        this.lastAccess = paramDate;
    }

    public Date getLastMod() {
        return this.parentGroupLastMod;
    }

    public Date getLastModificationTime() {
        return this.lastMod;
    }

    public void setLastModificationTime(Date paramDate) {
        this.lastMod = paramDate;
    }

    public Date getLocationChanged() {
        return this.parentGroupLastMod;
    }

    public void setLocationChanged(Date paramDate) {
        this.parentGroupLastMod = paramDate;
    }

    public String getName() {
        return this.name;
    }

    public PwGroup getParent() {
        return this.parent;
    }

    public void setParent(PwGroup paramPwGroup) {
        this.parent = ((PwGroupV4) paramPwGroup);
    }

    public long getUsageCount() {
        return this.usageCount;
    }

    public void setUsageCount(long paramLong) {
        this.usageCount = paramLong;
    }

    public void initNewGroup(String paramString, PwGroupId paramPwGroupId) {
        super.initNewGroup(paramString, paramPwGroupId);
        paramString = new Date();
        this.parentGroupLastMod = paramString;
        this.creation = paramString;
        this.lastMod = paramString;
        this.lastAccess = paramString;
    }

    public boolean isSearchEnabled() {
        for (PwGroupV4 localPwGroupV4 = this; localPwGroupV4 != null; localPwGroupV4 = localPwGroupV4.parent) {
            Boolean localBoolean = localPwGroupV4.enableSearching;
            if (localBoolean != null) {
                return localBoolean.booleanValue();
            }
        }
        return true;
    }

    public void setExpires(boolean paramBoolean) {
        this.expires = paramBoolean;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwGroupV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */