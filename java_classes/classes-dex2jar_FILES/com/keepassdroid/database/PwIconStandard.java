package com.keepassdroid.database;

public class PwIconStandard
  extends PwIcon
{
  public static PwIconStandard FIRST = new PwIconStandard(1);
  public static final int FOLDER = 48;
  public static final int TRASH_BIN = 43;
  public final int iconId;
  
  public PwIconStandard(int paramInt)
  {
    this.iconId = paramInt;
  }
  
  public boolean equals(Object paramObject)
  {
    if (this == paramObject) {}
    do
    {
      return true;
      if (paramObject == null) {
        return false;
      }
      if (getClass() != paramObject.getClass()) {
        return false;
      }
      paramObject = (PwIconStandard)paramObject;
    } while (this.iconId == ((PwIconStandard)paramObject).iconId);
    return false;
  }
  
  public int hashCode()
  {
    return this.iconId + 31;
  }
  
  public boolean isMetaStreamIcon()
  {
    return this.iconId == 0;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/database/PwIconStandard.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */