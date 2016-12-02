package com.keepassdroid.utils;

import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwEntry;

public class SprEngine
{
  private static SprEngine spr = new SprEngine();
  private static SprEngineV4 sprV4 = new SprEngineV4();
  
  public static SprEngine getInstance(PwDatabase paramPwDatabase)
  {
    if ((paramPwDatabase instanceof PwDatabaseV4)) {
      return sprV4;
    }
    return spr;
  }
  
  public String compile(String paramString, PwEntry paramPwEntry, PwDatabase paramPwDatabase)
  {
    return paramString;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/SprEngine.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */