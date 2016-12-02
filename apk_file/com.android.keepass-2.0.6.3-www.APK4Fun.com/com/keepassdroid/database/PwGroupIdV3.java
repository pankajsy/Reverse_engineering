package com.keepassdroid.database;

public class PwGroupIdV3
        extends PwGroupId {
    private int id;

    public PwGroupIdV3(int paramInt) {
        this.id = paramInt;
    }

    public boolean equals(Object paramObject) {
        if (!(paramObject instanceof PwGroupIdV3)) {
        }
        do {
            return false;
            paramObject = (PwGroupIdV3) paramObject;
        } while (this.id != ((PwGroupIdV3) paramObject).id);
        return true;
    }

    public int getId() {
        return this.id;
    }

    public int hashCode() {
        return Integer.valueOf(this.id).hashCode();
    }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwGroupIdV3.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */