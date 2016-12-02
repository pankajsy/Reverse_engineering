package com.keepassdroid.database;

import java.util.UUID;

public class PwGroupIdV4
  extends PwGroupId
{
  private UUID uuid;
  
  public PwGroupIdV4(UUID paramUUID)
  {
    this.uuid = paramUUID;
  }
  
  public boolean equals(Object paramObject)
  {
    if (!(paramObject instanceof PwGroupIdV4)) {
      return false;
    }
    paramObject = (PwGroupIdV4)paramObject;
    return this.uuid.equals(((PwGroupIdV4)paramObject).uuid);
  }
  
  public UUID getId()
  {
    return this.uuid;
  }
  
  public int hashCode()
  {
    return this.uuid.hashCode();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwGroupIdV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */