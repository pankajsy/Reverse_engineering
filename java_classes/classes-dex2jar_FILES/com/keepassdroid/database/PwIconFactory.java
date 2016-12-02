package com.keepassdroid.database;

import java.util.UUID;
import org.apache.commons.collections.map.ReferenceMap;

public class PwIconFactory
{
  private ReferenceMap cache = new ReferenceMap(0, 2);
  private ReferenceMap customCache = new ReferenceMap(0, 2);
  
  public PwIconCustom getIcon(UUID paramUUID)
  {
    PwIconCustom localPwIconCustom2 = (PwIconCustom)this.customCache.get(paramUUID);
    PwIconCustom localPwIconCustom1 = localPwIconCustom2;
    if (localPwIconCustom2 == null)
    {
      localPwIconCustom1 = new PwIconCustom(paramUUID, null);
      this.customCache.put(paramUUID, localPwIconCustom1);
    }
    return localPwIconCustom1;
  }
  
  public PwIconCustom getIcon(UUID paramUUID, byte[] paramArrayOfByte)
  {
    PwIconCustom localPwIconCustom = (PwIconCustom)this.customCache.get(paramUUID);
    if (localPwIconCustom == null)
    {
      paramArrayOfByte = new PwIconCustom(paramUUID, paramArrayOfByte);
      this.customCache.put(paramUUID, paramArrayOfByte);
      return paramArrayOfByte;
    }
    localPwIconCustom.imageData = paramArrayOfByte;
    return localPwIconCustom;
  }
  
  public PwIconStandard getIcon(int paramInt)
  {
    PwIconStandard localPwIconStandard2 = (PwIconStandard)this.cache.get(Integer.valueOf(paramInt));
    PwIconStandard localPwIconStandard1 = localPwIconStandard2;
    if (localPwIconStandard2 == null) {
      if (paramInt != 1) {
        break label45;
      }
    }
    label45:
    for (localPwIconStandard1 = PwIconStandard.FIRST;; localPwIconStandard1 = new PwIconStandard(paramInt))
    {
      this.cache.put(Integer.valueOf(paramInt), localPwIconStandard1);
      return localPwIconStandard1;
    }
  }
  
  public void put(PwIconCustom paramPwIconCustom)
  {
    this.customCache.put(paramPwIconCustom.uuid, paramPwIconCustom);
  }
  
  public void setIconData(UUID paramUUID, byte[] paramArrayOfByte)
  {
    getIcon(paramUUID, paramArrayOfByte);
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwIconFactory.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */