package com.keepassdroid.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

public class StrUtil
{
  public static int indexOfIgnoreCase(String paramString1, String paramString2, int paramInt, Locale paramLocale)
  {
    if ((paramString1 == null) || (paramString2 == null)) {
      return -1;
    }
    return paramString1.toLowerCase(paramLocale).indexOf(paramString2.toLowerCase(paramLocale), paramInt);
  }
  
  public static int indexOfIgnoreCase(String paramString1, String paramString2, Locale paramLocale)
  {
    return indexOfIgnoreCase(paramString1, paramString2, 0, paramLocale);
  }
  
  public static String replaceAllIgnoresCase(String paramString1, String paramString2, String paramString3, Locale paramLocale)
  {
    String str = paramString1;
    if (paramString1 != null)
    {
      str = paramString1;
      if (paramString2 != null)
      {
        if (paramString3 != null) {
          break label24;
        }
        str = paramString1;
      }
    }
    return str;
    label24:
    int i = 0;
    for (;;)
    {
      str = paramString1;
      if (i >= paramString1.length()) {
        break;
      }
      i = indexOfIgnoreCase(paramString1, paramString2, i, paramLocale);
      str = paramString1;
      if (i < 0) {
        break;
      }
      str = paramString1.substring(0, i);
      paramString1 = paramString1.substring(paramString2.length() + i);
      paramString1 = str.concat(paramString3).concat(paramString1);
      i += paramString3.length();
    }
  }
  
  public static List<String> splitSearchTerms(String paramString)
  {
    ArrayList localArrayList = new ArrayList();
    if (paramString == null) {}
    StringBuilder localStringBuilder;
    label124:
    do
    {
      return localArrayList;
      localStringBuilder = new StringBuilder();
      int i = 0;
      int j = 0;
      if (j < paramString.length())
      {
        char c = paramString.charAt(j);
        int k;
        if ((c != ' ') && (c != '\t') && (c != '\r'))
        {
          k = i;
          if (c != '\n') {}
        }
        else
        {
          k = i;
          if (i == 0)
          {
            k = localStringBuilder.length();
            if (k <= 0) {
              break label124;
            }
            localArrayList.add(localStringBuilder.toString());
            localStringBuilder.delete(0, k);
            k = i;
          }
        }
        for (;;)
        {
          j += 1;
          i = k;
          break;
          if (c == '"')
          {
            if (i == 0) {}
            for (i = 1;; i = 0)
            {
              k = i;
              break;
            }
          }
          localStringBuilder.append(c);
          k = i;
        }
      }
    } while (localStringBuilder.length() <= 0);
    localArrayList.add(localStringBuilder.toString());
    return localArrayList;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/StrUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */