package com.keepassdroid.utils;

import java.util.UUID;

public class UuidUtil
{
  private static char byteToChar(char paramChar)
  {
    if (paramChar >= '\n') {
      return (char)(paramChar + 'A' - 10);
    }
    return (char)(paramChar + '0');
  }
  
  public static String toHexString(UUID paramUUID)
  {
    if (paramUUID == null) {}
    do
    {
      return null;
      paramUUID = Types.UUIDtoBytes(paramUUID);
    } while (paramUUID == null);
    int j = paramUUID.length;
    if (j == 0) {
      return "";
    }
    StringBuilder localStringBuilder = new StringBuilder();
    int i = 0;
    while (i < j)
    {
      int k = (short)(paramUUID[i] & 0xFF);
      char c1 = (char)(k >>> 4);
      char c2 = (char)(k & 0xF);
      byteToChar(c1);
      byteToChar(c2);
      localStringBuilder.append(byteToChar(c1));
      localStringBuilder.append(byteToChar(c2));
      i += 1;
    }
    return localStringBuilder.toString();
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/UuidUtil.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */