package com.keepassdroid.database;

import java.util.UUID;

public class PwIconCustom
  extends PwIcon
{
  public static final PwIconCustom ZERO = new PwIconCustom(PwDatabaseV4.UUID_ZERO, new byte[0]);
  public byte[] imageData;
  public final UUID uuid;
  
  public PwIconCustom(UUID paramUUID, byte[] paramArrayOfByte)
  {
    this.uuid = paramUUID;
    this.imageData = paramArrayOfByte;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      do
      {
        return true;
        if (paramObject == null) {
          return false;
        }
        if (getClass() != paramObject.getClass()) {
          return false;
        }
        paramObject = (PwIconCustom)paramObject;
        if (this.uuid != null) {
          break;
        }
      } while (((PwIconCustom)paramObject).uuid == null);
      return false;
    } while (this.uuid.equals(((PwIconCustom)paramObject).uuid));
    return false;
  }
  
  public int hashCode()
  {
    if (this.uuid == null) {}
    for (int i = 0;; i = this.uuid.hashCode()) {
      return i + 31;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwIconCustom.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */