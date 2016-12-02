package com.keepassdroid.database;

import java.util.Date;

public abstract interface ITimeLogger {
    public abstract boolean expires();

    public abstract Date getCreationTime();

    public abstract void setCreationTime(Date paramDate);

    public abstract Date getExpiryTime();

    public abstract void setExpiryTime(Date paramDate);

    public abstract Date getLastAccessTime();

    public abstract void setLastAccessTime(Date paramDate);

    public abstract Date getLastModificationTime();

    public abstract void setLastModificationTime(Date paramDate);

    public abstract Date getLocationChanged();

    public abstract void setLocationChanged(Date paramDate);

    public abstract long getUsageCount();

    public abstract void setUsageCount(long paramLong);

    public abstract void setExpires(boolean paramBoolean);
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/ITimeLogger.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */