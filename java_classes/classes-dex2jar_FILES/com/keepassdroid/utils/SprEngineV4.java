package com.keepassdroid.utils;

import com.keepassdroid.database.PwDatabase;
import com.keepassdroid.database.PwDatabaseV4;
import com.keepassdroid.database.PwEntry;
import com.keepassdroid.database.PwEntryV4;
import com.keepassdroid.database.PwGroup;
import com.keepassdroid.database.SearchParametersV4;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.UUID;

public class SprEngineV4
  extends SprEngine
{
  private final int MAX_RECURSION_DEPTH = 12;
  private final String STR_REF_END = "}";
  private final String STR_REF_START = "{REF:";
  
  private void addRefsToCache(String paramString1, String paramString2, SprContextV4 paramSprContextV4)
  {
    if (paramString1 == null) {}
    while ((paramString2 == null) || (paramSprContextV4 == null) || (paramSprContextV4.refsCache.containsKey(paramString1))) {
      return;
    }
    paramSprContextV4.refsCache.put(paramString1, paramString2);
  }
  
  private String compileInternal(String paramString, SprContextV4 paramSprContextV4, int paramInt)
  {
    if (paramString == null) {
      return "";
    }
    if (paramSprContextV4 == null) {
      return "";
    }
    if (paramInt >= 12) {
      return "";
    }
    return fillRefPlaceholders(paramString, paramSprContextV4, paramInt);
  }
  
  private String fillRefPlaceholders(String paramString, SprContextV4 paramSprContextV4, int paramInt)
  {
    if (paramSprContextV4.db == null) {
      return paramString;
    }
    int k = 0;
    int j = 0;
    Object localObject1 = paramString;
    String str;
    int m;
    if (j < 20)
    {
      str = fillRefsUsingCache(paramString, paramSprContextV4);
      m = StrUtil.indexOfIgnoreCase(str, "{REF:", k, Locale.ENGLISH);
      if (m >= 0) {
        break label59;
      }
      localObject1 = str;
    }
    label59:
    do
    {
      return (String)localObject1;
      i = StrUtil.indexOfIgnoreCase(str, "}", m + 1, Locale.ENGLISH);
      localObject1 = str;
    } while (i <= m);
    localObject1 = str.substring(m, i - m + 1);
    Object localObject2 = findRefTarget((String)localObject1, paramSprContextV4);
    int i = k;
    paramString = str;
    PwEntryV4 localPwEntryV4;
    if (localObject2 != null)
    {
      localPwEntryV4 = ((TargetResult)localObject2).entry;
      i = ((TargetResult)localObject2).wanted;
      if (localPwEntryV4 == null) {
        break label328;
      }
      switch (i)
      {
      default: 
        i = m + 1;
        paramString = str;
      }
    }
    for (;;)
    {
      j += 1;
      k = i;
      break;
      paramString = localPwEntryV4.getTitle();
      for (;;)
      {
        localObject2 = (SprContextV4)paramSprContextV4.clone();
        ((SprContextV4)localObject2).entry = localPwEntryV4;
        addRefsToCache((String)localObject1, compileInternal(paramString, (SprContextV4)localObject2, paramInt + 1), paramSprContextV4);
        paramString = fillRefsUsingCache(str, paramSprContextV4);
        i = k;
        break;
        paramString = localPwEntryV4.getUsername();
        continue;
        paramString = localPwEntryV4.getUrl();
        continue;
        paramString = localPwEntryV4.getPassword();
        continue;
        paramString = localPwEntryV4.getNotes();
        continue;
        paramString = localPwEntryV4.getUUID().toString();
      }
      label328:
      i = m + 1;
      paramString = str;
    }
  }
  
  private String fillRefsUsingCache(String paramString, SprContextV4 paramSprContextV4)
  {
    paramSprContextV4 = paramSprContextV4.refsCache.entrySet().iterator();
    while (paramSprContextV4.hasNext())
    {
      Map.Entry localEntry = (Map.Entry)paramSprContextV4.next();
      paramString = StrUtil.replaceAllIgnoresCase(paramString, (String)localEntry.getKey(), (String)localEntry.getValue(), Locale.ENGLISH);
    }
    return paramString;
  }
  
  public String compile(String paramString, PwEntry paramPwEntry, PwDatabase paramPwDatabase)
  {
    return compileInternal(paramString, new SprContextV4((PwDatabaseV4)paramPwDatabase, (PwEntryV4)paramPwEntry), 0);
  }
  
  public TargetResult findRefTarget(String paramString, SprContextV4 paramSprContextV4)
  {
    if (paramString == null) {}
    Object localObject;
    do
    {
      do
      {
        return null;
        paramString = paramString.toUpperCase(Locale.ENGLISH);
      } while ((!paramString.startsWith("{REF:")) || (!paramString.endsWith("}")));
      localObject = paramString.substring("{REF:".length(), paramString.length() - "{REF:".length() - "}".length());
    } while ((((String)localObject).length() <= 4) || (((String)localObject).charAt(1) != '@') || (((String)localObject).charAt(3) != ':'));
    int i = Character.toUpperCase(((String)localObject).charAt(2));
    char c = Character.toUpperCase(((String)localObject).charAt(0));
    paramString = new SearchParametersV4();
    paramString.setupNone();
    paramString.searchString = ((String)localObject).substring(4);
    if (i == 84) {
      paramString.searchInTitles = true;
    }
    for (;;)
    {
      localObject = new ArrayList();
      paramSprContextV4.db.rootGroup.searchEntries(paramString, (List)localObject);
      if (((List)localObject).size() <= 0) {
        break;
      }
      return new TargetResult((PwEntryV4)((List)localObject).get(0), c);
      if (i == 85)
      {
        paramString.searchInUserNames = true;
      }
      else if (i == 65)
      {
        paramString.searchInUrls = true;
      }
      else if (i == 80)
      {
        paramString.searchInPasswords = true;
      }
      else if (i == 78)
      {
        paramString.searchInNotes = true;
      }
      else if (i == 73)
      {
        paramString.searchInUUIDs = true;
      }
      else
      {
        if (i != 79) {
          break;
        }
        paramString.searchInOther = true;
      }
    }
  }
  
  public class TargetResult
  {
    public PwEntryV4 entry;
    public char wanted;
    
    public TargetResult(PwEntryV4 paramPwEntryV4, char paramChar)
    {
      this.entry = paramPwEntryV4;
      this.wanted = paramChar;
    }
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/SprEngineV4.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */