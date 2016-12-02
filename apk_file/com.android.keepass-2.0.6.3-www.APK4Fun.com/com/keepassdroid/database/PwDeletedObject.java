package com.keepassdroid.database;

import java.util.Date;
import java.util.UUID;

public class PwDeletedObject {
    public UUID uuid;
    private Date deletionTime;

    public PwDeletedObject() {
    }

    public PwDeletedObject(UUID paramUUID) {
        this(paramUUID, new Date());
    }

    public PwDeletedObject(UUID paramUUID, Date paramDate) {
        this.uuid = paramUUID;
        this.deletionTime = paramDate;
    }

    public boolean equals(Object paramObject) {
        boolean bool2 = false;
        boolean bool1;
        if (this == paramObject) {
            bool1 = true;
        }
        do {
            do {
                return bool1;
                bool1 = bool2;
            } while (paramObject == null);
            bool1 = bool2;
        } while (!(paramObject instanceof PwDeletedObject));
        paramObject = (PwDeletedObject) paramObject;
        return this.uuid.equals(((PwDeletedObject) paramObject).uuid);
    }

    public Date getDeletionTime() {
        if (this.deletionTime == null) {
            return new Date(System.currentTimeMillis());
        }
        return this.deletionTime;
    }

    public void setDeletionTime(Date paramDate) {
        this.deletionTime = paramDate;
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwDeletedObject.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */