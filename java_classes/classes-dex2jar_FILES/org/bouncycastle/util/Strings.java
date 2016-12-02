package org.bouncycastle.util;

import java.io.ByteArrayOutputStream;
import java.util.Vector;

public final class Strings
{
  public static String fromUTF8ByteArray(byte[] paramArrayOfByte)
  {
    int k = 0;
    int m = 0;
    while (k < paramArrayOfByte.length)
    {
      m += 1;
      if ((paramArrayOfByte[k] & 0xF0) == 240)
      {
        m += 1;
        k += 4;
      }
      else if ((paramArrayOfByte[k] & 0xE0) == 224)
      {
        k += 3;
      }
      else if ((paramArrayOfByte[k] & 0xC0) == 192)
      {
        k += 2;
      }
      else
      {
        k += 1;
      }
    }
    char[] arrayOfChar = new char[m];
    k = 0;
    m = 0;
    if (k < paramArrayOfByte.length)
    {
      int i;
      if ((paramArrayOfByte[k] & 0xF0) == 240)
      {
        int n = ((paramArrayOfByte[k] & 0x3) << 18 | (paramArrayOfByte[(k + 1)] & 0x3F) << 12 | (paramArrayOfByte[(k + 2)] & 0x3F) << 6 | paramArrayOfByte[(k + 3)] & 0x3F) - 65536;
        int j = (char)(0xD800 | n >> 10);
        i = (char)(0xDC00 | n & 0x3FF);
        arrayOfChar[m] = j;
        k += 4;
        m += 1;
      }
      for (;;)
      {
        arrayOfChar[m] = i;
        m += 1;
        break;
        if ((paramArrayOfByte[k] & 0xE0) == 224)
        {
          i = (char)((paramArrayOfByte[k] & 0xF) << 12 | (paramArrayOfByte[(k + 1)] & 0x3F) << 6 | paramArrayOfByte[(k + 2)] & 0x3F);
          k += 3;
        }
        else if ((paramArrayOfByte[k] & 0xD0) == 208)
        {
          i = (char)((paramArrayOfByte[k] & 0x1F) << 6 | paramArrayOfByte[(k + 1)] & 0x3F);
          k += 2;
        }
        else if ((paramArrayOfByte[k] & 0xC0) == 192)
        {
          i = (char)((paramArrayOfByte[k] & 0x1F) << 6 | paramArrayOfByte[(k + 1)] & 0x3F);
          k += 2;
        }
        else
        {
          i = (char)(paramArrayOfByte[k] & 0xFF);
          k += 1;
        }
      }
    }
    return new String(arrayOfChar);
  }
  
  public static String[] split(String paramString, char paramChar)
  {
    Vector localVector = new Vector();
    int i = 1;
    while (i != 0)
    {
      int j = paramString.indexOf(paramChar);
      if (j > 0)
      {
        localVector.addElement(paramString.substring(0, j));
        paramString = paramString.substring(j + 1);
      }
      else
      {
        i = 0;
        localVector.addElement(paramString);
      }
    }
    paramString = new String[localVector.size()];
    paramChar = '\000';
    while (paramChar != paramString.length)
    {
      paramString[paramChar] = ((String)localVector.elementAt(paramChar));
      paramChar += '\001';
    }
    return paramString;
  }
  
  public static byte[] toByteArray(String paramString)
  {
    byte[] arrayOfByte = new byte[paramString.length()];
    int i = 0;
    while (i != arrayOfByte.length)
    {
      arrayOfByte[i] = ((byte)paramString.charAt(i));
      i += 1;
    }
    return arrayOfByte;
  }
  
  public static String toLowerCase(String paramString)
  {
    int j = 0;
    char[] arrayOfChar = paramString.toCharArray();
    int i = 0;
    while (i != arrayOfChar.length)
    {
      int m = arrayOfChar[i];
      int k = j;
      if (65 <= m)
      {
        k = j;
        if (90 >= m)
        {
          k = 1;
          arrayOfChar[i] = ((char)(m - 65 + 97));
        }
      }
      i += 1;
      j = k;
    }
    if (j != 0) {
      paramString = new String(arrayOfChar);
    }
    return paramString;
  }
  
  public static byte[] toUTF8ByteArray(String paramString)
  {
    return toUTF8ByteArray(paramString.toCharArray());
  }
  
  public static byte[] toUTF8ByteArray(char[] paramArrayOfChar)
  {
    ByteArrayOutputStream localByteArrayOutputStream = new ByteArrayOutputStream();
    int i = 0;
    if (i < paramArrayOfChar.length)
    {
      int j = paramArrayOfChar[i];
      if (j < 128) {
        localByteArrayOutputStream.write(j);
      }
      for (;;)
      {
        i += 1;
        break;
        if (j < 2048)
        {
          localByteArrayOutputStream.write(j >> 6 | 0xC0);
          localByteArrayOutputStream.write(j & 0x3F | 0x80);
        }
        else if ((j >= 55296) && (j <= 57343))
        {
          if (i + 1 >= paramArrayOfChar.length) {
            throw new IllegalStateException("invalid UTF-16 codepoint");
          }
          i += 1;
          int k = paramArrayOfChar[i];
          if (j > 56319) {
            throw new IllegalStateException("invalid UTF-16 codepoint");
          }
          j = ((j & 0x3FF) << 10 | k & 0x3FF) + 65536;
          localByteArrayOutputStream.write(j >> 18 | 0xF0);
          localByteArrayOutputStream.write(j >> 12 & 0x3F | 0x80);
          localByteArrayOutputStream.write(j >> 6 & 0x3F | 0x80);
          localByteArrayOutputStream.write(j & 0x3F | 0x80);
        }
        else
        {
          localByteArrayOutputStream.write(j >> 12 | 0xE0);
          localByteArrayOutputStream.write(j >> 6 & 0x3F | 0x80);
          localByteArrayOutputStream.write(j & 0x3F | 0x80);
        }
      }
    }
    return localByteArrayOutputStream.toByteArray();
  }
  
  public static String toUpperCase(String paramString)
  {
    int j = 0;
    char[] arrayOfChar = paramString.toCharArray();
    int i = 0;
    while (i != arrayOfChar.length)
    {
      int m = arrayOfChar[i];
      int k = j;
      if (97 <= m)
      {
        k = j;
        if (122 >= m)
        {
          k = 1;
          arrayOfChar[i] = ((char)(m - 97 + 65));
        }
      }
      i += 1;
      j = k;
    }
    if (j != 0) {
      paramString = new String(arrayOfChar);
    }
    return paramString;
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/org/bouncycastle/util/Strings.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */