package com.keepassdroid.utils;

import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwEntryV4;
import java.util.HashMap;
import java.util.Map;

public class SprContextV4
  implements Cloneable
{
  public PwDatabaseV4 db;
  public PwEntryV4 entry;
  public Map<String, String> refsCache = new HashMap();
  
  public SprContextV4(PwDatabaseV4 paramPwDatabaseV4, PwEntryV4 paramPwEntryV4)
  {
    this.db = paramPwDatabaseV4;
    this.entry = paramPwEntryV4;
  }
  
  protected Object clone()
  {
    try
    {
      Object localObject = super.clone();
      return localObject;
    }
    catch (CloneNotSupportedException localCloneNotSupportedException) {}
    return null;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/SprContextV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */