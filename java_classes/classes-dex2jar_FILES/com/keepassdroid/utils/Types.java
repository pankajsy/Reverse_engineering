package com.keepassdroid.utils;

import com.keepassdroid.stream.LEDataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

public class Types
{
  private static final String CRLF;
  private static final byte[] CRLFbuf = { 13, 10 };
  private static final boolean REPLACE;
  private static final String SEP;
  
  static
  {
    CRLF = new String(CRLFbuf);
    SEP = System.getProperty("line.separator");
    if (!SEP.equals(CRLF)) {}
    for (boolean bool = true;; bool = false)
    {
      REPLACE = bool;
      return;
    }
  }
  
  public static byte[] UUIDtoBytes(UUID paramUUID)
  {
    byte[] arrayOfByte = new byte[16];
    LEDataOutputStream.writeLong(paramUUID.getMostSignificantBits(), arrayOfByte, 0);
    LEDataOutputStream.writeLong(paramUUID.getLeastSignificantBits(), arrayOfByte, 8);
    return arrayOfByte;
  }
  
  public static UUID bytestoUUID(byte[] paramArrayOfByte)
  {
    return bytestoUUID(paramArrayOfByte, 0);
  }
  
  public static UUID bytestoUUID(byte[] paramArrayOfByte, int paramInt)
  {
    long l1 = 0L;
    int i = 15;
    while (i >= 8)
    {
      l1 = l1 << 8 | paramArrayOfByte[(i + paramInt)] & 0xFF;
      i -= 1;
    }
    long l2 = 0L;
    i = 7;
    while (i >= 0)
    {
      l2 = l2 << 8 | paramArrayOfByte[(i + paramInt)] & 0xFF;
      i -= 1;
    }
    return new UUID(l2, l1);
  }
  
  public static byte[] extract(byte[] paramArrayOfByte, int paramInt1, int paramInt2)
  {
    byte[] arrayOfByte = new byte[paramInt2];
    System.arraycopy(paramArrayOfByte, paramInt1, arrayOfByte, 0, paramInt2);
    return arrayOfByte;
  }
  
  public static String readCString(byte[] paramArrayOfByte, int paramInt)
    throws UnsupportedEncodingException
  {
    String str = new String(paramArrayOfByte, paramInt, strlen(paramArrayOfByte, paramInt), "UTF-8");
    paramArrayOfByte = str;
    if (REPLACE) {
      paramArrayOfByte = str.replace(CRLF, SEP);
    }
    return paramArrayOfByte;
  }
  
  public static int readUByte(byte[] paramArrayOfByte, int paramInt)
  {
    return paramArrayOfByte[paramInt] & 0xFF;
  }
  
  public static int strlen(byte[] paramArrayOfByte, int paramInt)
  {
    int i = 0;
    while (paramArrayOfByte[(paramInt + i)] != 0) {
      i += 1;
    }
    return i;
  }
  
  public static int writeCString(String paramString, OutputStream paramOutputStream)
    throws IOException
  {
    if (paramString == null)
    {
      paramOutputStream.write(LEDataOutputStream.writeIntBuf(1));
      paramOutputStream.write(0);
      return 0;
    }
    String str = paramString;
    if (REPLACE) {
      str = paramString.replace(SEP, CRLF);
    }
    paramString = str.getBytes("UTF-8");
    int i = paramString.length + 1;
    paramOutputStream.write(LEDataOutputStream.writeIntBuf(i));
    paramOutputStream.write(paramString);
    paramOutputStream.write(0);
    return i;
  }
  
  public static byte writeUByte(int paramInt)
  {
    byte[] arrayOfByte = new byte[1];
    writeUByte(paramInt, arrayOfByte, 0);
    return arrayOfByte[0];
  }
  
  public static void writeUByte(int paramInt1, byte[] paramArrayOfByte, int paramInt2)
  {
    paramArrayOfByte[paramInt2] = ((byte)(paramInt1 & 0xFF));
  }
}


/* Location:              /home/pankaj/reverse_engineering/dex2jar-2.0/classes-dex2jar.jar!/com/keepassdroid/utils/Types.class
 * Java compiler version: 6 (50.0)
 * JD-Core Version:       0.7.1
 */